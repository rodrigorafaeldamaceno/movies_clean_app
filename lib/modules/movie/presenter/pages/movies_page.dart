import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_app/core/get_it/service_locator.dart';
import 'package:movies_clean_app/modules/movie/presenter/cubits/movies_cubit.dart';
import 'package:movies_clean_app/modules/movie/presenter/cubits/movies_state.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final MoviesCubit cubit = getIt();

  @override
  void initState() {
    super.initState();

    cubit.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies App'),
      ),
      body: BlocProvider(
        create: (_) => cubit,
        child: Column(
          children: <Widget>[
            const Text('Movies Page'),
            BlocConsumer<MoviesCubit, MoviesState>(
              builder: (context, state) {
                if (state is MoviesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MoviesLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];

                        return ListTile(
                          title: Text(movie.title),
                          subtitle: Text(movie.overview),
                        );
                      },
                    ),
                  );
                } else if (state is MoviesError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
              listener: (_, __) {},
            )
          ],
        ),
      ),
    );
  }
}
