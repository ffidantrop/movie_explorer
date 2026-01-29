class Movie {
  final String title;
  final String year;
  final String poster;
  final String actors;
  final String genre;
  final String metascore;
  final String imdbrating;
  final String runtime;

  Movie({
    required this.title,
    required this.year,
    required this.poster,
    required this.actors,
    required this.genre,
    required this.metascore,
    required this.imdbrating,
    required this.runtime
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      year: json['Year'],
      poster: json['Poster'],
      actors: json['Actors'],
      genre: json['Genre'],
      metascore: json['Metascore'],
      imdbrating: json['imdbRating'],
      runtime: json['Runtime']
    );
  }
}