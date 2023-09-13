import 'dart:developer';

import 'package:movies_clean_app/core/http/http_client.dart';
import 'package:movies_clean_app/modules/movie/domain/entities/movie_entity.dart';
import 'package:movies_clean_app/modules/movie/external/mappers/movie_entity_mapper.dart';
import 'package:movies_clean_app/modules/movie/infra/datasources/movie_datasource.dart';

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
