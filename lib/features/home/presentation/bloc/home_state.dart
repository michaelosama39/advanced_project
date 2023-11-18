part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<ArticleModel> articles;

  HomeLoadedState(this.articles);

  @override
  List<Object> get props => [articles];
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState(this.message);

  @override
  List<Object> get props => [message];
}
