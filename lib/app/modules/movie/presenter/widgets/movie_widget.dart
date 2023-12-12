import 'package:flutter/material.dart';

import '../../domain/entities/movie_entity.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(
          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          height: 200,
        ),
        Text(
          '${movie.title}\n',
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ],
    );
  }
}
