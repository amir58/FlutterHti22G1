import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti22one/contacts/contacts_cubit.dart';
import 'package:hti22one/contacts/contacts_states.dart';
import 'package:hti22one/messenger/my_circle_icon_button.dart';

import '../contacts_screen.dart';
import 'contacts_main_screen.dart';

class ContactsFavoritesScreen extends StatefulWidget {
  const ContactsFavoritesScreen({Key? key}) : super(key: key);

  @override
  State<ContactsFavoritesScreen> createState() =>
      _ContactsFavoritesScreenState();
}

class _ContactsFavoritesScreenState extends State<ContactsFavoritesScreen> {


  @override
  void initState() {
    super.initState();
    print('My contacts init state');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, ContactsStates>(
      builder: (context, state) {
        print('STATE 2 => $state');

        return ListView.separated(
          itemBuilder: (context, index) {
            return buildContactItem(index);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: context.read<ContactsCubit>().favorites.length,
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
          print("Phone number => ${context.read<ContactsCubit>().favorites[index]['phone']}");
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.read<ContactsCubit>().favorites[index]['name'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    context.read<ContactsCubit>().favorites[index]['phone'],
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            MyCircleIconButton(
              iconData: Icons.favorite,
              color: Colors.blue,
              onPressed: () {
                // updateContact(favorite: 0, id: contacts[index]['id']);
              },
            ),
          ],
        ),
      ),
    );
  }

}
