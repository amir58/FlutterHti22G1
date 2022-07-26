import 'package:flutter/material.dart';
import 'package:hti22one/style/colors.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
          child: Text(
        "YOUR RESULT",
        style: TextStyle(
          color: Colors.white,
          fontSize: 44,
          fontWeight: FontWeight.bold
        ),
      )),
    );
  }
}
