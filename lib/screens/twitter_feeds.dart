import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jgh/shared_ui/navigation_drawer.dart';
class TwitterFeed extends StatefulWidget {
  static String routeName='TwitterFeed';
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Twitter Feed'),
        backgroundColor: Colors.deepOrange.shade900,
        actions: [
          IconButton(icon:Icon(Icons.search) , onPressed: (){},)
        ],
       ),
      drawer: NavigationDrawer(),
      body: ListView.builder(itemBuilder: (context , position){
        
        return Card(
          child: Column(
            children: [
              _cardHeader(),
              _cardBody(),
              _drawingRow(),
              _cardFooter(),
            ],
          ),
        );
      },
      itemCount: 20,
        padding: EdgeInsets.all(5),
      ),

    );
  }
  Widget _cardHeader(){
    return Row(
          children: [
    Padding(
    padding:EdgeInsets.only(top:18 , left:18 , right:18 , bottom: 10),
           child: Container(
             width: 50,
             height: 50,
             decoration: BoxDecoration(
               image: DecorationImage(image: ExactAssetImage('assets/images/twite.png'),fit: BoxFit.cover),
               shape: BoxShape.circle,
             ),
           ),
      ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('A H M E D ' , style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                      Text('eng_ali' ,style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13, ),)
                    ],
                  ),
                  SizedBox(height:8),
                  Text('Fri, 12 May 2017 - 14.30' ,
                     style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13, ),),
                ],
              ),
            ),
          ],
        );
  }
  Widget _cardBody(){
    return Padding(
      padding:EdgeInsets.only(left:30 , top:0 , bottom: 18 , right:10),
      child: Expanded(
        child: Text(
            'we also talk about the future of work '
                'as robots advnce ,'
                ' and we ask whether a retro phone ',
          style: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
      ),
    );
  }
  Widget _drawingRow(){
    return Container(
      height: 2,
      width: double.infinity,
      color: Colors.grey.shade200,
    );
  }
  Widget _cardFooter(){
    return Padding(
      padding: EdgeInsets.only(left:18 , top:0, bottom:4),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(icon: Icon(Icons.repeat),color: Colors.orangeAccent.shade400,onPressed: (){},iconSize: 30,),
              Text('25' ,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
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

    );
  }


}
