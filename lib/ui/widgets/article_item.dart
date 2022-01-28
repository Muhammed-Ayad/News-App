import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:news_app/providers/favorite_notifier.dart';
import 'package:share_plus/share_plus.dart';
import '../../models/article_model.dart';
import '../pages/details_article_page.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({Key? key, required this.article}) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsArticlePage(article: article),
          ),
        );
      },
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Text(
                      article.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            final addFavorite =
                                ref.read(favoriteChangeNotifierProvider);
                            return IconButton(
                              onPressed: () {
                                addFavorite.addToFav(article);
                              },
                              icon: Icon(
                                addFavorite.isFavorite(article.url)
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        IconButton(
                          onPressed: () {
                            Share.share(article.url);
                          },
                          icon: const Icon(Icons.share),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(DateFormat.MEd().format(article.publishedAt)),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    article.urlToImage != null
                        ? Image.network(
                            article.urlToImage!,
                            fit: BoxFit.cover,
                            height: 140,
                          )
                        : Image.asset(
                            'assets/images/loading.png',
                            fit: BoxFit.cover,
                            height: 140,
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
