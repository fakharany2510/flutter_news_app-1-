import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jgh/api/news.dart';
import 'package:jgh/api/news_api.dart';
import 'package:jgh/shared_ui/recent_update_card.dart';
import 'dart:async';
class WhatIsNew extends StatefulWidget {
  static String routeName = 'WhatIsNew';
  @override
  _WhatIsNewState createState() => _WhatIsNewState();
}

class _WhatIsNewState extends State<WhatIsNew> {
  final GetData data = GetData();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder(
            future: data.getAllNews(),
            builder: (context , AsyncSnapshot snapShot) {
              News news1 = snapShot.data[0];
              News news2 = snapShot.data[1];
              News news3 = snapShot.data[2];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _drawHeader(),
                  Padding(
                    padding: EdgeInsets.only(top: 16, left: 16),
                    child: Text(
                      'Top Stories',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  _drawTopStories(news1),
                  _drawTopStories(news2),
                  _drawTopStories(news3),
                  RecentUpdate(),
                ],
              );
            },
    ),
    );
  }

  Widget _drawHeader(){
    return Container(
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height*.3,
      child:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Corona virus sweeps the United States'
                  .toUpperCase()
              ,textAlign:TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height:8,
            ),
            Text(
              'Trump calls on the Minister of Health to resign as soon as possible'
              ,textAlign:TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),

          ],
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(image: ExactAssetImage('assets/images/news2.jpg'),fit: BoxFit.fill),
      ),
    );
  }
  Widget _drawTopStories(News news) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        children: <Widget>[
          Card(
            child:Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 105,
                        height: 105,
                        child:Image.network(news.urlToImage , fit: BoxFit.fill),
                      ),
                      SizedBox(width:5),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              news.title,
                              //'The global economy is in continuous collapse',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height:16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(news.author ,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.timer),
                                    Text('15 min' ,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),


          )
        ],
      ),
    );
  }
}
