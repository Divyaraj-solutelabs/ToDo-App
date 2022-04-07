import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vid/Loginhive/Lginhiv.dart';
import 'package:vid/Screens/SignIN.dart';
import 'package:vid/Screens/splashscreen.dart';
import 'package:vid/hive_db/task_db_hive.dart';
import 'package:vid/provider/dataprovider.dart';
import 'package:vid/Screens/task_screen.dart';
import 'package:vid/Screens/welcome_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LoginchAdapter());
  Hive.registerAdapter(DataModelAdapter());
 await Hive.openBox('tasks');
 await Hive.openBox('login');
  runApp(  MyApp());

}





class MyApp extends StatefulWidget {
  // This widget is the root of your application.
   const MyApp({Key? key}) : super(key: key);


   @override
   _MyApp createState() => _MyApp();


}

class _MyApp  extends State<MyApp>{





  @override

    Widget build(BuildContext context)  {
    return ChangeNotifierProvider(
        create: (context) => Data(),
      //lazy: lo=check() as bool,
        child: MaterialApp(

            title: 'To-do List app',
            theme: ThemeData(
             // fontFamily:'Dongle',

             textTheme: TextTheme(

             ),

              appBarTheme:
              AppBarTheme(backgroundColor: Color(0xFF344FA1), elevation: 0),
              scaffoldBackgroundColor: Color(0xFF344FA1),
            ),

            initialRoute:Splash.routename_,
        routes: {
          Splash.routename_:(context) =>Splash(),
          Signin.routename:(context) => Signin(),
          WelcomeScreen.route_name: (context) => WelcomeScreen(),
          TaskScreen.routeName: (context) => TaskScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
      );
    }


}