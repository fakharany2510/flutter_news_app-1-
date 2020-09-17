import 'package:jgh/api/news_api.dart';
import 'package:jgh/screens/home_tabs/favourite.dart';
import 'package:jgh/screens/home_tabs/popular.dart';
import 'package:jgh/screens/home_tabs/what_is_new.dart';
import 'package:jgh/shared_ui/navigation_drawer.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';
  final GetData data = GetData();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopOutMenu{
  HELP,ABOUT,CONTACT,SETTINGS
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  TabController _tabBarController;

  @override
  void initState() {
    super.initState();
    _tabBarController=TabController(length: 3,vsync:this );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange.shade900,
        title: Text('Explore'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){}),
          _popOutMenu(context),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs:[
          Tab(text:'what\'s new'.toUpperCase()),
          Tab(text:'popular'.toUpperCase()),
          Tab(text:'favourites'.toUpperCase()),
        ],
        controller: _tabBarController,),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child:TabBarView(children: [
          WhatIsNew(),
          Popular(),
          Favourite(),
        ],controller: _tabBarController,)
      ),
    );
  }

  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(itemBuilder: (context){
      return[
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.ABOUT,
          child: Text('ABOUT'),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.SETTINGS,
          child: Text('SETTINGS'),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.CONTACT,
          child: Text('CONTACT'),
        ),
        PopupMenuItem<PopOutMenu>(
          value: PopOutMenu.HELP,
          child: Text('HELP'),
        ),
      ];
    },onSelected: (PopOutMenu menu){
      //TODO:
    },
      icon: Icon(Icons.more_vert),
    );
  }
}
