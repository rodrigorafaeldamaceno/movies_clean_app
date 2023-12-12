import 'package:mobx/mobx.dart';
import 'package:movies_clean_app/modules/movie/domain/entities/movie_entity.dart';

import '../../domain/usecases/get_popular_movies_usecase.dart';
part 'movies_store.g.dart';

class MoviesStore = _MoviesStoreBase with _$MoviesStore;

abstract class _MoviesStoreBase with Store {
  _MoviesStoreBase({required GetPopularMoviesUseCase getPopularMoviesUseCase})
      : _getPopularMoviesUseCase = getPopularMoviesUseCase;

  @readonly
  ObservableList<MovieEntity> _movies = ObservableList<MovieEntity>();

  @readonly
  MoviesState _state = MoviesState.initial;

  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  @computed
  bool get isLoading => _state == MoviesState.loading;

  @computed
  bool get isLoaded => _state == MoviesState.loaded;

  @computed
  bool get isError => _state == MoviesState.error;

  @action
  Future<void> getPopularMovies() async {
    _state = MoviesState.loading;
    _movies.clear();

    try {
      final movies = await _getPopularMoviesUseCase.call();

      movies.fold(
        (error) => _state = MoviesState.error,
        (success) {
          _movies.addAll(success);
          _state = MoviesState.loaded;
        },
      );
    } catch (e) {
      _state = MoviesState.error;
    }
  }
}

enum MoviesState { initial, loading, loaded, error }
