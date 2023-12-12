import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies_clean_app/app/modules/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_clean_app/app/modules/movies/infra/repositories/movies_repository_impl.dart';

import 'external/datasources/movie_datasouce_impl.dart';
import 'presenter/controller/movies_store.dart';
import 'presenter/pages/movies_page.dart';

class MoviesModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(
      () => MoviesStore(
        getPopularMoviesUseCase: GetPopularMoviesUseCaseImpl(
          repository: MovieRepositoryImpl(
            dataSource: MovieDataSourceImpl(),
          ),
        ),
      ),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const MoviesPage());
  }
}