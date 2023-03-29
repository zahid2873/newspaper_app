import 'package:flutter/material.dart';
import 'package:newspaper_app/model/news_model.dart';
import 'package:newspaper_app/provider/news_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageNo = 5;
  String sortBy = "popularity";
  @override
  Widget build(BuildContext context) {
    Provider.of<NewsProvider>(context).getNewsData(pageNo, sortBy);
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
    );
  }
}
