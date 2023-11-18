import 'package:dartz/dartz.dart';
import 'package:untitled2/features/home/data/model/article_model.dart';

import '../../../../core/errors/failures.dart';
import '../respository/respository.dart';

class GetArticles {

  final HomeRepository repository;

  GetArticles({required this.repository});

  Future<Either<Failure, List<ArticleModel>>> call() => repository.getArticles();

}