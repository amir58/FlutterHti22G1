import 'dart:io';

import 'package:flutter/material.dart';

class User {
  String _name = "";
  String _age = "";
  String _phone = "";
  String _address = "";

  User(this._name, this._age, this._phone, this._address);

  User.contact(this._phone);

  User.none();

  String get phone => "+2$_phone";

  set phone(String value) {
    if (value.length == 11) {
      _phone = value;
    } else {
      print('$value Is invalid phone number');
    }
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  void printUserData() {
    print('Name : $_name');
    print('Age : $_age');
    print('Phone : $_phone');
    print('Address : $_address');
    print('- - - - - - - - - - - - ');
  }
}

class Test {
  static String name = "Amir";

  final double PI;

  Test(this.PI);

  static const double pi2 = 3.14;

  static const Color redColor = Color(0xFFF000);
}

class Student {
  final String name;
  final String level;
  String age = "";

  Student(this.name, this.level);

  Student.age(this.name, this.level, this.age);

  void printData() {}
}

void main() {
  Test.name;

  print('Hello Dart OOP');

  var user2 = User("Ahmed", "20", "010", "Cairo");
  user2.address = "Alex";
  user2.phone = "01116036522";

  print(user2.phone);

  List<User> users = [];

  int studentsCount = 0;

  print('Enter students count : ');

  studentsCount = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

  for (int i = 0; i < studentsCount; i++) {
    print('Enter Name ${i + 1} : ');
    String name = stdin.readLineSync() ?? "";

    print('Enter Age ${i + 1} : ');
    String age = stdin.readLineSync() ?? "";

    print('Enter Phone ${i + 1} : ');
    String phone = stdin.readLineSync() ?? "";

    print('Enter Address ${i + 1} : ');
    String address = stdin.readLineSync() ?? "";

    User user = User(name, age, phone, address);
    users.add(user);
  }

  for (var user in users) {
    user.printUserData();
  }
}
