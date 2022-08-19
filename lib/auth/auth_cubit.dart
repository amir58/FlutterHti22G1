import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  var firebaseAuth = FirebaseAuth.instance;

  void createAccount({
    required String email,
    required String password,
  }) {
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => _saveUserData(value.user!))
        .catchError((error) => emit(RegisterFailureState(error.toString())));
  }

  void login({
    required String email,
    required String password,
  }) {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => emit(LoginSuccessState()))
        .catchError((error) => emit(LoginFailureState(error.toString())));
  }

  void _saveUserData(User user) {
    FirebaseFirestore.instance
        .collection("flutterHti221Users")
        .doc(user.uid)
        .set({
      "username": "Amir",
      "email": "amir@gmail.com",
      "gender": "male",
      "phone": "01116036522",
    }).then((value) => emit(RegisterSuccessState()));
  }
}
