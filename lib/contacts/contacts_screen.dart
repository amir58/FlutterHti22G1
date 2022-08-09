import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti22one/contacts/contacts_cubit.dart';
import 'package:hti22one/contacts/contacts_states.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, ContactsStates>(
      buildWhen: (previous, current) => current is GetContactsState,
      builder: (context, state) {
        print('STATE 1 => $state');
        return ListView.separated(
          itemBuilder: (context, index) {
            return buildContactItem(index);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: context.read<ContactsCubit>().contacts.length,
        );
      },
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
          print(
              "Phone number => ${context.read<ContactsCubit>().contacts[index]['phone']}");
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.read<ContactsCubit>().contacts[index]['name'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    context.read<ContactsCubit>().contacts[index]['phone'],
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            MyCircleIconButton(
              iconData:
                  context.read<ContactsCubit>().contacts[index]['favorite'] == 1
                      ? Icons.favorite
                      : Icons.favorite_border,
              color:
                  context.read<ContactsCubit>().contacts[index]['favorite'] == 1
                      ? Colors.blue
                      : Colors.black,
              onPressed: () {
                context.read<ContactsCubit>().updateContact(
                      favorite: context.read<ContactsCubit>().contacts[index]
                                  ['favorite'] ==
                              0
                          ? 1
                          : 0,
                      id: context.read<ContactsCubit>().contacts[index]['id'],
                    );
              },
            ),
            const SizedBox(width: 10),
            MyCircleIconButton(
              iconData: Icons.delete,
              color: Colors.red,
              onPressed: () {
                _showDeleteContactDialog(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDeleteContactDialog(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure to delete this contact !'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                this.context.read<ContactsCubit>().deleteContact(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
