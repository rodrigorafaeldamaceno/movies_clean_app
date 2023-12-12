import 'package:get_it/get_it.dart';
import 'package:movies_clean_app/core/http/http_client.dart';
import 'package:movies_clean_app/modules/movie/domain/repositories/movie_repository.dart';
import 'package:movies_clean_app/modules/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_clean_app/modules/movie/external/datasources/movie_datasouce_impl.dart';
import 'package:movies_clean_app/modules/movie/infra/datasources/movie_datasource.dart';
import 'package:movies_clean_app/modules/movie/infra/repositories/movies_repository_impl.dart';
import 'package:movies_clean_app/modules/movie/presenter/controller/movies_store.dart';

final getIt = GetIt.instance;

void initServiceLocator() {
  getIt.registerFactory<HttpClient>(() => HttpClient());
  getIt.registerFactory<MovieDataSource>(() => MovieDataSourceImpl());
  getIt.registerFactory<MovieRepository>(
      () => MovieRepositoryImpl(dataSource: getIt()));
  getIt.registerFactory<GetPopularMoviesUseCase>(
      () => GetPopularMoviesUseCaseImpl(repository: getIt()));

  getIt.registerFactory<MoviesStore>(
      () => MoviesStore(getPopularMoviesUseCase: getIt()));
}
