import 'dart:developer';

import '../../../../core/http/http_client.dart';
import '../../domain/entities/movie_entity.dart';
import '../../infra/datasources/movie_datasource.dart';
import '../mappers/movie_entity_mapper.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final httpClient = HttpClient();
  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    List<MovieEntity> movies = [];

    try {
      final response = await httpClient.get('movie/popular');
      if (response.statusCode == 200) {
        for (var json in response.data['results']) {
          movies.add(MovieEntityMapper.fromJson(json));
        }
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }

    return movies;
  }
}
