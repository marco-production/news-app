import 'package:flutter/material.dart';
import 'package:news_app/screens/article_details.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/themes/mainTheme.dart';
import 'package:provider/provider.dart';
import 'package:news_app/providers/providers.dart';

void main() {
  runApp(RunApp());
}

class RunApp extends StatelessWidget {
  RunApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => NewsProvider()),
      ChangeNotifierProvider(create: (context) => BottomNavigatorProvider())
    ],
    child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsMP',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeScreen(),
        '/article-details' : (context) => ArticleDetails(),
      },
    );
  }
}