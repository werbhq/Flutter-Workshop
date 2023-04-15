import 'package:flutter/material.dart';
import 'package:news_app/utilities/networking.dart';

import 'models/news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'News App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<News> news = [];
  bool isLoading = true;

  void loadNews() async {
    setState(() {
      isLoading = true;
    });
    isLoading = true;
    news = await NetworkHelper.getData() ?? [];
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          isLoading
              ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                )
              : IconButton(
                  onPressed: loadNews,
                  icon: const Icon(Icons.refresh),
                ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.white),
              ),
              child: ListTile(
                title: Text(news[index].title),
                subtitle: Text(news[index].description ?? ''),
                leading: news[index].urlToImage != null
                    ? Image.network(news[index].urlToImage!)
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
