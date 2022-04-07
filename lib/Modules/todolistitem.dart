import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vid/hive_db/task_db_hive.dart';
import 'package:vid/provider/dataprovider.dart';





class TodoListItem extends StatelessWidget {
  late final String text;
  late final Color circleColor;
  late bool isChecked;
  final VoidCallback onPress;
  final VoidCallback onDelete;
  final int onIndex;

  TodoListItem({required this.text,
    required this.circleColor,
    required this.isChecked,
    required this.onPress,
    required this.onDelete,
    required this.onIndex,

  });
  var formKey = GlobalKey<FormState>();
late  String edit;
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width>=1230;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width<1230;
  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),

    // color: circleColor,
height:80,


        //color: Color(0xFF344FA1),
     //   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),

       //   padding: EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color(0xFF031956),
            boxShadow: [
              BoxShadow(
                color: Colors.black87.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(isMobile(context))
              isChecked
                  ? GestureDetector(
                onTap: onPress,
                child: Container(
                  padding: EdgeInsets.all(4.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: circleColor,
                  ),
                  child: Icon(
                    Icons.check,
                    size: 15.0,
                    color: Colors.white,
                  ),
                ),
              )
                  : GestureDetector(
                onTap: onPress,
                child: Icon(
                  Icons.circle_outlined,
                  color: circleColor,
                ),
              ),
              if(isMobile(context))
              Container(
                height: 500,
                width: 300,
              alignment: Alignment.centerLeft,
                child:
                      Text(
                        text,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Dongle',
                            fontWeight: FontWeight.w600),
                      ) ,




              ),




              if(isMobile(context))
                Align(
                  alignment: Alignment.centerRight,
                  child:  IconButton(
                      onPressed: (){
                        showDialog(context: context, builder: (BuildContext context)
                        {

                          return Container(

                              child:AlertDialog(

                                backgroundColor: Color(0xFF344FA1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                title:Row
                                  (
                                  children: [
                                    Text(
                                      'Edit Your Task',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontFamily: 'Dongle',
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    SizedBox(width: 190,),
                                    Container(
                                      //   margin: const EdgeInsets.only(left: 40,),
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
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        //border: Border.all(width: 2.0, color: Color(0xCBC7C7B3)),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Form(
                                        key: formKey,
                                        child:TextFormField(
                                          initialValue: text,

                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Cannot be Empty';
                                            }
                                            return null;
                                          },
                                          onChanged: (value){
                                            edit = value;
                                            if(formKey.currentState!.validate()){

                                            }
                                          },
                                          //controller: edit,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Edit Your Task',
                                          ),
                                        ),

                                      ),
                                    ),


                                  ],
                                ),
                                actions: [Container(
                                  width: 320,
                                  height: 50,
                                  alignment:Alignment.center,

                                  child: TextButton(
                                      onPressed: () async{
                                        unfocus() {
                                          var currentFocus = FocusScope.of(context);

                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                        }
                                        unfocus();
                                        print(onIndex);
                                        if(formKey.currentState!.validate()){
                                          Provider.of<Data>(context, listen: false).edittask(isChecked,edit,onIndex);
                                          Provider.of<Data>(context,listen: false).datatask();
                                          Navigator.pop(context);
                                        }

                                      },
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 130),
                                        ),
                                        backgroundColor: MaterialStateProperty.all(
                                          Colors.green,
                                        ),
                                      ),
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Dongle',
                                          color: Colors.white,
                                        ),
                                      )),

                                ),],
                              )
                          );

                        });
                      }, icon: Icon(Icons. edit ,color: Colors.grey,size: 24,)),
                ),

              if(isMobile(context))
                Align(
                  alignment: Alignment.centerLeft,
                  child:  GestureDetector(

                    onTap: (){

                      showDialog(context: context, builder:  (BuildContext context)
                      {

                        return AlertDialog(
                          backgroundColor: Color(0xFF344FA1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0))),

                          content: Container(
                            height: 38,
                            //width: 10,
                            child:  Column(
                                mainAxisSize: MainAxisSize.min,
                                children:<Widget>[
                                  Text('Are you sure to delete this task ? ',
                                    style:  TextStyle(
                                      fontFamily: 'Dongle',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 25.0,

                                    ),),
                                  //                SizedBox(width: 100,),








                                ]

                            ),
                          ),
                          actions: [
                            Container(
                              child: TextButton(
                                  onPressed: onDelete,
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.symmetric(vertical: 13.0, horizontal: 100.0),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.red,
                                    ),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50.0),
                                          //side: BorderSide(color: Colors.red)
                                        )
                                    ),


                                  ),
                                  child:Text('Yes', style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),)),
                              alignment: Alignment.center ,
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment:Alignment.center,
                              child: TextButton(onPressed: (){
                                Navigator.pop(context);
                              },
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.symmetric(vertical: 13.0, horizontal: 100.0),
                                    ),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50.0),
                                          //side: BorderSide(color: Colors.red)
                                        )
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.green,
                                    ),
                                  ),
                                  child:Text('No', style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),)),
                            ),

                          ],
                        );
                      });
                    },

                    child: Icon(
                      Icons.close,
                      size: 25,
                      color: Colors.grey,
                    ),

                  ),

                ),

              if(isDesktop(context))

                Container(

                  alignment: Alignment.center,
                    width: 310,
                   // height: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        SizedBox(
                          //height: 10,
                          //width: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 10,
                              width: 8,
                            ),

                            isChecked
                                ? GestureDetector(
                              onTap: onPress,
                              child: Container(
                                padding: EdgeInsets.all(4.5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: circleColor,
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            )
                                : GestureDetector(
                              onTap: onPress,
                              child: Icon(
                                Icons.circle_outlined,
                                color: circleColor,
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              alignment: Alignment.centerLeft,
                              height:30,
                              width: 205,
                              child:  Text(
                                text,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                    fontFamily: 'Dongle',
                                    fontWeight: FontWeight.w600),
                              ) ,

                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child:  GestureDetector(

                                onTap: (){

                                  showDialog(context: context, builder:  (BuildContext context)
                                  {

                                    return AlertDialog(
                                      backgroundColor: Color(0xFF344FA1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(15.0))),

                                      content: Container(
                                              height: 38,
                                        //width: 10,
                                        child:  Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children:<Widget>[
                                                  Text('Are you sure to delete this task ? ',
                                                        style:  TextStyle(
                                                          fontFamily: 'Dongle',
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.white,
                                                          fontSize: 25.0,

                                                        ),),
                                      //                SizedBox(width: 100,),








                                            ]

                                        ),
                                      ),
                                      actions: [
                                        Container(
                                          child: TextButton(
                                              onPressed: onDelete,
                                              style: ButtonStyle(
                                                padding: MaterialStateProperty.all<EdgeInsets>(
                                                  EdgeInsets.symmetric(vertical: 13.0, horizontal: 100.0),
                                                ),
                                                backgroundColor: MaterialStateProperty.all(
                                                  Colors.red,
                                                ),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50.0),
                                                      //side: BorderSide(color: Colors.red)
                                                    )
                                                ),


                                              ),
                                              child:Text('Yes', style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),)),
                                          alignment: Alignment.center ,
                                        ),
                                        SizedBox(height: 20,),
                                        Container(
                                          alignment:Alignment.center,
                                          child: TextButton(onPressed: (){
                                            Navigator.pop(context);
                                          },
                                              style: ButtonStyle(
                                                padding: MaterialStateProperty.all<EdgeInsets>(
                                                  EdgeInsets.symmetric(vertical: 13.0, horizontal: 100.0),
                                                ),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(50.0),
                                                      //side: BorderSide(color: Colors.red)
                                                    )
                                                ),
                                                backgroundColor: MaterialStateProperty.all(
                                                  Colors.green,
                                                ),
                                              ),
                                              child:Text('No', style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),)),
                                        ),

                                      ],
                                    );
                                  });
                                },

                                child: Icon(
                                  Icons.close,
                                  size: 25,
                                  color: Colors.grey,
                                ),

                              ),

                            ),
                          ],
                        ),

                        SizedBox(height: 15,),
                        Container(
                          width: 1000,
                          alignment: Alignment.bottomCenter,
                         // width:(MediaQuery.of(context).size.width/MediaQuery.of(context).size.height)*.3,
                          //color: Colors.green,
                          child: TextButton(onPressed: (){
                            showDialog(context: context, builder: (BuildContext context)
                            {

                              return Container(

                                  child:AlertDialog(

                                    backgroundColor: Color(0xFF344FA1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                    title:Row
                                      (
                                      children: [
                                        Text(
                                            'Edit Your Task',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontFamily: 'Dongle',
                                              fontSize: 20.0,
                                            ),
                                          ),
                                     SizedBox(width: 190,),
                                        Container(
                                       //   margin: const EdgeInsets.only(left: 40,),
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
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            //border: Border.all(width: 2.0, color: Color(0xCBC7C7B3)),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Form(
                                            key: formKey,
                                            child:TextFormField(
                                              initialValue: text,

                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Cannot be Empty';
                                                }
                                                return null;
                                              },
                                              onChanged: (value){
                                                edit = value;
                                                if(formKey.currentState!.validate()){

                                                }
                                              },
                                              //controller: edit,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Edit Your Task',
                                              ),
                                            ),

                                          ),
                                                                                  ),


                                      ],
                                    ),
                                    actions: [Container(
                                      width: 320,
                                      height: 50,
                                      alignment:Alignment.center,

                                      child: TextButton(
                                          onPressed: () async{
                                            unfocus() {
                                              var currentFocus = FocusScope.of(context);

                                              if (!currentFocus.hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            }
                                            unfocus();
                                            //print(onIndex);
                                            if(formKey.currentState!.validate()){
                                              Provider.of<Data>(context, listen: false).edittask(isChecked,edit,onIndex);
                                              Provider.of<Data>(context,listen: false).datatask();
                                              Navigator.pop(context);
                                            }

                                          },
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all<EdgeInsets>(
                                              EdgeInsets.symmetric(vertical: 10.0, horizontal: 130),
                                            ),
                                            backgroundColor: MaterialStateProperty.all(
                                              Colors.green,
                                            ),
                                          ),
                                          child: Text(
                                            'Save',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Dongle',
                                              color: Colors.white,
                                            ),
                                          )),

                                    ),],
                                  )
                              );

                            });
                          },
                              child: Container(
                                alignment: Alignment.center,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20)
                                ),

                                child: Text('Edit',style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Dongle',
                                    fontSize: 20                            ),),
                              )),

                        ),

                      ],
                    ),
    ),





            ],
          ),


     );




  }
}