import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  MovieRepositoryImpl({required MovieDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<List<MovieEntity>> getPopularMovies() {
    return _dataSource.getPopularMovies();
  }
}
