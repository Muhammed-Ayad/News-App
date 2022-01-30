import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers/favorite_notifier.dart';
import 'package:share_plus/share_plus.dart';
import '../../models/article_model.dart';
import '../pages/details_article_page.dart';
import 'cached_net_work_image_item.dart';

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
      child: Card(
        elevation: 15,
        child: SizedBox(
          height: 140,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        child: Text(
                          article.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Consumer(
                            builder: (context, ref, child) {
                              final addFavorite =
                                  ref.watch(favoriteChangeNotifierProvider);
                              return IconButton(
                                onPressed: () {
                                  addFavorite.isFavorite(article.url)
                                      ? addFavorite.removeFromFav(article)
                                      : addFavorite.addToFav(article);
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
                            width: 7,
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
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      CachNetWorkImageItem(
                        heightImageNetWork: 130,
                        heightImageError: 100,
                        imageUrl: article.urlToImage,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
