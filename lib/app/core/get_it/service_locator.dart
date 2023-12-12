import 'package:get_it/get_it.dart';

import '../../modules/movies/domain/repositories/movie_repository.dart';
import '../../modules/movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../modules/movies/external/datasources/movie_datasouce_impl.dart';
import '../../modules/movies/infra/datasources/movie_datasource.dart';
import '../../modules/movies/infra/repositories/movies_repository_impl.dart';
import '../../modules/movies/presenter/controller/movies_store.dart';
import '../http/http_client.dart';

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
