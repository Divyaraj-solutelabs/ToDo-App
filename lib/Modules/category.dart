import 'package:flutter/material.dart';

class Categ extends StatelessWidget {
  final int tasksNumb;
  final String catName;

  const Categ({required this.tasksNumb, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0,top: 15),
      width: 150.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
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
      child: Column(
        children: [
          Align(
           alignment: Alignment.topLeft,
           child: Text(
             '$tasksNumb Tasks',
             style: TextStyle(
                 color: Color(0xFF8BA7EE),
                 fontSize: 18.0,
                 fontFamily: 'Dongle',
                 fontWeight: FontWeight.w600),
           ),
          ),

          SizedBox(
            height: 3.0,
          ),
          Align(
            alignment: Alignment.topLeft,
          child: Text(
            catName,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'Dongle',
                fontSize: 26.0),
          ),
          ),

        ],
      ),
    );
  }
}