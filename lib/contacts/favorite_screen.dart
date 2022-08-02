import 'package:flutter/material.dart';
import 'package:hti22one/messenger/my_circle_icon_button.dart';

import '../contacts_screen.dart';

class ContactsFavoritesScreen extends StatefulWidget {
  const ContactsFavoritesScreen({Key? key}) : super(key: key);

  @override
  State<ContactsFavoritesScreen> createState() =>
      _ContactsFavoritesScreenState();
}

class _ContactsFavoritesScreenState extends State<ContactsFavoritesScreen> {
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
    return ListView.separated(
      itemBuilder: (context, index) {
        return buildContactItem(index);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemCount: 10,
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
          print("Phone number => ${contacts[index].phone}");
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contacts[index].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    contacts[index].phone,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            MyCircleIconButton(
              iconData: Icons.favorite,
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
