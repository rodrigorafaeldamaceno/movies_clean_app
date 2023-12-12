import 'package:get_it/get_it.dart';

import '../http/http_client.dart';

final getIt = GetIt.instance;

void initServiceLocator() {
  getIt.registerFactory<HttpClient>(() => HttpClient());

  //  getIt.registerFactory<MovieDataSource>(() => MovieDataSourceImpl());
  // getIt.registerFactory<MovieRepository>(
  //     () => MovieRepositoryImpl(dataSource: getIt()));
  // getIt.registerFactory<GetPopularMoviesUseCase>(
  //     () => GetPopularMoviesUseCaseImpl(repository: getIt()));

  // getIt.registerFactory<MoviesStore>(
  //     () => MoviesStore(getPopularMoviesUseCase: getIt()));
}
