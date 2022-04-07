import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vid/db/taskdatabase.dart';
import 'package:vid/hive_db/task_db_hive.dart';


import 'package:vid/provider/dataprovider.dart';
import 'package:vid/provider/task.dart';


class AddTaskScrn extends StatelessWidget {
  TextEditingController entredTaskName=TextEditingController();
  bool d=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 320,
      child: Container(
       // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        decoration: BoxDecoration(
          color: Color(0xFF344FA1),

        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[



            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                //border: Border.all(width: 2.0, color: Color(0xCBC7C7B3)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextFormField(

                controller: entredTaskName,

                obscureText: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  errorText: d?"Enter Task":"",
                  errorStyle: TextStyle(fontFamily: 'dongle'),
                  hintText: 'New Task',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
           Container(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () async{
                    unfocus() {
                      var currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    }
                    unfocus();
                    if(entredTaskName.text.isNotEmpty){
                      Provider.of<Data>(context, listen: false).addTak(
                          DataModel(taskname: entredTaskName.text,complete: false)
                      );

                      Provider.of<Data>(context,listen: false).datatask();
                      Navigator.pop(context);
                      d=false;
                    }
                      else{
                      d=true;
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
    );
  }
}
