import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.deepPurpleAccent,
          child: ClipRRect(
              child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Center(
                child: Text("Memo",
                    style: GoogleFonts.pacifico(
                        backgroundColor: Colors.white, fontSize: 50))),
          )),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(35)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Email"),
                  )),
              SizedBox(height: 25),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(35)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Password"),
                  )),
              SizedBox(height: 25),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(35)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Confirm Password"),
                  )),
              SizedBox(height: 40),
              Container(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)))),
                      onPressed: () {
                      },
                      child: Text("Sign up",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500))))
            ],
          ),
        ))
      ],
    );
  }
}
