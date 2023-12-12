import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/get_it/service_locator.dart';
import '../controller/movies_store.dart';
import '../widgets/movie_widget.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final MoviesStore controller = getIt();

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
