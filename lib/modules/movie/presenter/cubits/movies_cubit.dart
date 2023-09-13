import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_app/modules/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_clean_app/modules/movie/presenter/cubits/movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  MoviesCubit({required GetPopularMoviesUseCase getPopularMoviesUseCase})
      : _getPopularMoviesUseCase = getPopularMoviesUseCase,
        super(
          MoviesInitial(),
        );

  Future<void> getPopularMovies() async {
    emit(MoviesLoading());

    try {
      final movies = await _getPopularMoviesUseCase();

      emit(MoviesLoaded(movies));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }
}
