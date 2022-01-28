import 'package:flutter/material.dart';
import 'search_page.dart';

class HomePage extends StatelessWidget {
  static const id = '/homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: const Text(
          'NewsNow',
          style: TextStyle(color: Colors.black),
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
      body: const Center(
        child: Text('News App'),
      ),
    );
  }
}
