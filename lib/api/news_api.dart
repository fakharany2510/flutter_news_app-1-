import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:jgh/api/popular_news.dart';
import 'news.dart';
import 'dart:convert';
import'package:jgh/api/favourite_api.dart';
class GetData{
  final String apiUrl='https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=183b259467874ccb94d64e648a4546df';
Future<List<News>> getAllNews()async{
  List<News> news = List<News>();
  Response res= await get(apiUrl);
  if(res.statusCode == 200){
    var jsonData= jsonDecode(res.body);
    var data = jsonData["articles"];
    for(var item in data){
      News recentNews = News(item['author'].toString(),
          item['title'].toString(),
          item['description'].toString(),
          item['urlToImage'].toString(),
          item['publishedAt'].toString(),
          item['content'].toString()
      );
        news.add(recentNews);
    }
  }
  return news;
}
}

class GetPopularData{
  final String apiUrl = 'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=183b259467874ccb94d64e648a4546df';
  Future <List<PopularNews>> getPopularNews()async{
    List<PopularNews> popular=List<PopularNews>();
    Response res= await get(apiUrl);
    if(res.statusCode ==200){
     var jsonData=jsonDecode(res.body);
     var data = jsonData["articles"];
     for (var item in data){
       PopularNews popularNews = PopularNews(
         item['title'].toString(),
         item['author'].toString(),
         item['urlToImage'].toString(),
       );
       popular.add(popularNews);
     }
    }
    return popular;
  }
}

class GetFavouriteNews{
  final String apiUrl ='https://newsapi.org/v2/everything?q=bitcoin&apiKey=183b259467874ccb94d64e648a4546df';
  Future <List<FavouriteNews>> getFavouriteNews()async{
    List<FavouriteNews> fav = List<FavouriteNews>();
    Response res = await get(apiUrl);
    if(res.statusCode == 200){
      var jsonData = jsonDecode(res.body);
      var data = jsonData['articles'];
      for(var item in data){
        FavouriteNews favouriteNews = FavouriteNews(
          item['title'].toString(),
          item['author'].toString(),
          item['description'].toString(),
          item['urlToImage'].toString(),
        );
        fav.add(favouriteNews);
      }
    }
    return fav;
  }
}