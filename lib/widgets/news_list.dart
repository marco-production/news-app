import 'package:flutter/material.dart';
import 'package:news_app/models/models.dart';

class NewsList extends StatelessWidget {
  NewsList({Key? key, required this.articles}) : super(key: key);

  late List<Article> articles = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(articles.isEmpty){
      return Scaffold(body: Container(child: const Center(child: CircularProgressIndicator(color: Colors.red))));
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return ArticleContainer(article: articles[index], index: index, total: articles.length);
        });
  }
}

class ArticleContainer extends StatelessWidget {
  ArticleContainer({Key? key, required this.article, required this.index, required this.total})
      : super(key: key);

  Article article;
  int index;
  int total;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: const EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 20),
        child: Column(
          children: [
            //Author
            _ArticleContainerRow(index: index, article: article),
            const SizedBox(height: 5),
            //Title of Article
            Text(article.title, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            //Image of Article
            _ArticleImageContainer(image: article.urlToImage),
            const SizedBox(height: 10),
            //Description of Article
            Text(article.description ?? ''),
            const SizedBox(height: 15),
            //Action Buttons
            const _ArticleActionButtons(),
            const SizedBox(height: 20),
            total != index + 1 ? const Divider() : Container(),
            total != index + 1 ? const SizedBox(height: 5) : Container(),
          ],
        ));
  }
}

class _ArticleContainerRow extends StatelessWidget {
  const _ArticleContainerRow({
    Key? key,
    required this.index,
    required this.article,
  }) : super(key: key);

  final int index;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('${index + 1}. ', style: const TextStyle(color: Colors.red)),
        Expanded(
            child: Text(
          article.author != null && article.author != ''
              ? article.author!
              : 'No author',
          maxLines: 2,
          overflow: TextOverflow.clip,
        ))
      ],
    );
  }
}

class _ArticleImageContainer extends StatelessWidget {
  const _ArticleImageContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
        child: Container(
            child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/placeholder.gif'),
                image: articleImage())));
  }

  ImageProvider articleImage() {
    if (image == null) {
      return const AssetImage('assets/no-image.png');
    } else {
      return NetworkImage(image!);
    }
  }
}

class _ArticleActionButtons extends StatelessWidget {
  const _ArticleActionButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.redAccent,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.star, color: Colors.white)),
        const SizedBox(width: 25),
        RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.lightBlue,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.more, color: Colors.white)),
      ],
    );
  }
}