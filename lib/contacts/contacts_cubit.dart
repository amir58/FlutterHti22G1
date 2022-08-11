import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti22one/contacts/contacts_states.dart';
import 'package:sqflite/sqflite.dart';

class ContactsCubit extends Cubit<ContactsStates> {
  ContactsCubit() : super(InitContactState());

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late Database database;
  List<Map<String, dynamic>> contacts = [];
  List<Map<String, dynamic>> favorites = [];

  void createDatabase() async {
    print('Start create database');
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
    getFavorites();

    // openDatabase("contacts", version: 1,
    //     onCreate: (Database db, int version) async {
    //       // When creating the db, create the table
    //       await db.execute(
    //           'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    //     }).then((value){
    //
    // });
  }

  void getContacts() async {
    // contacts = await database.rawQuery('SELECT * FROM Contacts');
    print(contacts);
    // setState((){});

    await firestore.collection("htiOneContacts").get().then(
      (value) {
        contacts.clear();
        for (var element in value.docs) {
          print('- - - - - - - - -');
          print(element.data());
          contacts.add(element.data());
        }
      },
    );

    emit(GetContactsState());
  }

  void getFavorites() async {
    // database
    //     .query("Contacts",
    //         columns: ["id", "name", "phone", "favorite"],
    //         where: 'favorite = ?',
    //         whereArgs: ['1'])
    //     .then(
    //   (value) {
    //     favorites = value;
    //     print(favorites);
    //     // setState(() {});
    //     emit(GetFavoritesState());
    //   },
    // );

    firestore
        .collection("htiOneContacts")
        .where("favorite", isEqualTo: 1)
        .get()
        .then((value) {
      favorites.clear();
      for (var element in value.docs) {
        print('- - - - - - - - -');
        print(element.data());
        favorites.add(element.data());
      }
      emit(GetFavoritesState());
    });
  }

  void insertContact({
    required String name,
    required String phone,
  }) async {
    await database.transaction((txn) async {
      int contactId = await txn.rawInsert(
          'INSERT INTO Contacts(name, phone, favorite) VALUES("$name", "$phone", 0)');

      firestore.collection("htiOneContacts").doc(contactId.toString()).set({
        "id": contactId,
        "name": name,
        "phone": phone,
        "favorite": 0,
      });
    });

    emit(InsertContactState());
  }

  void updateContact({
    required int favorite,
    required int id,
  }) async {
    int count = await database.rawUpdate(
        'UPDATE Contacts SET favorite = ? WHERE id = ?', ['$favorite', '$id']);
    print('updated: $count');

    firestore
        .collection("htiOneContacts")
        .doc(id.toString())
        .update({'favorite': favorite});

    getContacts();
    getFavorites();
  }

  void deleteContact(int index) async {
    int id = contacts[index]['id'];
    var count =
        await database.rawDelete('DELETE FROM Contacts WHERE id = ?', ['$id']);
    print('Delete : $count');

    firestore.collection("htiOneContacts").doc(id.toString()).delete();

    getContacts();
  }
}
