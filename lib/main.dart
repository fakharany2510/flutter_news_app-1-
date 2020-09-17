import 'package:jgh/screens/facebook_feeed.dart';
import 'package:jgh/screens/headline_news.dart';
import 'package:jgh/screens/home_screen.dart';
import 'package:jgh/screens/home_tabs/favourite.dart';
import 'package:jgh/screens/home_tabs/what_is_new.dart';
import 'package:jgh/screens/instgram_feed.dart';
import 'package:jgh/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:jgh/screens/twitter_feeds.dart';
import 'package:jgh/shared_ui/recent_update_card.dart';

void main() {
  runApp(News());
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
      initialRoute: OnBoarding.routeName,
      routes:{
        OnBoarding.routeName:(ctx)=>OnBoarding(),
        HomeScreen.routeName:(ctx)=>HomeScreen(),
        WhatIsNew.routeName:(ctx)=>WhatIsNew(),
        RecentUpdate.routeName:(ctx)=>RecentUpdate(),
        Favourite.routeName:(ctx)=>Favourite(),
        HeadLineNews.routeName:(ctx)=>HeadLineNews(),
        TwitterFeed.routeName:(ctx)=>TwitterFeed(),
        InstagramFeed.routeName:(ctx)=>InstagramFeed(),
        FaceBookFeed.routeName:(ctx)=>FaceBookFeed(),
      },
    );
  }
}

