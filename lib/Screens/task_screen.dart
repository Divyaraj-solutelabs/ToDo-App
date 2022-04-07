import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:vid/Modules/addtask.dart';



import 'package:vid/Modules/textfile.dart';
import 'package:vid/hive_db/task_db_hive.dart';
import 'package:vid/provider/dataprovider.dart';
import '../Loginhive/Lginhiv.dart';
import '../Modules/category.dart';

import '../Modules/side_bar.dart';
import '../Modules/todolistitem.dart';



class TaskScreen extends StatefulWidget {

  static String routeName='/task_screen';
  const TaskScreen({Key? key}) : super(key: key);
  @override

  _TaskScreenState createState() => _TaskScreenState();
}



class _TaskScreenState  extends State<TaskScreen>with TickerProviderStateMixin{


  //var khu=Databasehelper.instance.readAllNotes();
  late TextEditingController _searchQuery;
  bool _isSearching = false;
  String searchQuery = "Search query";

  Box box=  Hive.box('login') ;

  var formKey = GlobalKey<FormState>();
  bool autoValidate = false;





  @override
  void initState() {
    super.initState();

    Provider.of<Data>(context,listen: false).datatask();
    setState(() {

    });
    _searchQuery = new TextEditingController();
  }

  void _startSearch() {
    print("open search box");
    ModalRoute
        .of(context)
        ?.addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    print("close search box");
    setState(() {
      _searchQuery.clear();
      updateSearchQuery("Search query");
    });
  }


  Widget _buildSearchField() {
    return new TextField(
      controller: _searchQuery,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: updateSearchQuery,
    );
  }

  void updateSearchQuery(String newQuery) {

    Provider.of<Data>(context , listen: false).filterSearch(newQuery);
    print("search query " + newQuery);

  }

  List<Widget> _buildActions() {

    if (_isSearching) {
      return <Widget>[
        new IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQuery == null || _searchQuery.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      new IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }



  @override
  Widget build(BuildContext context) {

    var l=Provider.of<Data>(context).progress();

   bool isDesktop(BuildContext context) =>
       MediaQuery.of(context).size.width>=1230;
   bool isMobile(BuildContext context) =>
       MediaQuery.of(context).size.width<1230;
    Box box=  Hive.box('login') ;
    final as= box.values.cast<Loginch>();
    //TextEditingController entredTaskName=TextEditingController();
     String entredTaskName="";
    bool d=false;
    String de="";
    String user=as.first.username;
    if(isDesktop(context)){
      return Row(
        children: [
          SizedBox(
            width: 250,
            child: SideBar(),
          ),
          Expanded(
              child: Scaffold(
                //drawer: SideBar(),
                appBar: AppBar(
                  leading: _isSearching ? const BackButton() : Container(),
                  title: _isSearching ? _buildSearchField() : null,
                  actions: _buildActions(),
                  iconTheme: IconThemeData(color: Color(0xFF8BA7EE)),


                ),

                body:  Container(
                        // height: 500,
                        //width: MediaQuery.of(context).size.width-300,
                        alignment: Alignment.topCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [



                            Container(
                              height: 250,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0.0,left: 15, bottom: 25.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      text.a +
                                          user
                                          +  '!',
                                      style:TextStyle(
                                        color: Colors.white,
                                        fontSize: 58,
                                        fontFamily:'Dongle' ,
                                        fontWeight: FontWeight.w700,
                                      ),

                                    ), //What's up divyaraj
                                    Padding(padding:  const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                                      child: Text(text.b,
                                        style: TextStyle(
                                          fontFamily: 'Dongle',
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF8BA7EE), fontSize: 20.0,
                                        ),
                                      ),
                                    ),//Categories
                                    Expanded(
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.only(
                                            left: 10.0),
                                        children: [
                                          Categ(tasksNumb: Provider.of<Data>(context,listen: false).compelete(), catName: text.n),
                                          SizedBox(width: 30,),
                                          Categ(tasksNumb:  Provider.of<Data>(context,listen: false).pending(), catName: text.m),
                                        ],
                                      ),//pending and complete tasks
                                    )
                                  ],
                                ),
                              ),
                            ),

                            // SizedBox(height: 20),
                            Container(
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.only(top: 10,right: 25,left: 25,bottom: 5),
                                child: LinearProgressIndicator(
                                  value: l,
                                  color: Color(0XFFEA04FF),
                                )
                            ),//ProgressBar
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 2.0),
                                child: Container(
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 20),
                                              child: Text(
                                                text.g,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Dongle',
                                                  color: Color(0xFF8BA7EE),
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),//Today's Task

                                          ]
                                      ),
                                      Expanded(
                                       // flex: 2,
                                        child:Container(
                                          //width: MediaQuery.of(context).size.width-350,
                                          child: GridView.builder(gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount:MediaQuery.of(context).size.width>=700?4:2 ,
                                            childAspectRatio: (MediaQuery.of(context).size.width) /
                                                (MediaQuery.of(context).size.height/1.5),
                                          ),itemCount: Provider.of<Data>(context, listen: false).searchresult.isNotEmpty ? Provider.of<Data>(context, listen: false ).searchresult.length:Provider.of<Data>(context, listen: false)
                                              .pitem
                                              .length, itemBuilder: (BuildContext context, int index){
                                            return TodoListItem(
                                              text: Provider.of<Data>(context, listen: false).searchresult.isNotEmpty ? Provider.of<Data>(context, listen: false ).searchresult[index].taskname:
                                              Provider.of<Data>(context, listen: false).pitem[index]
                                                  .taskname,

                                              onPress: () {
                                                //    print(MediaQuery.of(context).size.width);
                                                Provider.of<Data>(context, listen: false)
                                                    .updateTaskStatus(DataModel(
                                                    taskname:  Provider.of<Data>(context, listen: false).pitem[index].taskname,
                                                    complete:Provider.of<Data>(context, listen: false).pitem[index].complete),
                                                    index);
                                                Provider.of<Data>(context,listen: false).datatask();

                                              },
                                              circleColor: Color(0xFF8E13BA),
                                              isChecked:Provider.of<Data>(context, listen: false).searchresult.isNotEmpty ? Provider.of<Data>(context, listen: false ).searchresult[index].complete:
                                              Provider.of<Data>(context, listen: false).pitem[index]
                                                  .complete,
                                              onDelete: () {
                                                // print(MediaQuery.of(context).size.width);

                                                Provider.of<Data>(context, listen: false).deleteTask(index);
                                                Provider.of<Data>(context,listen: false).datatask();


                                                Navigator.pop(context);
                                              },
                                              onIndex:index,
                                            );

                                          }
                                          ),
                                        ),


                                      ),

                                    ],
                                  ),
                                ),
                              ),)
                          ],
                        ),

                      ),








                floatingActionButton: FloatingActionButton(
                  onPressed: (){
                    showDialog(context: context, builder: (BuildContext context)
                    {

                      return AlertDialog(
                        backgroundColor: Color(0xFF344FA1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0))),
                        title:Row
                          (

                          children: [
                            SizedBox(width: 15,),
                            Text(
                              'Add  New Task',
                              style: TextStyle(
                                fontFamily: 'Dongle',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                            SizedBox(width: 150,),
                            Container(

                              child: GestureDetector(
                                child: Icon(Icons.clear,color: Colors.grey,),
                                onTap: (){
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                        content: Column(
                            mainAxisSize:   MainAxisSize.min,
                            children:<Widget>[
                          Container(
                          height: 150,
                          width: 320,
                          child:  Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[



                                Container(
                                  height:50,
                                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    //border: Border.all(width: 2.0, color: Color(0xCBC7C7B3)),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child:Form(
                                    key: formKey,

                                    child: TextFormField(

                                      //controller: entredTaskName,
                                      onChanged: (value){
                                        entredTaskName=value;
                                        if(formKey.currentState!.validate()){

                                        }
                                        },

                                      obscureText: false,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        errorStyle: TextStyle(fontFamily: 'dongle'),

                                        hintText: 'New Task',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Task';
                                        }
                                        return null;
                                      },

                                      // maxLength: 1,

                                    ),

                                  ),
                                                                  ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: TextButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          // If the form is valid, display a snackbar. In the real world,
                                          // you'd often call a server or save the information in a database.
                                          Provider.of<Data>(context, listen: false).addTak(
                                              DataModel(taskname: entredTaskName,complete: false)
                                          );

                                          Provider.of<Data>(context,listen: false).datatask();
                                       //   entredTaskName="";

                                          Navigator.pop(context);

                                        }




                                        //Navigator.pop(context);
                                      },
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 130.0),
                                        ),
                                        backgroundColor: MaterialStateProperty.all(
                                          Colors.green,
                                        ),
                                      ),
                                      child: Text(
                                        'Add',
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontFamily: 'Dongle',
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                              ],
                            ),

                        ),
                            ]
                        ),

                      );
                    });
                  },
                  tooltip: 'Increment',
                  backgroundColor: Color(0XFFEA04FF),
                  child: const Icon(Icons.add),
                ), // This trailing comma makes auto-formatting nicer for build methods.
              ),
          ),
        ],
      );
    }else{
      return WillPopScope(
        onWillPop: () async => false,
        child:
        Scaffold(
          //drawer: SideBar(),
          appBar: AppBar(
            leading: _isSearching ? const BackButton() : Container(),
            title: _isSearching ? _buildSearchField() : null,
            actions: _buildActions(),
            iconTheme: IconThemeData(color: Color(0xFF8BA7EE)),


          ),

          body: Container(
                 // width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [



                      Container(
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                text.a +
                                    user
                                    +  '!',
                                style:TextStyle(
                                  color: Colors.white,
                                  fontSize: 58,
                                  fontFamily: 'Dongle',
                                  fontWeight: FontWeight.w700,
                                ),

                              ), //What's up divyaraj
                              Padding(padding:  const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                                child: Text(text.b,
                                  style: TextStyle(
                                    fontFamily: 'Dongle',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF8BA7EE), fontSize: 20.0,
                                  ),
                                ),
                              ),//Categories
                              Expanded(child: ListView(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.only(
                                    left: 10.0),
                                children: [
                                  Categ(tasksNumb: Provider.of<Data>(context,listen: false).compelete(), catName: text.n),
                                  SizedBox(width: 30,),
                                  Categ(tasksNumb:  Provider.of<Data>(context,listen: false).pending(), catName: text.m),
                                ],
                              ),//pending and complete tasks
                              )
                            ],
                          ),
                        ),
                      ),


                      Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 10,right: 25,left: 25,bottom: 5),
                          child: LinearProgressIndicator(
                            value: l,
                            color: Color(0XFFEA04FF),
                          )
                      ),//ProgressBar
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 14.0, horizontal: 2.0),
                          child: Container(
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 20),
                                        child: Text(
                                          text.g,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Dongle',
                                            color: Color(0xFF8BA7EE),
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),//Today's Task

                                    ]),
                                Expanded(
                                  flex: 2,
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    itemBuilder: (BuildContext context, int index) {
                                      return TodoListItem(
                                        text: Provider.of<Data>(context, listen: false).searchresult.isNotEmpty ? Provider.of<Data>(context, listen: false ).searchresult[index].taskname:
                                        Provider.of<Data>(context, listen: false).pitem[index]
                                            .taskname,

                                        onPress: () {

                                          Provider.of<Data>(context, listen: false)
                                              .updateTaskStatus(DataModel(
                                              taskname:  Provider.of<Data>(context, listen: false).pitem[index].taskname,
                                              complete:Provider.of<Data>(context, listen: false).pitem[index].complete),
                                              index);
                                          Provider.of<Data>(context,listen: false).datatask();

                                        },
                                        circleColor: Color(0xFF8E13BA),
                                        isChecked:Provider.of<Data>(context, listen: false).searchresult.isNotEmpty ? Provider.of<Data>(context, listen: false ).searchresult[index].complete:
                                        Provider.of<Data>(context, listen: false).pitem[index]
                                            .complete,
                                        onDelete: () {

                                          Provider.of<Data>(context, listen: false)
                                              .deleteTask(index);
                                          Provider.of<Data>(context,listen: false).datatask();
                                          print(index);
                                          // await Taskdatabase.instance.deleteTask(index+1);
                                          Navigator.pop(context);
                                        },
                                        onIndex:index,
                                      );
                                    },
                                    itemCount: Provider.of<Data>(context, listen: false).searchresult.isNotEmpty ? Provider.of<Data>(context, listen: false ).searchresult.length:Provider.of<Data>(context, listen: false)
                                        .pitem
                                        .length,

                                  ),

                                ),

                              ],
                            ),
                          ),
                        ),)
                    ],
                  ),
                ),



          floatingActionButton: FloatingActionButton(
            onPressed: (){
              showDialog(context: context, builder: (BuildContext context)
              {

                return AlertDialog(
                  backgroundColor: Color(0xFF344FA1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  title:Row
                    (

                    children: [
                      SizedBox(width: 15,),
                      Text(
                        'Add  New Task',
                        style: TextStyle(
                          fontFamily: 'Dongle',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      SizedBox(width: 150,),
                      Container(

                        child: GestureDetector(
                          child: Icon(Icons.clear,color: Colors.grey,),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  content: Column(
                      mainAxisSize:   MainAxisSize.min,
                      children:<Widget>[
                        Container(
                          height: 150,
                          width: 320,
                          child:  Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[



                              Container(
                                height:50,
                                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                                margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  //border: Border.all(width: 2.0, color: Color(0xCBC7C7B3)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child:Form(
                                  key: formKey,

                                  child: TextFormField(

                                    //controller: entredTaskName,
                                    onChanged: (value){
                                      if(formKey.currentState!.validate()){

                                      }
                                    },

                                    obscureText: false,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      errorStyle: TextStyle(fontFamily: 'dongle'),

                                      hintText: 'New Task',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter Task';
                                      }
                                      return null;
                                    },

                                    // maxLength: 1,

                                  ),

                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: TextButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        Provider.of<Data>(context, listen: false).addTak(
                                            DataModel(taskname: entredTaskName,complete: false)
                                        );

                                        Provider.of<Data>(context,listen: false).datatask();
                                        entredTaskName="";

                                        Navigator.pop(context);

                                      }




                                      //Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all<EdgeInsets>(
                                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 130.0),
                                      ),
                                      backgroundColor: MaterialStateProperty.all(
                                        Colors.green,
                                      ),
                                    ),
                                    child: Text(
                                      'Add',
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontFamily: 'Dongle',
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                            ],
                          ),

                        ),
                      ]
                  ),

                );
              });
            },
            tooltip: 'Increment',
            backgroundColor: Color(0XFFEA04FF),
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      );
    }

  }
}

