import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti22one/contacts/contacts_states.dart';
import 'package:sqflite/sqflite.dart';

class ContactsCubit extends Cubit<ContactsStates> {
  ContactsCubit() : super(InitContactState());

  late Database database;
  List<Map> contacts = [];
  List<Map> favorites = [];

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
    contacts = await database.rawQuery('SELECT * FROM Contacts');
    print(contacts);
    // setState((){});
    emit(GetContactsState());
  }

  void getFavorites() async {
    database
        .query("Contacts",
            columns: ["id", "name", "phone", "favorite"],
            where: 'favorite = ?',
            whereArgs: ['1'])
        .then(
      (value) {
        favorites = value;
        print(favorites);
        // setState(() {});
        emit(GetFavoritesState());
      },
    );
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

    getContacts();
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

  void deleteContact({required int id}) async {
    var count =
        await database.rawDelete('DELETE FROM Contacts WHERE id = ?', ['$id']);
    print('Delete : $count');

    getContacts();
  }
}