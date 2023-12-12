import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controller/movies_store.dart';
import '../widgets/movie_widget.dart';

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
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                final movie = controller.movies[index];

                return MovieWidget(movie: movie);
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
