import 'package:flutter/material.dart';
import 'package:newspaper_app/http/http_request.dart';
import 'package:newspaper_app/model/news_model.dart';

class NewsProvider with ChangeNotifier{
  NewsModel ? newsModel;
  Future<NewsModel> getNewsData(int pageNo, String sortBy) async{
    newsModel = await CostumeHttpRequest.fetchDta(pageNo, sortBy);
    return newsModel!;
  }
}