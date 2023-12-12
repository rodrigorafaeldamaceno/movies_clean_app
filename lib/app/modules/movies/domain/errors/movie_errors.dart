abstract class MovieError implements Exception {
  final String message;
  MovieError({required this.message});
}

class MovieErrorUnexpected extends MovieError {
  MovieErrorUnexpected() : super(message: 'Unexpected error');
}
