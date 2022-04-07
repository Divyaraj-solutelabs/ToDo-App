
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vid/Loginhive/Lginhiv.dart';

import 'package:vid/provider/dataprovider.dart';
import 'package:vid/Modules/sign_button.dart';

import 'welcome_screen.dart';


class Signin extends StatefulWidget{
  static String routename='/signin-screen';


  const Signin({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState  extends State<Signin>{
  Box box=  Hive.box('login') ;
     TextEditingController     DOB=TextEditingController();
String firstname="";
String Lastname="";
String Username="";
String Email="";
String Password="";
//String DOB="";
  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("A"),value: "A"),
      DropdownMenuItem(child: Text("B"),value: "B"),
      DropdownMenuItem(child: Text("C"),value: "C"),
      DropdownMenuItem(child: Text("D"),value: "D"),
    ];
    return menuItems;
  }

   String Grade="A"; // Option 2
  String fie="",lae="",use="",eme="",pae="",Doe=""; bool f=false,l=false,u=false,em=false,pa=false,d=false,but=true;

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    DOB.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
    child: Scaffold(
      appBar: AppBar(
              leading:  new IconButton(
      icon: new Icon(Icons.arrow_back),
      onPressed: (){

        Navigator.pushNamed(context, WelcomeScreen.route_name).then((value) => setState((){}));
        },
      ),),
    body:Align(
      alignment: Alignment.center,
      child:  Container(
        width: 580,
        //height: 9000,
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         Align(
           alignment: Alignment.topCenter,
            child: Text(
          'Create  Account',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'Dongle',
            fontSize: 38.0,
          ),
        ),
         ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Create New Account',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontFamily: 'Dongle'
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 480,
              margin: EdgeInsets.fromLTRB(30.0, 0.0, 40.0, 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    child: Icon(Icons.person_outline,
                      color: Color(0xFF031956),),
                    padding: EdgeInsets.only(top: 5),),
                  labelText: 'Firstname',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Dongle',
                    fontSize: 23
                  ),
                  contentPadding: EdgeInsets.only(left: 11, right: 3, top: 0, bottom: 5),
                  errorStyle: TextStyle(fontFamily: 'Dongle',fontSize: 18, height: 0.3),
                  errorText: f?fie:"" ,
                ),
                onChanged: (value) {
                  if(value.isNotEmpty)
                  {
                    setState(() {
                      f=false;
                    });
                  }
                  firstname = value;
                },


              ),
            ),//Firstname
            Container(
              height: 50,
              width: 480,
              margin: EdgeInsets.fromLTRB(30.0, 0.0, 40.0, 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    child: Icon(Icons.person_outline,
                      color: Color(0xFF031956),),
                    padding: EdgeInsets.only(top: 5),),
                  labelText: 'Lastname',
                  labelStyle: TextStyle(
                    fontFamily: 'Dongle',
                    color: Colors.grey,
                    fontSize: 23
                  ),
                  contentPadding: EdgeInsets.only(left: 11, right: 3, top: 0, bottom: 5),
                  errorStyle: TextStyle(fontFamily: 'Dongle',fontSize: 18, height: 0.3),
                  errorText: l?lae:"" ,
                ),
                onChanged: (value) {
                  if(value.isNotEmpty)
                  {
                    setState(() {
                      l=false;
                    });
                  }
                  Lastname = value;
                },


              ),
            ), //Lastname
            Container(
              height: 50,
              width: 480,
              margin: EdgeInsets.fromLTRB(30.0, 0.0, 40.0, 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    child: Icon(Icons.face_outlined,
                      color: Color(0xFF031956),),
                    padding: EdgeInsets.only(top: 5),),
                  labelText: 'Username',
                  labelStyle: TextStyle(

                    color: Colors.grey,
                    fontFamily: 'Dongle',
                    fontSize: 23
                  ),
                  contentPadding: EdgeInsets.only(left: 11, right: 3, top: 0, bottom: 5),

                  errorStyle: TextStyle(fontFamily: 'Dongle',fontSize: 18, height: 0.25),
                  errorText: u?use:"" ,
                ),
                onChanged: (value) {
                  if(value.isNotEmpty)
                  {
                    setState(() {
                      u=false;
                    });
                  }
                  Username = value;
                },


              ),
            ),  //Username
            Container(
              height: 50,
              width: 480,
              margin: EdgeInsets.fromLTRB(30.0, 0.0, 40.0, 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    child: Icon(Icons.email_outlined,
                      color: Color(0xFF031956),),
                    padding: EdgeInsets.only(top: 5),),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Dongle',
                    fontSize: 23
                  ),
                  contentPadding: EdgeInsets.only(left: 11, right: 3, top: 0, bottom: 5),
                  errorStyle: TextStyle(fontFamily: 'Dongle',fontSize: 18, height: 0.3),
                  errorText: em?eme:"" ,
                ),
                onChanged: (value) {
                  if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(Email))
                  {
                    setState(() {
                      em=false;
                    });
                  }
                  Email= value;
                },


              ),
            ), //Email
            Container(
              height: 50,
              width: 480,
              margin: EdgeInsets.fromLTRB(30.0, 0.0, 40.0, 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextFormField(
                obscureText: but,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    child: Icon(

                      Icons.lock_outlined,
                      color: Color(0xFF031956),
                    ),
                    padding: EdgeInsets.only(top: 5),),
                  labelText: 'Password',
                  suffixIcon:Padding(
                    padding:EdgeInsets.only(top: 10),

                    child: IconButton(


                      color: Color(0xFF031956),
                      icon:  Icon(Icons.remove_red_eye),
                      onPressed: () {
                        if(but==false)
                        {
                          setState(() {
                            but=true;
                          });
                        }
                        else
                        {
                          setState(() {
                            but=false;
                          });
                        }
                      },
                    ),),
                  labelStyle: TextStyle(
                      height: .25,
                    fontFamily: 'Dongle',
                    color: Colors.grey,
                    fontSize: 23
                  ),

                  contentPadding: EdgeInsets.only(left: 11, right: 3, top: 10, bottom: 10),
                  errorStyle: TextStyle(fontFamily: 'Dongle',fontSize: 18, height: 0.3),
                  errorText: pa?pae:"",

                ),
                onChanged: (value) {
                  Password = value;

                  setState(() {
    if(RegExp(r"^(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$").hasMatch(Password)) {
      pa = false;
    }               });

                },


              ),
            ), //Password
            Container(
              height: 50,
              width: 480,
              margin: EdgeInsets.fromLTRB(30.0, 0.0, 40.0, 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    child: Icon(Icons.calendar_today_outlined,
                      color: Color(0xFF031956),),
                    padding: EdgeInsets.only(top: 5),),
                  labelText: 'Date of Birth',
                  labelStyle: TextStyle(
                    fontFamily: 'Dongle',
                    color: Colors.grey,
                    fontSize: 23
                  ),
                  contentPadding: EdgeInsets.only(left: 11, right: 3, top: 5, bottom: 5),
                  errorStyle: TextStyle(fontFamily: 'Dongle',fontSize: 18, height: 0.3),
                  errorText: d?Doe:"" ,
                ),
                controller: DOB,

                readOnly: true,
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    builder: (context ,  child){
                      return  Theme(data:ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Color(0xFF344FA1),
                        ),
                      ) , child: child!);

                    },
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1800),
                    lastDate: DateTime(2001),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      DOB.text= DateFormat('dd MMMM y').format(selectedDate);
                    }
                    if(DOB.text.isNotEmpty){
                      setState(() {

                        d = false;
                      });
                    }
                  });
                },
                onChanged: (value) {
//                  DOB.text = value;
                 // if(DOB.text.isNotEmpty) {
                    setState(() {

                      d = false;
                    });


                },

              ),
            ), //Date of Birth
            Container(
              height: 50,
              margin: EdgeInsets.fromLTRB(30.0, 0.0, 40.0, 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child:
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    //labelText: 'Grade',
                    labelStyle: TextStyle
                      (
                        color: Colors.grey
                    ),
                    prefixIcon:Icon(
                      Icons.star_outlined,
                      color: Color(0xFF031956),
                    ),
                    //  fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(top: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: InputBorder.none,
                    filled: true,
                    //fillColor: Colors.blueAccent,
                  ),
                  //validator: (value) => value == null ? "Select a country" : null,
                  //dropdownColor: Colors.blueAccent,
                  value: Grade,
                  onChanged: (String? newValue) {
                    setState(() {
                      Grade = newValue!;
                    });
                  },
                  items: dropdownItems),
            ),

            SignButton(
                bgColor: Color.fromRGBO(255, 0, 255, 1),
                textButton: 'Submit',

                onPress:   () async {

                  unfocus() {
                    var currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  }
                  unfocus();

                  if(firstname.isEmpty)
                  {
                    setState(() {
                      fie="     Enter Firstname";
                      f=true;
                    });
                  }
                  else{
                    setState(() {
                      // l=false;
                      f=false;
                    });
                  }
                  if(Lastname.isEmpty)
                  {
                    setState(() {
                      lae="     Enter Lastname";
                      l=true;
                    });
                  }
                  else{
                    setState(() {
                      l=false;
                    });
                  }
                  if(Username.isEmpty)
                  {
                    setState(() {
                      use="      Enter Username";
                      u=true;
                    });
                  }
                  else{
                    setState(() {
                      u=false;
                    });
                  }
                  if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(Email)){
                    setState(() {
                      //eme="Invalid Email ID";
                      em=false;
                    });
                  }
                  else{

                    setState(() {
                      eme="     Invalid Email ID";
                      em=true;
                    });
                  }
                  if (RegExp(r"^(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$").hasMatch(Password)){
                    setState(() {
                      pa=false;
                    });
                  }
                  else{
                    setState(() {
                      pae="      1 numeric value & Special character, should have 6 Characters";
                      pa=true;
                    });
                  }
                  if(DOB.text.isEmpty)
                  {
                    setState(() {
                      Doe="         Enter Date of Birth";
                      d=true;
                    });
                  }
                  else{
                    setState(() {
                      d=false;
                    });
                  }
                  if(f==false && l == false&&em==false && u == false && pa == false && d==false){


                    // await Databasehelper.instance.insertStudent(Students(Firstname: firstname, Lastname: Lastname, Username: Username, Email: Email, Password: Password));
                    //  print(result.first);
                    box.add(Loginch(username: Username, password: Password));
                    Navigator.pushNamed(context,  WelcomeScreen.route_name);
                    final snackBar = SnackBar(
                      content: const Text('Successfully Registered'),
                      width: 500,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.green,
                      action: SnackBarAction(
                        label: '',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);



                  }
                  else{

                    final snackBar = SnackBar(
                      content: const Text('All the Fields are Required'),
                      backgroundColor: Colors.red,
                      width: 500,
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                        label: '',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }


                }
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                Text('Already have an account?',style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Dongle',
                    color: Colors.grey
                ),),
                TextButton(
                  child: Text('Login',
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Dongle',
                      color:Color.fromRGBO(255, 0, 255, 1),
                    ),
                  ),
                  style:TextButton.styleFrom(
                    primary: Colors.white,
                  ) ,
                  onPressed: (){

                    Navigator.pushNamed(context, WelcomeScreen.route_name).then((value) => setState((){}));
                  },
                ),


              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    ),

  ),
    );

  }
  }

