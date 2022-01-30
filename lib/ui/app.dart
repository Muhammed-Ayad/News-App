import 'package:flutter/material.dart';
import 'pages/tab_pages.dart';
import 'pages/search_page.dart';

import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      initialRoute: TabPages.id,
      routes: {
        HomePage.id: (ctx) => const HomePage(),
        SearchPage.id: (ctx) =>  const SearchPage(),
        TabPages.id:(ctx)=>const TabPages(),
      },
    );
  }
}
