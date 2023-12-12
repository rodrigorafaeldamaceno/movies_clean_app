import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;

  String get posterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
  String get backdropUrl => 'https://image.tmdb.org/t/p/w500$backdropPath';

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        backdropPath,
        overview,
        releaseDate,
        voteAverage,
      ];

  @override
  String toString() {
    return 'MovieEntity(id: $id, title: $title, posterPath: $posterPath, backdropPath: $backdropPath, overview: $overview, releaseDate: $releaseDate, voteAverage: $voteAverage)';
  }
}
