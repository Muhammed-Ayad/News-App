import 'package:flutter/material.dart';
import 'package:news_app/ui/pages/tap_screen.dart';
import 'pages/search_page.dart';

import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      initialRoute: TapScreen.id,
      routes: {
        HomePage.id: (ctx) => const HomePage(),
        SearchPage.id: (ctx) =>  const SearchPage(),
        TapScreen.id:(ctx)=>const TapScreen(),
      },
    );
  }
}
