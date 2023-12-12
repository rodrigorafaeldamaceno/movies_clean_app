import 'package:dartz/dartz.dart';
import 'package:movies_clean_app/modules/movie/domain/entities/movie_entity.dart';
import 'package:movies_clean_app/modules/movie/domain/repositories/movie_repository.dart';

abstract class GetPopularMoviesUseCase {
  // Future<List<MovieEntity>> call();
  Future<Either<Exception, List<MovieEntity>>> call();
}

class GetPopularMoviesUseCaseImpl implements GetPopularMoviesUseCase {
  final MovieRepository repository;

  GetPopularMoviesUseCaseImpl({required this.repository});

  @override
  Future<Either<Exception, List<MovieEntity>>> call() async {
    try {
      final movies = await repository.getPopularMovies();

      return Right(movies);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
