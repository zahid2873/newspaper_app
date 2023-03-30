import 'dart:convert';

import 'package:newspaper_app/model/news_model.dart';
import 'package:http/http.dart' as http;


class CostumeHttpRequest{
  static Future<NewsModel> fetchDta(int pageNo, String sortBy)async{
    NewsModel? newsModel;
    try{
      String url = "https://newsapi.org/v2/everything?q=Football&sortBy=$sortBy&page=$pageNo&apiKey=f32a9f46f2c34d2b86db6d6c38e2ff5a";
      var response = await http.get(Uri.parse(url));
      print(response.body);
      var newsData = jsonDecode(response.body);
      newsModel = NewsModel.fromJson(newsData);
      return newsModel!;
    }catch(e){
      print("Something wrong in $e");
      return newsModel!;
    }
  }

  static Future<NewsModel> fetchSearchData(String query) async {
    NewsModel? newsModel;
    try{
      String url = "https://newsapi.org/v2/everything?q=$query&pageSize=25&apiKey=dae4eb4267724b77b9831c0f448decaa";

      var responce = await http.get(Uri.parse(url));
      var data = jsonDecode(responce.body);
      print("our responce is ${data}");
      newsModel = NewsModel.fromJson(data);
      return newsModel!;
    }
    catch(e){
      print("Something is wrong,  $e");
      return newsModel!;
    }
  }

}