import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jgh/models/nav_menu_item.dart';
import 'package:jgh/screens/facebook_feeed.dart';
import 'package:jgh/screens/headline_news.dart';
import 'package:jgh/screens/home_screen.dart';
import 'package:jgh/screens/instgram_feed.dart';
import 'package:jgh/screens/twitter_feeds.dart';
class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenueItem> navMenuNews=[
    NavMenueItem('Explore' , ()=>HomeScreen()),
    NavMenueItem('HeadLine News' , ()=>HeadLineNews()),
    NavMenueItem('Twitter Feed' , ()=>TwitterFeed()),
    NavMenueItem('Instagram Feed' , ()=>InstagramFeed()),
    NavMenueItem('Facebook Feed' , ()=>FaceBookFeed()),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top:50, left:20),
        child: ListView.builder(itemBuilder: (context , position){
          return Padding(
            padding: EdgeInsets.all(4),
             child: ListTile(
                title: Text(navMenuNews[position].title ,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),),
                trailing: Icon(Icons.chevron_right , color: Colors.grey.shade400,),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return navMenuNews[position].destination();
                  }));
                },
              ),
          );
        },
          itemCount: navMenuNews.length,
        ),
      )
    );
  }
}
