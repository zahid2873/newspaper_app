import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:newspaper_app/model/news_model.dart';

class NewsDetails extends StatelessWidget {
   NewsDetails({Key? key,this.articles}) : super(key: key);
   Articles ? articles;


  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: '${articles!.url}',
        chooserTitle: 'Example Chooser Title'
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("${articles!.source!.name}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height *.3,
              width: double.infinity,
              child: articles!.urlToImage==null? Center(child: CircularProgressIndicator(),):
              Image.network("${articles!.urlToImage}",fit: BoxFit.cover,),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("${articles!.title}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.newspaper),
                  Text("${articles!.author}"),
                  Spacer(),
                  Icon(Icons.calendar_month_sharp),
                  Text("${articles!.publishedAt}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("${articles!.description}"),
            ),
          ],
        ),
      ),
    );
   }
}
