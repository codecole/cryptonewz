import 'package:flutter/material.dart';
import 'package:news_rest_app/models/news_model.dart';
import 'package:news_rest_app/services/api_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel> _newsModel;
  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CryptoNewz'),
      ),
      body: Container(
        child: FutureBuilder<NewsModel>(
          future: _newsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: 1,
//                  itemCount: snapshot.data.articles.length,
                  itemBuilder: (context, index) {
                    var article = snapshot.data.articles[index];
                    return Container(
                      height: 100,
                      color: Colors.pink,
                      child: Row(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                article.urlToImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(article.title,
                                overflow: TextOverflow.ellipsis,),
                                Text(article.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            }
            else
              return Center(child: CircularProgressIndicator());
//          return Center(child: Text('data loading'));
          },

        ),
      ),
    );
  }
}
