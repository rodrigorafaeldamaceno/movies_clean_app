import 'package:get_it/get_it.dart';

import '../../modules/movie/domain/repositories/movie_repository.dart';
import '../../modules/movie/domain/usecases/get_popular_movies_usecase.dart';
import '../../modules/movie/external/datasources/movie_datasouce_impl.dart';
import '../../modules/movie/infra/datasources/movie_datasource.dart';
import '../../modules/movie/infra/repositories/movies_repository_impl.dart';
import '../../modules/movie/presenter/controller/movies_store.dart';
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
