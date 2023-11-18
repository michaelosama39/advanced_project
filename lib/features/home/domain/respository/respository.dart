import 'package:dartz/dartz.dart';
import 'package:untitled2/features/home/data/model/article_model.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepository {

  Future<Either<Failure, List<ArticleModel>>> getArticles();

}