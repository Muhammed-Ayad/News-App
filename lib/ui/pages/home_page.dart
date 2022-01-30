import 'package:flutter/material.dart';
import 'source_page.dart';
import 'top_news_page.dart';
import '../widgets/headline_title.dart';
import 'news_country_page.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  static const id = '/homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        title: const Text(
          'NewsNow',
          style: TextStyle(color: Colors.teal),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.id);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: const [
          HeadlineTitle(title: 'Publishers'),
          SourcePage(),
          HeadlineTitle(title: 'Top News'),
          TopNewsPage(),
          HeadlineTitle(title: 'News Country'),
          NewsCountryPage()
        ],
      ),
    );
  }
}
