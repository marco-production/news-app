import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/providers/providers.dart';
import 'package:news_app/utils/functions.dart';
import 'package:news_app/widgets/news_list.dart';
import 'package:provider/provider.dart';


class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final newsProvider = Provider.of<NewsProvider>(context);

    // TODO: implement build
    return SafeArea(child: Scaffold(
      body: Column(
        children: <Widget>[
          CategoryContainer(categories: newsProvider.categories),
          Expanded(child: NewsList(articles: newsProvider.articles)),
        ],
      )
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class CategoryContainer extends StatelessWidget {
  CategoryContainer({
    Key? key,
    required this.categories
  }) : super(key: key);

  late List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 115,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index){
            return _CategoryButton(category: categories[index]);
          }
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    Key? key,
    required this.category
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {

    final newsProvider = Provider.of<NewsProvider>(context);

    // TODO: implement build
    return GestureDetector(
      onTap: (){
        newsProvider.category = category.name;
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 13.0, top: 16.0, left: 13.0, bottom: 15.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (newsProvider.category == category.name) ? Colors.grey : Colors.red,
              ),
              child: Center(child: FaIcon(category.icon, color: Colors.white,))
            ),
            const SizedBox(height: 5),
            Text(capitalize(category.name))
          ],
        ),
      ),
    );
  }
}


