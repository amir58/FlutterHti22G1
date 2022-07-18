import 'dart:io';

import 'package:flutter/material.dart';

// void main() {
//   print('HelloFlutter!');
//
//   // DataTypes => String , int , double , bool
//   // DataType varName = value ;
//   String myName = 'Amir Mohammed';
//   int age = 20;
//   double number = 1.5;
//   bool isWorking = true;
//
//   var test = true;
//
//   print(myName);
//   print(age);
//   print(number);
//   print(isWorking);
//   print(test);
//
//   int counter = 10;
//
//   if (counter == 33) {
//     counter = 0;
//   } else {
//     counter++;
//   }
//
//   // inStore , onWay , finished
//   String orderStatus = "onWay";
//
//   if (orderStatus == "inStore") {
//     print('inStore');
//   } else if (orderStatus == "onWay") {
//     print('onWay');
//   } else if (orderStatus == "finished") {
//     print('finished');
//   } else {
//     print('Order status unknown');
//   }
//
//   switch (orderStatus) {
//     case "inStore":
//       {
//         print('inStore');
//         break;
//       }
//     case "onWay":
//       {
//         print('onWay');
//         break;
//       }
//     case "finished":
//       {
//         print('finished');
//         break;
//       }
//     default:
//       {
//         print('Order status unknown');
//         break;
//       }
//   }
//
//   // Loops
//
//   for (int x = 1; x <= 5; x++) {
//     if (x == 3) {
//       continue;
//     }
//     print(x);
//   }
//
//   List<String> names = [
//     'Amir',
//     'Ahmed',
//     'Mohammed',
//     'Ali',
//   ];
//
//   print(names);
//
//   for (var name in names) {
//     print(name);
//   }
//
//   for (var element in names) {
//     print(element);
//   }
//
//   names.removeWhere((name) => name == "Amir");
//
//   for (int i = 0; i < names.length; i++) {
//     if (names[i] == "Amir") {
//       names.removeAt(i);
//     }
//   }
//
//   // ? , ! , ?? , ??=
//   String name = "";
//
//   // name = stdin.readLineSync() ?? "Ahmed";
//
//   // String? inputName = stdin.readLineSync();
//   //
//   // if (inputName == null) {
//   //   name = "Ahmed";
//   // } else {
//   //   name = inputName;
//   // }
//
//   // print(name!.isEmpty);
//
//   String? address = null;
//
//   // address = "Alex";
//   address ??= "Cairo";
//
//   print(address.isEmpty);
//
//   print('- - - - - -- - - - - -  -');
//
//   String strNumber = stdin.readLineSync() ?? "";
//
//   int intNumber = int.tryParse(strNumber) ?? 0;
//
//   print(intNumber);
//
//   print(intNumber.toDouble());
//   print(intNumber.toString() + " x");
//   print("$intNumber x");
//
//   printTest();
// }

void main() {
  printTest();

  printSum(10, 34);
  print(sum(numberOne: 20, numberTwo: 30));

  int result = sum(numberOne: 45, numberTwo: 70);
  print(result);

  String text = "hello";

  print(isStringEmpty(text));

  dynamic test = 5;
  test = 6.2;
  test = "Ahmed";
  test = false;
  test = [true, false, "ALi", 2.3, 0];

  printName("Amir");

  strings();
}

// returnType funName(parameters){ fun body }

void printTest() {
  print('TEST');
}

void printName(String name) {
  // print("Welcome name");
  print("Welcome $name");
}

void printSum(int numberOne, int numberTwo) {
  int result = numberOne + numberTwo;
  print(result);
}

int sum({required int numberOne, required int numberTwo}) {
  return numberOne + numberTwo;
}

bool isStringEmpty(String value) {
  if (value == "") {
    return true;
  }
  return false;
}

void strings(){
  String welcomeText = "Welcome in flutter course";

  print(welcomeText.length);
}











