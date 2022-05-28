import 'package:flutter/material.dart';
import '../../repository/auth_repository/auth_repository.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  Function successSignUp;
  SignUpScreen({Key key, this.successSignUp}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthRepository _authRepository = AuthRepository();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Container(
              height: MediaQuery.of(context).size.height,
              color: Color(0xff6D28E0),
              child: Center(
                child: ClipRRect(
                  child: Text(
                    "Nava",
                    style:
                        GoogleFonts.pacifico(fontSize: 50, color: Colors.white),
                  ),
                ),
              ))),
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
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(35)),
                    child: TextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Confirm Password"))),
                SizedBox(height: 40),
                Container(
                    height: 60,
                    width: 200,
                    child: ElevatedButton(
                        child: Text("Sign up",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
                        onPressed: () async {
                          if (emailController.text != "" &&
                              passwordController.text ==
                                  confirmPasswordController.text) {
                            await _authRepository
                                .signUp(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) {
                              setState(() {
                                emailController.clear();
                                passwordController.clear();
                                confirmPasswordController.clear();
                              });
                              widget.successSignUp();
                            });
                          }
                        }))
              ])))
    ]);
  }
}
