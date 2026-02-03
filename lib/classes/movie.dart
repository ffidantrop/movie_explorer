class Movie {
  final int id;
  final String title;
  final int? year;
  final String? poster;
  final double? rating;
  final String? description;
  final String? genres;
  final int? length;

  Movie({
    required this.id,
    required this.title,
    this.year,
    this.poster,
    this.rating,
    this.description,
    this.genres,
    this.length,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['name'] ?? 'Без названия',
      year: json['year'],
      poster: json['poster']?['url'],
      rating: json['rating']?['kp']?.toDouble(),
      description: json['description'],
      genres: json['genres'] != null
          ? (json['genres'] as List).map((g) => g['name']).join(', ')
          : null,
      length: json['movieLength'],
    );
  }
}
