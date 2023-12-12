import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controller/movies_store.dart';
import '../widgets/movie_card.dart';
import 'movie_page.dart';

class MoviesListPage extends StatefulWidget {
  const MoviesListPage({super.key});

  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  final MoviesStore controller = Modular.get();

  @override
  void initState() {
    super.initState();

    controller.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies App'),
      ),
      body: Observer(
        builder: (context) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.isLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: controller.movies.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final movie = controller.movies[index];

                return MovieCard(
                  movie: movie,
                  onTap: () {
                    Modular.to.pushNamed(
                      '/movie',
                      arguments: MoviesPageProps(movie: movie),
                    );
                  },
                );
              },
            );
          } else if (controller.isError) {
            return const Center(
              child: Text('error'),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
