import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../pages/movie_page.dart';

import '../../domain/entities/movie_entity.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(
          '/movie',
          arguments: MoviesPageProps(movie: movie),
        );
      },
      child: Column(
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
      ),
    );
  }
}
