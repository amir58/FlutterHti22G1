import 'package:flutter/material.dart';
import 'package:hti22one/contacts/contacts_screen.dart';
import 'package:hti22one/contacts/favorite_screen.dart';
import 'package:sqflite/sqflite.dart';

// CRUD => Create , Read , Update, Delete
late Database database;
List<Map> contacts = [];

class ContactsMainScreen extends StatefulWidget {
  const ContactsMainScreen({Key? key}) : super(key: key);

  @override
  State<ContactsMainScreen> createState() => _ContactsMainScreenState();
}

class _ContactsMainScreenState extends State<ContactsMainScreen> {

  void createDatabase() async {
    database = await openDatabase(
      "contacts",
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        print('Database created');
        await db.execute(
            'CREATE TABLE Contacts (id INTEGER PRIMARY KEY, name TEXT, phone TEXT, favorite INTEGER)');
      },
      onOpen: (database) {
        print('Database opened');
      },
    );

    getContacts();

    // openDatabase("contacts", version: 1,
    //     onCreate: (Database db, int version) async {
    //       // When creating the db, create the table
    //       await db.execute(
    //           'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    //     }).then((value){
    //
    // });
  }

  void insertContact({
    required String name,
    required String phone,
  }) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Contacts(name, phone, favorite) VALUES("$name", "$phone", 0)');

      print('inserted : $id1');
    });
  }

  void updateContact({
    required int favorite,
    required int id,
  }) async {
    int count = await database.rawUpdate(
        'UPDATE Contacts SET favorite = ? WHERE id = ?', ['$favorite', '$id']);
    print('updated: $count');
  }

  void getContacts() async {
    List<Map> list = await database.rawQuery('SELECT * FROM Contacts');
    print(list);
    setState((){});
  }

  void deleteContact({required int id}) async {
    var count =
        await database.rawDelete('DELETE FROM Contacts WHERE id = ?', ['$id']);
    print('Delete : $count');

    getContacts();
  }

  List<Widget> screens = [
    const MyContactsScreen(),
    const ContactsFavoritesScreen(),
  ];

  List<String> titles = ["Contacts", "Favorites"];

  int index = 0;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    createDatabase();
  }

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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
                controller: nameController,
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
                controller: phoneController,
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
                      String name = nameController.text;

                      String phone = phoneController.text;

                      insertContact(name: name, phone: phone);

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
