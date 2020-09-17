import 'package:flutter/material.dart';
import 'package:jgh/screens/home_tabs/favourite.dart';
import 'package:jgh/screens/home_tabs/popular.dart';
import 'package:jgh/screens/home_tabs/what_is_new.dart';
import 'package:jgh/shared_ui/navigation_drawer.dart';
class HeadLineNews extends StatefulWidget {
  static String routeName= 'HeadLineNews';
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews> with SingleTickerProviderStateMixin {
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
        title: Text('HeadLine News'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert),onPressed: (){},)
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
            Favourite(),
            Popular(),
            Favourite(),
          ],controller: _tabBarController,)
      ),
    );
  }
}
