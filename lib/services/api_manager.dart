import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_rest_app/constants/strings.dart';
import 'package:news_rest_app/models/news_model.dart';

class API_Manager{

 Future<NewsModel> getNews() async {
 var client = http.Client();
 var newsModel;
 
 try {
   /// getting the data from the api(its url)
   var response = await client.get(Strings.newsUrl);

   /// check that our response is 200 ok
   if (response.statusCode == 200) {
     /// 2. save our response body
     var jsonString = response.body;

     /// create a mapData for our json String
     var jsonMap = json.decode(jsonString);

     /// saving our map data from the mewsModel
     newsModel = NewsModel.fromJson(jsonMap);
   }
 }
 catch(e){
   return newsModel;
 }
 
  }
}