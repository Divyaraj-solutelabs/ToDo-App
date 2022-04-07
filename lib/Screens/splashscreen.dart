import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:vid/Screens/task_screen.dart';
import 'package:vid/Screens/welcome_screen.dart';


import '../Loginhive/Lginhiv.dart';

import '../provider/dataprovider.dart';

class Splash extends StatefulWidget{

  static String routename_='/Splash_screen';
  Splash({Key? key}) : super(key: key);

  @override
  _Splash createState() => _Splash();

}

class _Splash extends State<Splash>{

  Future<bool> check() async{

    Box box=  Hive.box('login') ;

    if(box.isNotEmpty){
      final as= box.values.cast<Loginch>();

      String user=as.first.username;
     // print(user);
      Provider.of<Data>(context,listen: false).setName(user);
      return true;
    }
    else{
      return false;
    }

  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            () async {
      await check()?
     Navigator.pushNamed(context, TaskScreen.routeName):
      Navigator.pushNamed(context, WelcomeScreen.route_name);
            }
            );


  }
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);

    return Container(

        color: Color(0xFF344FA1),

        child:Container(height: 100,padding: EdgeInsets.only(top: 100,bottom: 300),
            child:Image.asset('assets/images/logo.png')
        ),


    );
  }
}

