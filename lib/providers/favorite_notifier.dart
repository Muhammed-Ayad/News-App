import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/models/article_model.dart';

final favoriteChangeNotifierProvider =
    ChangeNotifierProvider<FavoriteNotifier>((ref) => FavoriteNotifier());

class FavoriteNotifier extends ChangeNotifier {
  List<ArticleModel> _articleList = [];

  List<ArticleModel> get favoriteList => _articleList;

  void addToFav(ArticleModel article) {
    _articleList.add(article);
    notifyListeners();
  }

  void removeFromFav(ArticleModel article) {
    _articleList.remove(article);
    notifyListeners();
  }

 


  bool isFavorite(String id) {
    return _articleList.any((article) => article.url == id);
  }
}
