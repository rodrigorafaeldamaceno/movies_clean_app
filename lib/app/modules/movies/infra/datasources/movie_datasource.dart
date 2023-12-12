import '../../domain/entities/movie_entity.dart';

abstract class MovieDataSource {
  Future<List<MovieEntity>> getPopularMovies();
}
