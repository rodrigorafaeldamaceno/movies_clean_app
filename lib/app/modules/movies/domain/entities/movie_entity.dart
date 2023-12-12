class MovieEntity {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;

  String get posterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
  String get backdropUrl => 'https://image.tmdb.org/t/p/w500$backdropPath';

  MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieEntity &&
        other.id == id &&
        other.title == title &&
        other.posterPath == posterPath &&
        other.backdropPath == backdropPath &&
        other.overview == overview &&
        other.releaseDate == releaseDate &&
        other.voteAverage == voteAverage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        posterPath.hashCode ^
        backdropPath.hashCode ^
        overview.hashCode ^
        releaseDate.hashCode ^
        voteAverage.hashCode;
  }

  @override
  String toString() {
    return 'MovieEntity(id: $id, title: $title, posterPath: $posterPath, backdropPath: $backdropPath, overview: $overview, releaseDate: $releaseDate, voteAverage: $voteAverage)';
  }
}
