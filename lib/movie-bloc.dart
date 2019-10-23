 
import 'package:rxdart/rxdart.dart';

import 'movie-list-model.dart';
import 'movie-repository.dart';
 
class MoviesBloc {
  final _repository = MovieRepository();
  final _moviesFetcher = PublishSubject<MovieListModel>();

  Observable<MovieListModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    MovieListModel  model = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(model);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();

 