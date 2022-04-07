import 'dart:async';
import 'package:hive/hive.dart';

import 'package:flutter/cupertino.dart';



import 'package:vid/hive_db/task_db_hive.dart';

import 'task.dart';

class Data extends ChangeNotifier {

    //List<DataModel> Pitem=<DataModel>[];

  List<DataModel> pitem = <DataModel>[];
  String username = '';

   Box box=  Hive.box('tasks') ;



  double progress() {
    double sum = (compelete().toDouble() / pitem.length.toDouble());
    if (compelete()==0) {
      return 0.0;
    } else {
      if (sum == 0) {
        return 1.0;
      } else {
        return sum;
      }
    }
  }

  void datatask(){
    //final s =box.values.toList();
    final tas= box.values.cast<DataModel>();
 //  print(tas.first);
    if(tas.isNotEmpty){
      pitem.clear();
      pitem.addAll(tas);
    }

    notifyListeners();
  }



  void setName(String userName) {
    username = userName;
    notifyListeners();
  }
  String getUserName() {
    print(username);
    return username;
  }


  List<DataModel> result = <DataModel>[];
  void filterSearch(String query) {
    List<DataModel> dummy=<DataModel>[];
    dummy.addAll(pitem);
    if(query.isNotEmpty)
      {
        List<DataModel> dummylist =<DataModel>[];
        dummy.forEach((element) {
          if(element.taskname.contains(query))
            {
              dummylist.add(element);
            }

        });
        result.clear();
        result.addAll(dummylist);
        notifyListeners();
        return;
      }
    else
      {
        result.clear();
        result.addAll(pitem);
        notifyListeners();
      }
  }

  List<DataModel> get searchresult => result;


  void addTak(DataModel task)async {
   //  final dataModel=DataModel(taskname: , complete: null);
      box.add(task);
      //await Taskdatabase.instance.insertTask(task);

      //pitem.add(task);
  //    p++;
      notifyListeners();
  }
  void edittask(bool a,
      String name,
      int index,
      ) {

    var hj=DataModel(taskname:name, complete: a);
    box.put(index, hj);

    notifyListeners();
}
  void deleteTask(int index) async{
    box.deleteAt(index);
    pitem.removeAt(index);

    notifyListeners();
  }



  void updateTaskStatus(DataModel dataModel,int index) async{
   // pitem[index].complete =! pitem[index].complete;

    var itm = DataModel(taskname: dataModel.taskname, complete: !dataModel.complete);
    box.putAt(index, itm);


      notifyListeners();
    }
    int compelete(){
    int com=0;
    pitem.forEach((element) {
      if(element.complete==true)
        {
          com++;
        }
    });
    notifyListeners();
    return com;
    }
  int pending(){
    int com=0;
    pitem.forEach((element) {
      if(element.complete==false)
      {
        com++;
      }
    });
    notifyListeners();
    return com;
  }









}