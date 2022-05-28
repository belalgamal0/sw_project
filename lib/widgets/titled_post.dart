import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TitledPost extends StatelessWidget {
  const TitledPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(constraints: BoxConstraints(maxWidth: 400, minWidth: 100),child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Container(child: Image.asset("assets/images/blog1.jpeg"),width: 180,height: 150,),
      SizedBox(width: 20),
      Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
         Wrap(children: [Container(width: 170,child: Text("If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything",   style: TextStyle(
                          fontWeight: FontWeight.w600)))]),
       SizedBox(height: 15),
        GestureDetector(
            child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Read article  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: 13,
                          color: Colors.deepPurpleAccent)),
                  Icon(Icons.arrow_forward_outlined,
                      size: 14, color: Colors.deepPurpleAccent)
                ]),
            onTap: () {})
      ],)
    ]),);
  }
}



