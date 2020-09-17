import 'package:flutter/material.dart';
import 'package:jgh/api/news_api.dart';
import 'package:jgh/api/popular_news.dart';
class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  final GetPopularData data = GetPopularData();
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  FutureBuilder(
        future: data.getPopularNews(),
        builder:(context , AsyncSnapshot snapShot) {
          PopularNews pop1 = snapShot.data[0];
          PopularNews pop2 = snapShot.data[1];
          PopularNews pop3 = snapShot.data[2];
          PopularNews pop4 = snapShot.data[3];
          PopularNews pop5 = snapShot.data[4];
          PopularNews pop6 = snapShot.data[5];
          PopularNews pop7 = snapShot.data[6];
          PopularNews pop8 = snapShot.data[7];
          PopularNews pop9 = snapShot.data[8];
          PopularNews pop10 = snapShot.data[9];
          PopularNews pop11 = snapShot.data[10];
          PopularNews pop12 = snapShot.data[11];
          PopularNews pop13 = snapShot.data[12];
          PopularNews pop14 = snapShot.data[13];
          PopularNews pop15 = snapShot.data[14];
          PopularNews pop16 = snapShot.data[15];

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _drawTopStories(pop1),
                _drawTopStories(pop2),
                _drawTopStories(pop3),
                _drawTopStories(pop4),
                _drawTopStories(pop5),
                _drawTopStories(pop6),
                _drawTopStories(pop7),
                _drawTopStories(pop8),
                _drawTopStories(pop9),
                _drawTopStories(pop10),
                _drawTopStories(pop11),
                _drawTopStories(pop12),
                _drawTopStories(pop13),
                _drawTopStories(pop14),
                _drawTopStories(pop15),
                _drawTopStories(pop16),

              ]
          );
        }
      ),
  );
  }
  Widget _drawTopStories(PopularNews pop) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 105,
                        height: 105,
                        child:Image.network(pop.urlToImage , fit: BoxFit.fill,)
                      ),
                      SizedBox(width:5),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              pop.title,
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
                                Expanded(
                                  child:Text(pop.author ,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),)

                                /*  Row(
                                  children: <Widget>[
                                    Icon(Icons.timer),
                                    Text('15 min' ,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )*/

                              ],
                            ) ,

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
