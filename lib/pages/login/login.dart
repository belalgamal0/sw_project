import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/user.dart';
import '../../repository/auth_repository/auth_repository.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/home.dart';
class SignInScreen extends StatefulWidget {
  Function successLogin;
  SignInScreen({Key key,this.successLogin}) : super(key: key);
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthRepository _authRepository = AuthRepository();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(35)),
                    child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Email"))),
                SizedBox(height: 25),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(35)),
                    child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Password"))),
                SizedBox(height: 25),
                SizedBox(height: 40),
                Container(
                    height: 60,
                    width: 200,
                    child: ElevatedButton(
                        child: Text("Sign In",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
                        onPressed: () async {
                          if (emailController.text != "" && passwordController.text != "") {
                            await _authRepository.logIn(email: emailController.text, password: passwordController.text).then((value){
                                  setState(() {
                                    User().logedIn = true;
                                    emailController.clear();
                                    passwordController.clear();
                                  });
                                  Scrollable.ensureVisible(
                                      postKey.currentContext,
                                      duration: Duration(milliseconds: 500));
                                 widget.successLogin();
                                });
                          }
                        }))
              ]))),
      Expanded(
          child: Container(
              height: MediaQuery.of(context).size.height,
              color: Color(0xff6D28E0),
              child: Center(
                child: ClipRRect(
                  child: Text(
                    "Nava",
                    style:
                        GoogleFonts.pacifico(fontSize: 50, color: Colors.white)
                  )
                )
              ))),
    ]);
  }
}
