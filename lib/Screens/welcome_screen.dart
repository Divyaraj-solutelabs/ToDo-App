import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:vid/Loginhive/Lginhiv.dart';

import 'package:vid/Screens/task_screen.dart';

import 'package:vid/main.dart';

import 'SignIN.dart';
import '../provider/dataprovider.dart';
import '../Modules/sign_button.dart';


import '../Modules/textfile.dart';

class WelcomeScreen    extends StatefulWidget{
  WelcomeScreen({Key? key}) : super(key: key);
  static String route_name = '/';

  @override
  _WelcomeScreen createState() => new _WelcomeScreen();
}



class _WelcomeScreen extends State<WelcomeScreen> {
  Box box=  Hive.box('login') ;
  late String username="",use="";bool u=false;
  late String password="",pe=""; bool p=false;
  TextEditingController _controller = new TextEditingController();
  String Login="";
  bool bu=true;
  bool lo=false;

  bool _isLoading = false;
  final formKey =  GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();





  void _showSnackBar(String text) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content:  Text('Invalid Credentials For Login'),
      action: SnackBarAction(
        label: '',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }




  @override
  Widget build(BuildContext context) {



    return  WillPopScope(
        onWillPop: () async => false,
    child: Scaffold(
      body:Align(
        alignment: Alignment.center,
        child:  Container(

          // height: 1000,
          width: 480,
          alignment: Alignment.center,
          child: Form(
            key: formKey,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: 138,
                ),
                ImageIcon(
                  AssetImage("assets/images/logo1.png"),
                  color: Colors.blueAccent,
                  size: 30,
                ),

                SizedBox(height: 50,),
                Container(
//                padding: EdgeInsets.only(top: 80),
                  child: Align(
                    //alignment:Alignment.topCenter,
                    child: Text(
                      'Welcome To Task App',
                      style: TextStyle(
                        fontFamily: 'Dongle',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),

                SizedBox(height:70,),

                Container(
                  height: 50,
                  width: 80,
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
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        fontFamily: 'Dongle',
                        color: Colors.grey,
                          fontSize: 25
                      ),
                      contentPadding: EdgeInsets.only(left: 11, right: 3, top: 0, bottom: 5),
                      errorStyle: TextStyle(fontSize: 20, height: 0.3,fontFamily: 'Dongle'),
                      errorText: u?use:"" ,
                    ),
                    onChanged: (value) {
                      if(value.isNotEmpty)
                      {
                        setState(() {
                          u=false;
                        });
                      }
                      username = value;
                    },


                  ),
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
                    obscureText: bu,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        child: Icon(

                          Icons.lock_outlined,
                          color: Color(0xFF031956),
                        ),
                        padding: EdgeInsets.only(top: 5),),
                      labelText: ('Password'),

                      suffixIcon:Padding(
                        padding:EdgeInsets.only(top: 10),

                        child: IconButton(


                          color: Color(0xFF031956),
                          icon:  Icon(Icons.remove_red_eye),
                          onPressed: () {
                            if(bu==false)
                            {
                              setState(() {
                                bu=true;
                              });
                            }
                            else
                            {
                              setState(() {
                                bu=false;
                              });
                            }
                          },
                        ),),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        height: .25,
                        fontFamily: 'Dongle',
                        fontSize: 25
                      ),
                      contentPadding: EdgeInsets.only(left: 11, right: 3, top: 10, bottom: 10),
                      errorStyle: TextStyle(fontSize: 20, height: 0.3,fontFamily: 'Dongle'),
                      errorText: p?pe:"",
                    ),
                    onChanged: (value) {
                      if(value.isNotEmpty)
                      {
                        setState(() {
                          p=false;
                        });
                      }
                      password = value;
                    },


                  ),
                ),

                SizedBox(height: 20.0),

                SignButton(
                  bgColor: Color.fromRGBO(255, 0, 255, 1),
                  textButton: 'Let\'s Start',

                  onPress:  (){
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    if(username.isEmpty){
                      setState(() {
                        u=true;
                        use="        Enter Username";
                      });
                    }
                    else{
                      setState(() {
                        u=false;
                      });
                    }
                    if(password.isNotEmpty){
                      setState(() {
                        p=false;

                      });
                    }
                    else{
                      setState(() {
                        p=true;
                        pe="        Enter Password";
                      });
                    }
                    if(p==false && u==false){
                      setState(() {
                        //   username="";
                        // password="";
                        lo=false;
                        _controller.clear();
                      });
                      // _submit();
                      final as= box.values.cast<Loginch>();
                      if(as.isNotEmpty){
                        if(as.first.username==username && as.first.password==password){
                          Provider.of<Data>(context,listen: false).setName(as.first.username);
                          final snackBar = SnackBar(
                            content: const Text('Successfully Logged In'),
                            backgroundColor: Colors.green,
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
                          Navigator.pushNamed(context, TaskScreen.routeName);

                        }
                        else{
                          final snackBar = SnackBar(
                            content: const Text('Invalid Credentials For Login'),
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
                      else{
                        final snackBar = SnackBar(
                          content: const Text('No User Found'),
                       //   backgroundColor: Colors.red,
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
                      //     Provider.of<Data>(context, listen: false).setName(username);

                    }
                    else{
                      final snackBar = SnackBar(
                        content: const Text('All Fields are Required'),
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
                      setState(() {
                        // username="";
                        //  password="";
                        lo=true;
                        _controller.clear();
                        Login="Invalid Credentials For Login";
                      });
                    }
                    // Navigator.pushNamed(context, TaskScreen.routeName);
                  },

                ),

                SizedBox(height: 170,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:  Row(
                    children: <Widget>[
                      Text('Does not have account?',style: TextStyle(
                          fontSize: 25,
                     fontFamily: 'Dongle',
                          color: Colors.grey
                      ),),
                      TextButton(
                        child: Text('REGISTER',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Dongle',
                            color:Color.fromRGBO(255, 0, 255, 1),
                          ),
                        ),
                        style:TextButton.styleFrom(
                          primary: Colors.white,
                        ) ,
                        onPressed: (){

                          Navigator.pushNamed(context, Signin.routename).then((value) => setState((){}));
                        },
                      ),


                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),


              ],

            ),
          ),

        ),
      ),

    ),
    );
  }



}