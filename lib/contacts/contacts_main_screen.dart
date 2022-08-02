import 'package:flutter/material.dart';
import 'package:hti22one/contacts/contacts_screen.dart';
import 'package:hti22one/contacts/favorite_screen.dart';

class ContactsMainScreen extends StatefulWidget {
  const ContactsMainScreen({Key? key}) : super(key: key);

  @override
  State<ContactsMainScreen> createState() => _ContactsMainScreenState();
}

class _ContactsMainScreenState extends State<ContactsMainScreen> {
  List<Widget> screens = [
    const MyContactsScreen(),
    const ContactsFavoritesScreen(),
  ];

  List<String> titles = ["Contacts", "Favorites"];

  int index = 0;

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titles[index]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          index = value;
          setState(() {});
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), label: "Contacts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
        ],
      ),
      floatingActionButton: Visibility(
        visible: index == 0,
        child: FloatingActionButton(
          onPressed: () {
            scaffoldBottomSheet();
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: screens[index],
    );
  }

  void bottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        // Using Wrap makes the bottom sheet height the height of the content.
        // Otherwise, the height will be half the height of the screen.
        return Wrap(
          children: [
            const ListTile(
              leading: Icon(Icons.share),
              title: const Text('Share'),
            ),
            const ListTile(
              leading: Icon(Icons.link),
              title: Text('Get link'),
            ),
            const ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit name'),
            ),
            const ListTile(
              leading: Icon(Icons.delete),
              title: const Text('Delete collection'),
            ),
          ],
        );
      },
    );
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void scaffoldBottomSheet() {
    scaffoldKey.currentState!.showBottomSheet<void>((BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: Colors.white,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 25),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) return "Name required";
                  return null;
                },
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Contact Name"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) return "Phone required";
                  return null;
                },
                maxLength: 11,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Contact Phone"),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Save"),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
