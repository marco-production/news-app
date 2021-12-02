import 'package:flutter/material.dart';
import 'package:news_app/providers/providers.dart';
import 'package:news_app/widgets/news_list.dart';
import 'package:provider/provider.dart';

class HeadlinePage extends StatefulWidget {
  HeadlinePage({Key? key}) : super(key: key);

  @override
  State<HeadlinePage> createState() => _HeadlinePageState();
}

class _HeadlinePageState extends State<HeadlinePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final newProvider = Provider.of<NewsProvider>(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Top Headlines'), backgroundColor: Colors.redAccent),
      body: Container(
        color: Colors.white,
        child: NewsList(articles: newProvider.topHeadlines),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
