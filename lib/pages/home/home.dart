import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/user.dart';
import 'package:flutter_web_dashboard/networking/models/get_blogs_response.dart';
import 'package:flutter_web_dashboard/repository/blog_repository/blog_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/single_post_shorted.dart';
import '../../widgets/titled_post.dart';
import '../login/login.dart';
import '../sign_up/sign_up.dart';
import '../write_post/write_post.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
  final homeKey = new GlobalKey();
final FirebaseAuthWeb auth = FirebaseAuthWeb.instance;

  final signUp = new GlobalKey();
  final signIn = new GlobalKey();
  final postKey = new GlobalKey();
class HomeScreen extends StatefulWidget {
   HomeScreen({Key key}) : super(key: homeKey);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final ScrollController scrollController = ScrollController();
  final bool loading = false;
  BlogRepository blogRepository = BlogRepository();
  GetBlogsResponse getBlogsResponse;
  @override void initState() {
    super.initState();
    blogRepository.getBlogs().then((value){
      setState(() {
        getBlogsResponse = value;
      });
      getBlogsResponse = value;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
        controller: scrollController,
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                  child: getBlogsResponse == null ? Text("") : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
padding: const EdgeInsets.symmetric(horizontal: 100),                              child: Column(children: [
                                  SizedBox(height: 30),
                          Row(
                            children: [
                              Text(
                                "Nava",
                                style: GoogleFonts.pacifico(
                                    fontSize: 27,
                                    color: Colors.deepPurpleAccent),
                              ),
                              Spacer(),
                              InkWell(
                                  focusColor: Colors.white,
                                  hoverColor: Colors.transparent,
                                  onTap: () => Scrollable.ensureVisible(
                                      postKey.currentContext,
                                      duration: Duration(milliseconds: 500)),
                                  child: Text(
                                    "Wrtie",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.deepPurpleAccent),
                                  )),
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(
                                  width: 30,
                                  color: Colors.black,
                                ),
                              ),
                              InkWell(
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.white,
                                  onTap: ()async{
                                    if(User().logedIn){
                                      await SharedPreferences.getInstance().then((value){
                                        setState(() {
                                          value.clear();
                                          User().logedIn = false;
                                        });
                                      });
                                    }else{
                                      Scrollable.ensureVisible(
                                      signIn.currentContext,
                                      duration: Duration(milliseconds: 500));
                                    }
                                  },
                                  child: Text(
                                   User().logedIn ? "Log out" : "Log in",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600),
                                  )),
                              SizedBox(width: 15),
                             ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.deepPurpleAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)))),
                                  onPressed: () => Scrollable.ensureVisible(
                                      signUp.currentContext,
                                      duration: Duration(milliseconds: 500)),
                                  child: Text("Sign up"))
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text("Most Recent",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900)),
                                    flex: 3),
                                Expanded(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Text("Featured",
                                            style: TextStyle(
                                                fontWeight:
                                                    FontWeight.w900))),
                                    flex: 2)
                              ]),
                          SizedBox(height: 10),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: SinglePostShorted(blogContent: "${getBlogsResponse.blogs[getBlogsResponse.blogs.length-1].blogContent}"), flex: 3),
                                Expanded(
                                    child: Column(
                                        children: List.generate(
                                            3,
                                            (index) => Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        bottom: 20),
                                                child: TitledPost()))),
                                    flex: 2)
                              ]),
                          SizedBox(height: 10),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text("",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900)),
                                    flex: 3),
                                Expanded(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Text("Featured",
                                            style: TextStyle(
                                                fontWeight:
                                                    FontWeight.w900))),
                                    flex: 2)
                              ]),
                          SizedBox(height: 20),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            SinglePostShorted(
                                                defaultSize: false,blogContent: getBlogsResponse.blogs[getBlogsResponse.blogs.length-2].blogContent),
                                            SizedBox(width: 40),
                                            SinglePostShorted(
                                                defaultSize: false,blogContent: getBlogsResponse.blogs[getBlogsResponse.blogs.length-3].blogContent)
                                          ]),
                                          Container(
                                              margin:
                                                  EdgeInsets.only(top: 50),
                                              height: 40,
                                              width: 150,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Colors
                                                          .deepPurpleAccent,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      50)))),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .push(
                                                            MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignUpScreen(),
                                                    ));
                                                  },
                                                  child: Text("Load More")))
                                        ]),
                                    flex: 3),
                                Expanded(
                                    child: Column(
                                        children: List.generate(
                                            3,
                                            (index) => Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        bottom: 20),
                                                child: TitledPost()))),
                                    flex: 2),
                              ]),
                          ]),
                        ),
                  
                       User().logedIn ? Container() :   SignInScreen(key: signIn,successLogin: (){
                           setState(() {
                             User().logedIn=true;
                           });
                           
                         }),
                        SignUpScreen(key: signUp,successSignUp: (){
                          Scrollable.ensureVisible(
                                      signIn.currentContext,
                                      duration: Duration(milliseconds: 500));
                        }),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: WritePostScreen(key: postKey,addedBlog: (){
                               blogRepository.getBlogs().then((value){
      setState(() {
        getBlogsResponse = value;
           scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.linear);
      });
    
    });
                          }),
                        )
                      ]))));
    }));
  }
}

