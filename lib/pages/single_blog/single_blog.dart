import 'package:flutter/material.dart';

class SingleBlogScreen extends StatefulWidget {
  final String blogContent;
  const SingleBlogScreen({Key key, this.blogContent}) : super(key: key);

  @override
  State<SingleBlogScreen> createState() => _SingleBlogScreenState();
}

class _SingleBlogScreenState extends State<SingleBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 20),
        Container(
            width: 600,
            child: Image.asset("assets/images/blog.jpeg", fit: BoxFit.cover),
            height: 250),
        SizedBox(height: 5),
        SizedBox(
            width: 600,
            child: Text("Lorem Ipsum has been the industry's standard dummy", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900))),
        SizedBox(height: 10),
        SizedBox(
            width: 500,
            child: Text(widget.blogContent, style: TextStyle(fontSize: 14))),
        SizedBox(height: 20),
        SizedBox(
          height: 40,
          width: 220,
          child: ElevatedButton(
              child: Text("Back to home", style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)))),
              onPressed: () {
                Navigator.pop(context);
              }) )
      ]))));
  }
}
