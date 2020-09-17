import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jgh/shared_ui/navigation_drawer.dart';
class InstagramFeed extends StatefulWidget {
  static String routeName='InstagramFeed';
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Feed '),
        backgroundColor: Colors.deepOrange.shade900,
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(itemBuilder:(context , position){
        return Card(
          child: Column(
            children: [
              _drawHeader(),
              _drawBody(),
              _cardFooter(),
            ],
          ),
        );
      },
      itemCount:20,
      padding: EdgeInsets.all(8),
      ),
    );
  }

  Widget _drawHeader(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
                padding:EdgeInsets.only(top:18 , left:18 , right:18 , bottom: 10),
                child:Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: ExactAssetImage('assets/images/insta2.png'),fit: BoxFit.fill),
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ahmed Ali Elfakharany' ,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height:8),
                Text('Fri, 12 May 2017 - 14.30' ,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13, ),),
              ],
            ),
          ],
    ),
        Row(
          children: [
            IconButton(icon: Icon(Icons.favorite),color: Colors.grey,onPressed: (){},),
            Transform.translate(
                offset: Offset(-10 , 0),
              child:Text('25' , style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),),
            )
          ],
        ),
      ],
    );
  }
  Widget _drawBody(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    Padding(
    padding: EdgeInsets.only(left: 18 , right: 18),
          child:Text('we also talk about the future of wor' ,style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),),),
          SizedBox(height:5),
    Padding(
    padding: EdgeInsets.only(left: 18 , right: 18),
         child: Text('#advanced dream instagram' , style: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),),),
          SizedBox(height:18),
          Container(
            width: MediaQuery.of(context).size.width*1,
            height: MediaQuery.of(context).size.height*.4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: ExactAssetImage('assets/images/insta.png'),fit: BoxFit.fill),
            ),
          )
        ],
      );
  }
  Widget _cardFooter(){
    return Padding(
      padding: EdgeInsets.only(left:18 , top:0, bottom:4),
      child:Expanded(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FlatButton(onPressed: (){},child: Text('10 COMMENTS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent.shade400)),),
              ],
            ),
            Row(
              children: [
                FlatButton(onPressed: (){},child: Text('SHARE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent.shade400)),),
                FlatButton(onPressed: (){},child: Text('OPEN',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent.shade400))),
              ],
            )
          ],
        ),
      ),

    );
  }
}
