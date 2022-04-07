import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final Color bgColor;
  final String textButton;
  final VoidCallback onPress;

  const SignButton(
      {required this.bgColor, required this.textButton, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 50,
    //    padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 40.0),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(40.0),
        ),
        alignment: Alignment.topCenter,
        child: Center(
//alignment: Alignment.center,
          child: Text(
            textButton,
            style: TextStyle(
              fontFamily: 'Dongle',
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 25.0),
          ),
        ),
      ),
    );
  }
}
