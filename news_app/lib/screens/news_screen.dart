import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatelessWidget {
  final News news;

  const NewsScreen(this.news, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(news.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              news.urlToImage != null
                  ? Image.network(news.urlToImage ?? '')
                  : SizedBox(),
              Text(
                news.content ?? '',
              ),
              Visibility(
                visible: news.url != null,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      launchUrl(Uri.parse(news.url ?? ''));
                    },
                    child: const Text(
                      'Read More',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
