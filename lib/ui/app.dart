import 'package:flutter/material.dart';
import 'package:news_app/ui/pages/search_page.dart';

import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (ctx) => const HomePage(),
        SearchPage.id: (ctx) =>  const SearchPage(),
      },
    );
  }
}
