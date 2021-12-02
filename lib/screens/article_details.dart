import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/utils/functions.dart';


class ArticleDetails extends StatelessWidget {
  ArticleDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final article = ModalRoute.of(context)!.settings.arguments as Article;

    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                  tag: article.url,
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                          fit: BoxFit.cover,
                          image: articleImage(article.urlToImage)
                      ),
                    ),
                  )
              )
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _ArticleContent(article: article),
            ])
          ),
        ],
      ),
    );
  }
}

class _ArticleContent extends StatelessWidget {
  const _ArticleContent({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.author ?? '', textAlign: TextAlign.left, style: const TextStyle(color: Colors.black54)),
            const SizedBox(height: 5),
            Text(article.title, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 25),
            Text(article.description ?? '', textAlign: TextAlign.justify),
            const SizedBox(height: 10),
            Text(article.content ?? '', textAlign: TextAlign.justify),
          ],
        ),
      ),
    );
  }
}

