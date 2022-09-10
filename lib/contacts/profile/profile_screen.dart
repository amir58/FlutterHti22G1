import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hti22one/contacts/profile/User.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String profilePictureUrl =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/1200px-Unknown_person.jpg";

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: InkWell(
                  onTap: () => selectImage(),
                  child: Image.network(profilePictureUrl,
                      height: 100, width: 100, fit: BoxFit.fill),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    File file = File(image!.path);

    uploadImage(file);
  }

  void uploadImage(File file) {
    String ref = "FlutterHti22/${FirebaseAuth.instance.currentUser!.uid}";
    FirebaseStorage.instance.ref(ref).putFile(file).then((p0) {
      print('Image uploaded');
      getImageUrl(ref);
    }).catchError((error) {
      print(error.toString());
    });
  }

  void getImageUrl(String ref) async {
    String imageUrl = await FirebaseStorage.instance.ref(ref).getDownloadURL();
    print('ImageUrl => $imageUrl');
    saveImageUrlInFirestore(imageUrl);
    profilePictureUrl = imageUrl;
    setState(() {});
  }

  void saveImageUrlInFirestore(String imageUrl) {
    FirebaseFirestore.instance
        .collection("flutterHti221Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"imageUrl": imageUrl})
        .then((value) => print('Image url saved'))
        .catchError((error) => print(error.toString()));
  }

  void getUser() {
    FirebaseFirestore.instance
        .collection("flutterHti221Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      // var userData = value.data();
      // profilePictureUrl = userData!['imageUrl'];

      MyUser user = MyUser.fromJson(value.data());

      profilePictureUrl = user.imageUrl;

      setState(() {});
    }).catchError((error) => print(error.toString()));
  }
}
