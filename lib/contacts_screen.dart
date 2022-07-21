import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({Key? key}) : super(key: key);

  final List<MyContact> contacts = [
    MyContact("Ali", "01129357239"),
    MyContact("Ahmed", "01129357239"),
    MyContact("Ehab", "01123447239"),
    MyContact("Eslam", "01129357239"),
    MyContact("Diaa", "01129357239"),
    MyContact("Zein", "01129346439"),
    MyContact("Amr", "01436457239"),
    MyContact("Ali", "01129357239"),
    MyContact("Ahmed", "01129357239"),
    MyContact("Ehab", "01123447239"),
    MyContact("Eslam", "01129357239"),
    MyContact("Diaa", "01129357239"),
    MyContact("Zein", "01129346439"),
    MyContact("Amr", "01436457239"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => buildContactItem(index),
        itemCount: contacts.length,
      ),
    );
  }

  Widget buildContactItem(int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          print("Phone number => ${contacts[index].phone}");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              contacts[index].phone,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class MyContact {
  String _name;
  String _phone;

  MyContact(this._name, this._phone);

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
