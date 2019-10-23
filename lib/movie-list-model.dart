import 'package:flutter/foundation.dart';

class MovieListModel {
  MovieListModel(
      {@required this.page,
      @required this.totalCount,
      @required this.totalPages,
      @required this.list});

  final int page;
  final int totalCount;
  final int totalPages;
  final List<Movie> list;

  static MovieListModel fromMap(Map<String, dynamic> parsedJson) {
    int page = parsedJson['page'];
    int totalCount = parsedJson['total_results'];
    int totalPages = parsedJson['total_pages'];

    List<Movie> list = [];
    parsedJson['results'].forEach( (data) => list.add(Movie(data)));
    return MovieListModel(page: page, totalCount: totalCount, totalPages: totalPages, list: list);
  }
}

class Movie {
  int _voteCount;
  int _id;
  bool _video;
  String _voteAverage;
  String _title;
  double _popularity;
  String _posterPath;
  String _originalLanguage;
  String _originalTitle;
  List<int> _genreIds = [];
  String _backdropPath;
  bool _adult;
  String _overview;
  String _releaseDate;

  Movie(Map<String, dynamic> result) {
    print(result);
    _voteCount = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _voteAverage = result['vote_average'].toString();
    _title = result['title'];
    _popularity = result['popularity'];
    _posterPath = result['poster_path'];
    _originalLanguage = result['original_language'];
    _originalTitle = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genreIds.add(result['genre_ids'][i]);
    }
    _backdropPath = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
  }

  String get releaseDate => _releaseDate;

  String get overview => _overview;

  bool get adult => _adult;

  String get backdropPath => _backdropPath;

  List<int> get genreIds => _genreIds;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get posterPath => _posterPath;

  double get popularity => _popularity;

  String get title => _title;

  String get voteAverage => _voteAverage;

  bool get video => _video;

  int get id => _id;

  int get voteCount => _voteCount;
}

// class Job {
//   Job({@required this.id, @required this.name, @required this.ratePerHour});
//   final String id;
//   final String name;
//   final int ratePerHour;

//   static Job fromMap(Map<String, dynamic> map,String documentId, ) {
//     if (map == null) return null;
//     return Job(id: documentId, name: map['name'], ratePerHour: map['ratePerHour']);
//   }

//   Map<String, dynamic> toMap() {
//     return {'name': name, 'ratePerHour': ratePerHour};
//   }

//   @override
//   int get hashCode => hashValues(id, name, ratePerHour);

//   @override
//   bool operator ==(other) {
//     if (identical(this, other)) return true;
//     if (runtimeType != other.runtimeType) return false;
//     final Job otherJob = other;
//     return  hashCode == otherJob.hashCode;
//   }
// }
