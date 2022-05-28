import 'package:firebase_auth_web/firebase_auth_web.dart';

import '../../helpers/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthRepository{
  final FirebaseAuthWeb firebaseAuthWeb = FirebaseAuthWeb.instance;
  Future signUp({String email, String password})async{
    await firebaseAuthWeb.createUserWithEmailAndPassword(email, password).then((value){
      print(value);
    });
  }
  Future logIn({String email, String password})async{
      final prefs = await SharedPreferences.getInstance();

    await firebaseAuthWeb.signInWithEmailAndPassword(email, password).then((value){
      User().logedIn = true;
      prefs.setString("email","$email");
      // User().userToken = value.credential.token.toString();
      User().userEmail = email;
      print(value.user);
    }).onError((error, stackTrace){
      print("Error $error");
    });
  }
}