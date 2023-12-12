import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_clean_app/core/get_it/service_locator.dart';
import 'package:movies_clean_app/modules/movie/presenter/controller/movies_store.dart';

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
          return Column(
            children: <Widget>[
              const Text('Movies Page'),
              Observer(
                builder: (context) {
                  if (controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (controller.isLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: controller.movies.length,
                        itemBuilder: (context, index) {
                          final movie = controller.movies[index];

                          return ListTile(
                            title: Text(movie.title),
                            subtitle: Text(movie.overview),
                          );
                        },
                      ),
                    );
                  } else if (controller.isError) {
                    return const Center(
                      child: Text('error'),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            ],
          );
        },
      ),
    );
  }
}
