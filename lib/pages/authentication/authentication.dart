import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/controllers.dart';
import '../../routing/routes.dart';
import '../../widgets/single_post_shorted.dart';
import '../../widgets/titled_post.dart';
import '../sign_up/clients.dart';

class AuthenticationPage extends StatelessWidget {
  
    final signUp = new GlobalKey();
    final postKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                                                        SizedBox(height: 30),

                            Row(children: [
 
                              Text("Memo",style: GoogleFonts.pacifico(fontSize: 27,color: Colors.deepPurpleAccent)
                              ,),Spacer(),InkWell(focusColor: Colors.white,hoverColor: Colors.transparent,                                                          onTap: () => Scrollable.ensureVisible(postKey.currentContext,duration: Duration(milliseconds: 500)),
 child: Text("Wrtie",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.deepPurpleAccent),)),SizedBox(height: 25,child: VerticalDivider(width: 30,color: Colors.black,),
                            ),
                            InkWell(focusColor: Colors.transparent,hoverColor: Colors.white,onTap: (){}, child: Text("Log in",style: TextStyle(fontWeight: FontWeight.w600),)),
                            SizedBox(width: 15),
                            ElevatedButton(
                                                    style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent,
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)))),
                                                          onPressed: () => Scrollable.ensureVisible(signUp.currentContext,duration: Duration(milliseconds: 500)),

                                                    child: Text("Sign up"))],),
                            SizedBox(height: 20),
      
    
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: Text("Most Recent", style: TextStyle(fontWeight: FontWeight.w900)), flex: 3),
                                Expanded(child: Padding(padding: const EdgeInsets.only(left: 16.0),child: Text("Featured", style: TextStyle(fontWeight: FontWeight.w900))), flex: 2)
                              ]),
                            SizedBox(height: 10),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: SinglePostShorted(), flex: 3),
                                  Expanded(child: Column(children: List.generate(3,(index) => Padding(padding: const EdgeInsets.only(bottom: 20), child: TitledPost()))), flex: 2)
                                ]),
                            SizedBox(height: 10),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text("", style: TextStyle(fontWeight: FontWeight.w900)), flex: 3),
                                  Expanded(child: Padding(padding: const EdgeInsets.only(left: 16.0),child: Text("Featured", style: TextStyle(fontWeight: FontWeight.w900))), flex: 2)
                                ]),
                            SizedBox(height: 20),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:  CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              SinglePostShorted(defaultSize: false),
                                              SizedBox(width: 40),
                                              SinglePostShorted(defaultSize: false)
                                            ]),
                                            Container(
                                                margin:EdgeInsets.only(top: 50),
                                                height: 40,
                                                width: 150,
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent,
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)))),
                                                    onPressed: () {

Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen(),));
                                                    },
                                                    child: Text("Load More")))
                                          ]),
                                      flex: 3),
                                  Expanded(child: Column(children: List.generate(3, (index) => Padding(padding: const EdgeInsets.only(bottom: 20), child: TitledPost()))), flex: 2),
                                ]),
                                SignUpScreen(key: signUp),

                                WritePostScreen(key: postKey,)
                          ])))));
    }));
  }
}


class WritePostScreen extends StatelessWidget {
  const WritePostScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: MediaQuery.of(context).size.height,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                                          SizedBox(height: 30),

          Container(height: 300,
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextField(maxLines: 10,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Write a post!"),
                  )),
                  SizedBox(height: 15),
                   SizedBox(height: 40,
                   width: 120,
                     child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent,
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)))),
                                                      onPressed: () {

Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen(),));
                                                      },
                                                      child: Text("Post",style: TextStyle(fontSize: 18),)),
                   )

      ],),
    );
  }
}