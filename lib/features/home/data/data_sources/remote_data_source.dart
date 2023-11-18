import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../model/article_model.dart';

abstract class HomeRemoteDataSource{
  Future<List<ArticleModel>> getArticles();
}

class HomeRemoteDataSourceImp implements HomeRemoteDataSource{
  final Dio dio;

  HomeRemoteDataSourceImp({required this.dio});

  String BASE_URL = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=5b00b7a21a3d4bde9deeb407cf382999';

  @override
  Future<List<ArticleModel>> getArticles() async{
    final response = await dio.get(BASE_URL);
    if(response.statusCode == 200){
      List<ArticleModel> articles = [];
      for(var element in response.data['articles']){
        articles.add(ArticleModel.fromJson(element));
      }
      return articles;
    }else{
      throw ServerException();
    }
  }

}