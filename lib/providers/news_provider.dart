import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/models/models.dart';
import 'package:http/http.dart' as http;

class NewsProvider extends ChangeNotifier {

  NewsProvider() {
    getArticles();
    categories.forEach((element) {
      _categoryArticle[element.name] = [];
    });
    getArticlesByCategory();
  }

  List<Article> articles     = [],
                topHeadlines = [];

  final _baseURL = 'newsapi.org',
        _apiKey  = '6cd7ac9f2c64460a9fe565de50b88c96';

  String _categorySelected = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, "business"),
    Category(FontAwesomeIcons.addressCard, "general"),
    Category(FontAwesomeIcons.headSideVirus, "health"),
    Category(FontAwesomeIcons.vials, "science"),
    Category(FontAwesomeIcons.volleyballBall, "sports"),
    Category(FontAwesomeIcons.memory, "technology"),
    Category(FontAwesomeIcons.tv, "entertainment"),
  ];

  final Map<String, List<Article>> _categoryArticle = {};

  set category(String category){
    _categorySelected = category;
    getArticlesByCategory();
    notifyListeners();
  }

  String get category => _categorySelected;

  getArticles() async {

    final url = Uri.https(_baseURL, '/v2/top-headlines', {'country' : 'us', 'apiKey' : _apiKey});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final news = newsFromJson(response.body);
      topHeadlines.addAll(news.articles);
      notifyListeners();
    }
  }

  getArticlesByCategory() async {
    if (_categoryArticle[_categorySelected]!.isNotEmpty) {
      articles = _categoryArticle[_categorySelected]!;
    } else {
      final url = Uri.https(_baseURL, '/v2/top-headlines', {'country': 'us', 'category': _categorySelected, 'apiKey': _apiKey});
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final news = newsFromJson(response.body);
        _categoryArticle[_categorySelected]!.addAll(news.articles);
        articles = _categoryArticle[_categorySelected]!;
        notifyListeners();
      }
    }
  }
}