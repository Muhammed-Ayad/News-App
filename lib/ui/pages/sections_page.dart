import 'package:flutter/material.dart';

import 'all_category_page.dart';

class SectionsPage extends StatefulWidget {
  const SectionsPage({Key? key}) : super(key: key);

  @override
  State<SectionsPage> createState() => _SectionsPageState();
}

class _SectionsPageState extends State<SectionsPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Sections',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Color(0xff76A0A7),
            unselectedLabelStyle: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            tabs: [
              Tab(text: 'Business'),
              Tab(text: 'Entertainment '),
              Tab(text: 'General '),
              Tab(text: 'Health '),
              Tab(text: 'Science'),
              Tab(text: 'Sports '),
              Tab(text: 'Technology'),
            ],
          ),
        ),
        body: const TabBarView(children: [
          AllCategoryPage(
            category: 'business',
          ),
          AllCategoryPage(
            category: 'entertainment',
          ),
          AllCategoryPage(
            category: 'general',
          ),
          AllCategoryPage(
            category: 'health',
          ),
          AllCategoryPage(
            category: 'science',
          ),
          AllCategoryPage(
            category: 'sports',
          ),
          AllCategoryPage(
            category: 'technology',
          ),
        ]),
      ),
    );
  }
}
