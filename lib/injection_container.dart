import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled2/features/home/data/data_sources/local_data_source.dart';
import 'package:untitled2/features/home/data/data_sources/remote_data_source.dart';
import 'package:untitled2/features/home/data/respository/repository_impl.dart';
import 'package:untitled2/features/home/domain/respository/respository.dart';
import 'package:untitled2/features/home/domain/use_cases/get_articles.dart';
import 'package:untitled2/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => HomeBloc(sl()));


  sl.registerLazySingleton(() => GetArticles(repository: sl()));


  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()));


  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImp(dio: sl()));
  sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(getStorage: sl()));


  sl.registerLazySingleton<Dio>(
      () => Dio()..options.validateStatus = (status) => true);
  await GetStorage.init();
  sl.registerLazySingleton<GetStorage>(() => GetStorage());
}
