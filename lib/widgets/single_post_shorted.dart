import 'package:flutter/material.dart';

import '../pages/single_blog/single_blog.dart';

class SinglePostShorted extends StatelessWidget {
  final bool defaultSize;
  String blogContent;
   SinglePostShorted({Key key,this.defaultSize = true,this.blogContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(width: defaultSize ? 600 : 280,child: Image.asset("assets/images/blog.jpeg",fit: BoxFit.cover,), height:defaultSize ? 250 : 200),
          SizedBox(height: 5),
          SizedBox(width: defaultSize ? 600 : 270,
            child: Text("Lorem Ipsum has been the industry's standard dummy",
                style: TextStyle(fontSize: defaultSize ? 14 : 13,fontWeight: FontWeight.w900)),
          ),
          SizedBox(height: 10),
          SizedBox(width:defaultSize? 500 : 270,
            child: Text(
                blogContent == null ?"text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to makea type specimen book. It has survived not only leap into electronic typesetting, remaining essentially unchanged. It waspopularised in the 1960s with the release of Letraset sheets containingLorem Ipsum passages" : blogContent,maxLines: 4,style: TextStyle(fontSize: defaultSize?14:13),),
          ),
          SizedBox(height: 15),
          GestureDetector(
              child: Row(
                  children: [
                    Text("Read article  ",
                        style: TextStyle(fontSize: defaultSize ? 14 : 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurpleAccent)),
                    Icon(Icons.arrow_forward_outlined,
                        size: defaultSize ? 14 : 12, color: Colors.deepPurpleAccent)
                  ]),
              onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleBlogScreen(blogContent: blogContent)));
              })
        ]));
  }
}
