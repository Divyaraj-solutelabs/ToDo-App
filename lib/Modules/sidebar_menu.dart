import 'package:flutter/material.dart';

class SideBarMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const SideBarMenuItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size:25,
        color: Color(0xFF83A0EF),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Dongle',
           fontSize: 25,
            color: Color(0xFF99A2BB),
          ),
        ),
      ),
      onTap: () {
        final snackBar = SnackBar(
    content: const Text('Under Development'),
//    backgroundColor: Colors.green,
    action: SnackBarAction(
    label: '',
    onPressed: () {
    // Some code to undo the change.
    },
    ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);



    },
    );
  }
}