import 'package:dartz/dartz.dart';
import '../errors/movie_errors.dart';

import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

abstract class GetPopularMoviesUseCase {
  Future<Either<MovieError, List<MovieEntity>>> call();
}

class GetPopularMoviesUseCaseImpl implements GetPopularMoviesUseCase {
  final MovieRepository repository;

  GetPopularMoviesUseCaseImpl({required this.repository});

  @override
  Future<Either<MovieError, List<MovieEntity>>> call() async {
    try {
      final movies = await repository.getPopularMovies();

      return Right(movies);
    } catch (e) {
      return Left(MovieErrorUnexpected());
    }
  }
}
