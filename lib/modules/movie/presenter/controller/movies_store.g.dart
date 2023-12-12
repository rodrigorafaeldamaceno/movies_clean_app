// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoviesStore on _MoviesStoreBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_MoviesStoreBase.isLoading'))
          .value;
  Computed<bool>? _$isLoadedComputed;

  @override
  bool get isLoaded =>
      (_$isLoadedComputed ??= Computed<bool>(() => super.isLoaded,
              name: '_MoviesStoreBase.isLoaded'))
          .value;
  Computed<bool>? _$isErrorComputed;

  @override
  bool get isError => (_$isErrorComputed ??=
          Computed<bool>(() => super.isError, name: '_MoviesStoreBase.isError'))
      .value;

  late final _$_moviesAtom =
      Atom(name: '_MoviesStoreBase._movies', context: context);

  ObservableList<MovieEntity> get movies {
    _$_moviesAtom.reportRead();
    return super._movies;
  }

  @override
  ObservableList<MovieEntity> get _movies => movies;

  @override
  set _movies(ObservableList<MovieEntity> value) {
    _$_moviesAtom.reportWrite(value, super._movies, () {
      super._movies = value;
    });
  }

  late final _$_stateAtom =
      Atom(name: '_MoviesStoreBase._state', context: context);

  MoviesState get state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  MoviesState get _state => state;

  @override
  set _state(MoviesState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$getPopularMoviesAsyncAction =
      AsyncAction('_MoviesStoreBase.getPopularMovies', context: context);

  @override
  Future<void> getPopularMovies() {
    return _$getPopularMoviesAsyncAction.run(() => super.getPopularMovies());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoaded: ${isLoaded},
isError: ${isError}
    ''';
  }
}
