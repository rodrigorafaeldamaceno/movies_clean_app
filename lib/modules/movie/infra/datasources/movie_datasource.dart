import 'package:movies_clean_app/modules/movie/domain/entities/movie_entity.dart';

abstract class MovieDataSource {
  Future<List<MovieEntity>> getPopularMovies();
}