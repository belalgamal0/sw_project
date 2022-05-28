import 'package:flutter/material.dart';
import '../../helpers/user.dart';
import '../../repository/blog_repository/blog_repository.dart';

class WritePostScreen extends StatelessWidget {
  Function addedBlog;
  WritePostScreen({Key key,this.addedBlog}) : super(key: key);
  final BlogRepository _blogRepository = BlogRepository();
  final TextEditingController blogController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          User().logedIn ? Row(children: [Spacer(),Text("${User().userEmail}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),SizedBox(width:10),ClipRRect(borderRadius: BorderRadius.all(Radius.circular(50)),child: Image.asset("assets/images/profile.jpg",width: 45, height:45,fit: BoxFit.cover))]) : Container(),
          SizedBox(height: 20),
          Container(
              height: 300,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(25)),
              child: TextField(
                controller: blogController,
                maxLines: 20,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Write a post!"),
              )),
          SizedBox(height: 15),
          SizedBox(
            height: 40,
            width: 120,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)))),
                onPressed: () async {
                  if (blogController.text != "" && User().logedIn) {
                    await _blogRepository.addBlog({
                      "author": "BelAl",
                      "author_id": "100",
                      "blog_body": "${blogController.text}"
                    }).then((value){
                      blogController.clear();
                      addedBlog();
                    });
                  }
                },
                child: Text(
                  "Post",
                  style: TextStyle(fontSize: 18)
                )),
          )
        ],
      ),
    );
  }
}
