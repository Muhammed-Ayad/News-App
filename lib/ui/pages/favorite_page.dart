import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/favorite_notifier.dart';
import 'package:news_app/ui/widgets/article_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Favorite',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final favoriteList =
              ref.watch(favoriteChangeNotifierProvider).favoriteList;
          return ListView.builder(
            itemCount: favoriteList.length,
            itemBuilder: (context, index) {
              return ArticleItem(article: favoriteList[index]);
            },
          );
        },
      ),
    );
  }
}
