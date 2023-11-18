import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:untitled2/features/home/data/model/article_model.dart';
import 'package:untitled2/features/home/domain/use_cases/get_articles.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetArticles getArticles;

  HomeBloc(this.getArticles) : super(HomeInitial()) {
    on<HomeGetArticlesEvent>((event, emit) async {
      emit(HomeLoadingState());
      final res = await getArticles();
      res.fold(
        (failure) => emit(HomeErrorState('Error Has Occurred, Try Again!')),
        (articles) => emit(HomeLoadedState(articles)),
      );
    });
  }
}
