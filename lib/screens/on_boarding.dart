import 'package:jgh/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  @override
  static String routeName='OnBoarding';
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    child: Image(
                      image: AssetImage('assets/images/back.jpg'),
                      fit: BoxFit.fill,
                    ),
                    ),
                  Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: <Widget>[
                  Padding(
                     padding:EdgeInsets.only(top:130 ),
                    child:Center(
                      child: Image(
                          image: AssetImage('assets/icons/news.png')
                      ),
                    ),
                  ),
                           Text('AKHBARAK'.toUpperCase() ,
                                     style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 20,
                                       fontWeight: FontWeight.bold,
                                       fontFamily: 'Pacifico',
                                       letterSpacing: 1.5,
                                     ),
                           ),

                Padding(
                padding:EdgeInsets.only(top:10 , left:50 , right:50),
                child:Center(
                child: Text(
                  'This application specializes in showing all the daily news that'
                      ' makes you fully aware of what is '
                      'happening around you and adds to you more valuable'
                      ' life information'
                ,textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    letterSpacing: 1,
                  ),),
                ),
               ),
                           Padding(
                            padding:EdgeInsets.only(top:150),
                            child:Center(
                                child:Container(
                                  color: Colors.deepOrange.shade700,
                                  width: 340,
                                  height:40,
                                  child: RaisedButton(
                                    child: Text('GET START' ,
                                      style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    color:Colors.deepOrange.shade700 ,
                                    onPressed: (){
                                      Navigator.pushNamed(context, HomeScreen.routeName);
                                    },
                                  ),
                                )
                            ),
                          ),


                         ]
                       ),
                  ],
                ),

        ],
      ),
    );
  }
}
