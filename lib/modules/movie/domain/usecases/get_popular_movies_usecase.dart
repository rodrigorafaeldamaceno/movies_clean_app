import 'package:movies_clean_app/modules/movie/domain/entities/movie_entity.dart';
import 'package:movies_clean_app/modules/movie/domain/repositories/movie_repository.dart';

abstract class GetPopularMoviesUseCase {
  Future<List<MovieEntity>> call();
}

class GetPopularMoviesUseCaseImpl implements GetPopularMoviesUseCase {
  final MovieRepository repository;

  GetPopularMoviesUseCaseImpl({required this.repository});

  @override
  Future<List<MovieEntity>> call() async {
    return await repository.getPopularMovies();
  }
}
