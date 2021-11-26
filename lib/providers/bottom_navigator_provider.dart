
import 'package:flutter/cupertino.dart';

class BottomNavigatorProvider extends ChangeNotifier {

  int _currentIndex = 0;
  String title = 'Home';
  final PageController _pageController = PageController();

  final Map<int, String> _title = {
    0 : 'Home',
    1 : 'News'
  };

  set currentIndex(int index) {
    _currentIndex = index;
    title = _title[index]!;
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 100), curve: Curves.bounceInOut);
    notifyListeners();
  }

  int get currentIndex { return _currentIndex; }
  PageController get pageController { return _pageController; }

}