import 'package:flutter/material.dart';
import 'package:news_app/pages/pages.dart';
import 'package:provider/provider.dart';
import 'package:news_app/providers/providers.dart';
import 'package:news_app/widgets/custom_bottom_navigator_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bottomNavigatorProvider = Provider.of<BottomNavigatorProvider>(context);

    // TODO: implement build
    return Scaffold(
      body: PageView(
        //physics: const BouncingScrollPhysics(),
        physics: const NeverScrollableScrollPhysics(),
        controller: bottomNavigatorProvider.pageController,
        children: [
          HeadlinePage(),
          CategoryPage()
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigatorbar(),
    );
  }
}
