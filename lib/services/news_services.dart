import 'dart:developer';

import '../data/remote/apis/api.dart';
import '../data/remote/constants/constant.dart';
import '../models/article_model.dart';
import '../models/source_model.dart';

class NewsServices {
  //!  search for in the article title and body.
  static Future<List<ArticleModel>?> getSearchArticles(
      {required String search}) async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/everything?q=$search&apiKey=$apiKey',
    );
    List<ArticleModel> newsData = [];
    if (jsonData['status'] == 'ok') {
      List<dynamic> newsList = jsonData['articles'];

      for (var data in newsList) {
        newsData.add(ArticleModel.fromJson(data));
      }
      log('getSearchArticles :${newsData.toString()}');

      return newsData;
    }
    return [];
  }

  //!  newest articles Popularity
  static Future<List<ArticleModel>?> getNewestArticlesPopularity(
      {required String search}) async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/top-headlines?country=us&sortBy=popularity&apiKey=$apiKey',
    );
    List<ArticleModel> newsData = [];
    if (jsonData['status'] == 'ok') {
      List<dynamic> newsList = jsonData['articles'];

      for (var data in newsList) {
        newsData.add(ArticleModel.fromJson(data));
      }
      log('getNewestArticles :${newsData.toString()}');

      return newsData;
    }
    return [];
  }

  //!  The category you want to get headlines for.
  static Future<List<ArticleModel>?> getOneCategoryOfNews(
      {required String category}) async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/top-headlines?category=$category&apiKey=$apiKey',
    );
    List<ArticleModel> newsData = [];
    if (jsonData['status'] == 'ok') {
      List<dynamic> newsList = jsonData['articles'];

      for (var data in newsList) {
        newsData.add(ArticleModel.fromJson(data));
      }

      log('getOneCategoryOfNews :${newsData.toString()}');

      return newsData;
    }
    return [];
  }

  //!  Get one article from each category
  static Future<ArticleModel?> getOneArticleFromEachCategory(
      {required String category}) async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/top-headlines?category=$category&apiKey=$apiKey',
    );

    Map<String, dynamic> data = jsonData['articles'][0];
    ArticleModel article = ArticleModel.fromJson(data);
    log('getOneArticleFromEachCategory :${article.toString()}');

    return article;
  }

  //!  the country you want to get headlines for.
  static Future<List<ArticleModel>?> getNewsOfSpecificCountry(
      {required String country}) async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/top-headlines?country=$country&apiKey=$apiKey',
    );
    List<ArticleModel> newsData = [];
    if (jsonData['status'] == 'ok') {
      List<dynamic> newsList = jsonData['articles'];

      for (var data in newsList) {
        newsData.add(ArticleModel.fromJson(data));
      }
      log(newsData.toString());
      log('getNewsOfSpecificCountry :${newsData.toString()}');

      return newsData;
    }
    return [];
  }

  //!  News source one of the magazines
  static Future<List<ArticleModel>?> getOneSourceOfMagazines(
      {required String sources}) async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/top-headlines?sources=$sources&apiKey=$apiKey',
    );
    List<ArticleModel> newsData = [];
    if (jsonData['status'] == 'ok') {
      List<dynamic> newsList = jsonData['articles'];

      for (var data in newsList) {
        newsData.add(ArticleModel.fromJson(data));
      }
      log(newsData.toString());
      log('getOneSourceOfMagazines :${newsData.toString()}');

      return newsData;
    }
    return [];
  }

  //!  use to keep track of the publishers available on the API,
  static Future<List<SourceModel>?> getSources() async {
    Map<String, dynamic> jsonData = await API.get(
      url: '$baseUrl/top-headlines/sources?apiKey=$apiKey',
    );
    List<SourceModel> sourcesData = [];
    if (jsonData['status'] == 'ok') {
      List<dynamic> sourcesList = jsonData['sources'];

      for (var data in sourcesList) {
        sourcesData.add(SourceModel.fromJson(data));
      }
      log(sourcesData.toString());
      log('getSources :${sourcesData.toString()}');

      return sourcesData;
    }
    return [];
  }
}
