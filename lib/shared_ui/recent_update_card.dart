import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jgh/api/news.dart';
import 'package:jgh/api/news_api.dart';
import 'dart:async';
class RecentUpdate extends StatefulWidget {
  static String routeName = 'RecentUpdate';
  @override
  _RecentUpdateState createState() => _RecentUpdateState();
}
class _RecentUpdateState extends State<RecentUpdate> {
  @override
  final GetData data = GetData();
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: data.getAllNews(),
        builder: (context , AsyncSnapshot snapShot) {
          News news4 = snapShot.data[3];
          News news5 = snapShot.data[4];
          News news6 = snapShot.data[5];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _drawRecentUpdatesCard(Colors.deepOrange.shade900, news4),
              _drawRecentUpdatesCard(Colors.green.shade900, news5),
              _drawRecentUpdatesCard(Colors.green.shade900, news6),

            ],
          );
        }
          );
  }

  Widget _drawRecentUpdatesCard(Color c  , News news) {
    return Card(
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.25,
              child: Image.network(news.urlToImage , fit:BoxFit.fill,)

            ),
          ),
          Padding(
            padding:EdgeInsets.only(top: 16 , left:16),
            child: Container(
              padding: EdgeInsets.only(left: 24 , right: 24 , top: 2 , bottom: 2),
              child: Text(news.author ,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: c,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:8,bottom:8,left:16,right: 16),
            child:Text(news.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:16,right:16,bottom:16,top:8),
            child: Row(
              children: <Widget>[
                Icon(Icons.timer ,color: Colors.black),
                Text('15min', style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

