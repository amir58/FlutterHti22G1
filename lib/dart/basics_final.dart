import 'dart:io';

import 'oop.dart';

void main() {
  List<String> names = [];

  while (true) {
    print('Enter name : ');
    String name = stdin.readLineSync() ?? "";

    if (name.isNotEmpty) {
      names.add(name);
    }

    print('Add new name? (y/n)');
    String answer = stdin.readLineSync() ?? "y";

    if (answer == "n") {
      print(names);
      break;
    }
  }


}
