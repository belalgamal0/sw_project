import 'package:flutter/material.dart';

class SinglePostShorted extends StatelessWidget {
  final bool defaultSize;
  const SinglePostShorted({Key key,this.defaultSize = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // constraints: BoxConstraints(maxWidth: 550, minWidth: 100),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(width: defaultSize ? 600 : 280, height:defaultSize ? 250 : 200, color: Colors.black),
          SizedBox(height: 5),
          SizedBox(width: defaultSize ? 600 : 270,
            child: Text("Lorem Ipsum has been the industry's standard dummy",
                style: TextStyle(fontSize: defaultSize ? 14 : 13,fontWeight: FontWeight.w900)),
          ),
          SizedBox(height: 10),
          SizedBox(width:defaultSize? 500 : 270,
            child: Text(
                "text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to makea type specimen book. It has survived not only leap into electronic typesetting, remaining essentially unchanged. It waspopularised in the 1960s with the release of Letraset sheets containingLorem Ipsum passages",maxLines: 4,style: TextStyle(fontSize: defaultSize?14:13),),
          ),
          SizedBox(height: 15),
          GestureDetector(
              child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Read article  ",
                        style: TextStyle(fontSize: defaultSize ? 14 : 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurpleAccent)),
                    Icon(Icons.arrow_forward_outlined,
                        size: defaultSize ? 14 : 12, color: Colors.deepPurpleAccent)
                  ]),
              onTap: () {})
        ]));
  }
}
