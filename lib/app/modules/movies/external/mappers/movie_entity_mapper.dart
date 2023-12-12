import '../../domain/entities/movie_entity.dart';

class MovieEntityMapper {
  static MovieEntity fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: double.parse(json['vote_average'].toString()),
    );
  }
}
