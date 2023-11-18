import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../../../core/errors/exceptions.dart';
import '../model/article_model.dart';

abstract class HomeLocalDataSource {
  Future<List<ArticleModel>> getArticles();

  Future<void> setArticlesNews(List<ArticleModel> articles);
}

const String SPORTS_CACHING_KEY = 'sports';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final GetStorage getStorage;

  HomeLocalDataSourceImpl({required this.getStorage});

  @override
  Future<List<ArticleModel>> getArticles() async {
    if (getStorage.hasData(SPORTS_CACHING_KEY)) {
      final result = json.decode(await getStorage.read(SPORTS_CACHING_KEY));
      List<ArticleModel> articles = [];
      for (var i in result) {
        articles.add(ArticleModel.fromJson(i));
      }
      return articles;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> setArticlesNews(List<ArticleModel> articles) async{
    print(articles);
    List<dynamic> encodedArticles = [];
    for (var i in articles) {
      encodedArticles.add(i.toJson());
    }
    await getStorage.write(SPORTS_CACHING_KEY, json.encode(encodedArticles));
  }
}
