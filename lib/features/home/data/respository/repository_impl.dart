import 'package:dartz/dartz.dart';

import 'package:untitled2/core/errors/failures.dart';

import 'package:untitled2/features/home/data/model/article_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/respository/respository.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl({required this.remoteDataSource , required this.localDataSource});

  @override
  Future<Either<Failure, List<ArticleModel>>> getArticles() async{
    try {
      final result = await remoteDataSource.getArticles();
      localDataSource.setArticlesNews(result);
      return Right(result);
    } on ServerException {
      return _getArticlesFromLocalDataSource();
    }
  }

  Future<Either<Failure, List<ArticleModel>>> _getArticlesFromLocalDataSource() async {
    try {
      final result = await localDataSource.getArticles();
      return Right(result);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

}