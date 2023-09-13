import 'package:movies_clean_app/modules/movie/domain/entities/movie_entity.dart';
import 'package:movies_clean_app/modules/movie/domain/repositories/movie_repository.dart';
import 'package:movies_clean_app/modules/movie/infra/datasources/movie_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  MovieRepositoryImpl({required MovieDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<List<MovieEntity>> getPopularMovies() {
    return _dataSource.getPopularMovies();
  }
}
