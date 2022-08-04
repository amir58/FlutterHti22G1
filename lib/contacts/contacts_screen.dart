import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hti22one/messenger/my_circle_icon_button.dart';
import 'package:sqflite/sqflite.dart';

import '../contacts_screen.dart';
import 'contacts_main_screen.dart';

class MyContactsScreen extends StatefulWidget {
  const MyContactsScreen({Key? key}) : super(key: key);

  @override
  State<MyContactsScreen> createState() => _MyContactsScreenState();
}

class _MyContactsScreenState extends State<MyContactsScreen> {
  List<Map> contacts = [];

  void getContacts() async {
    database.rawQuery('SELECT * FROM Contacts').then((value) {
      contacts = value;
      print(contacts);
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    print('My contacts init state');
    Future.delayed(
      const Duration(seconds: 1),
      () {
        getContacts();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return buildContactItem(index);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemCount: contacts.length,
    );
  }

  Widget buildContactItem(int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          print("Phone number => ${contacts[index]['phone']}");
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contacts[index]['name'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    contacts[index]['phone'],
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            MyCircleIconButton(
              iconData: contacts[index]['favorite'] == 1
                  ? Icons.favorite
                  : Icons.favorite_border,
              color:
                  contacts[index]['favorite'] == 1 ? Colors.blue : Colors.black,
              onPressed: () {
                updateContact(
                  favorite: contacts[index]['favorite'] == 0 ? 1 : 0,
                  id: contacts[index]['id'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateContact({
    required int favorite,
    required int id,
  }) async {
    int count = await database.rawUpdate(
        'UPDATE Contacts SET favorite = ? WHERE id = ?', ['$favorite', '$id']);
    print('updated: $count');

    getContacts();
  }
}
