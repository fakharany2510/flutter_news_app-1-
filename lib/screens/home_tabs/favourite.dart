import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jgh/api/favourite_api.dart';
import 'package:jgh/api/news_api.dart';
class Favourite extends StatefulWidget {
  static String routeName = 'Favourite';
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Color> colorList=[
    Colors.deepOrange,
    Colors.green,
    Colors.blue,
    Colors.purpleAccent,
    Colors.orange,
    Colors.tealAccent,
  ];
  Random random = Random();
  Color _getRandomColor(){
    return colorList[random.nextInt(colorList.length)];
  }
  GetFavouriteNews data = GetFavouriteNews();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: FutureBuilder(
            future: data.getFavouriteNews(),
            builder: (context , AsyncSnapshot snapshot){
            FavouriteNews fav1 = snapshot.data[0];
            FavouriteNews fav2 = snapshot.data[1];
            FavouriteNews fav3 = snapshot.data[2];
            FavouriteNews fav4 = snapshot.data[3];
            return Column(
              children: [
                _authorRow(fav1),
                SizedBox(width: 16,),
                _newItemRow(fav1),
                _authorRow(fav2),
                SizedBox(width: 16,),
                _newItemRow(fav2),
                _authorRow(fav3),
                SizedBox(width: 16,),
                _newItemRow(fav3),
                _authorRow(fav4),
                SizedBox(width: 16,),
                _newItemRow(fav4),
              ],
            );
            },
    )
        ),
      )
   );
  }

  Widget _authorRow(FavouriteNews fav){
   return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Row(
         children: [
           Container(
             decoration: BoxDecoration(
               image: DecorationImage(image: ExactAssetImage('assets/images/p.png'),fit:BoxFit.fill),
               shape: BoxShape.circle,
             ),
             width: 50,
             height: 50,
           ),
           SizedBox(width: 10,),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(fav.title ,
               maxLines: 2,
               style: TextStyle(
                 color: Colors.grey,
                 fontSize: 14,
               ),
               ),

               SizedBox(height: 3,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                 /*Text('15 min' ,
                   style: TextStyle(
                     color: Colors.grey,
                     fontSize: 12,
                   ), ),*/
                 SizedBox(width: 2,),
                 Text('Life Style' ,
                   style: TextStyle(
                     color: _getRandomColor(),
                     fontSize: 11,
                   ), ),

               ],),

             ],
           )
         ],
       ),
       IconButton(icon:Icon(Icons.bookmark_border),onPressed: (){},)
     ],
   );
  }
  Widget _newItemRow(FavouriteNews fav){
    return Row(
      children: [
        Container(
          child: Image.network(fav.urlToImage , fit: BoxFit.fill,),
          width: 100,
          height: 135,
        ),
        SizedBox(width:5,),
        Expanded(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(fav.author,
                maxLines: 3,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

            SizedBox(height:8,),
               Text(fav.description,
                maxLines: 4,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  height: 1.25,
                ),

              ),

          ],
        ),
    )
      ],
    );
  }

}
