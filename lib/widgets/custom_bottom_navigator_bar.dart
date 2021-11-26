import 'package:flutter/material.dart';
import 'package:news_app/providers/bottom_navigator_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigatorbar extends StatelessWidget {
  const CustomBottomNavigatorbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bottomNavigatorProvider = Provider.of<BottomNavigatorProvider>(context);

    // TODO: implement build
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        fixedColor: Colors.red,
        currentIndex: bottomNavigatorProvider.currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'For you'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.public),
              label: 'Categories'
          )
        ],
      onTap: (index){
          bottomNavigatorProvider.currentIndex = index;
      },
    );
  }
}
