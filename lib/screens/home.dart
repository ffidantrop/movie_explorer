import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_explorer/classes/movie.dart';
import 'package:movie_explorer/screens/details_screen.dart';
import 'package:movie_explorer/screens/notes.dart';

const String API_KEY = 'CSNGKJF-8VXM6DR-H4NQRAH-0XWVZPK';

Future<List<Movie>> fetchMovies(String query) async {
  final response = await http.get(
    Uri.parse(
      'https://api.poiskkino.dev/v1.4/movie/search?page=1&limit=20&query=$query',
    ),
    headers: {
      'X-API-KEY': API_KEY,
    },
  );

  final data = jsonDecode(response.body);

  if (response.statusCode == 200) {
    final List list = data['docs'];
    return list.map((e) => Movie.fromJson(e)).toList();
  } else {
    throw Exception('Ошибка загрузки');
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> futureMovies;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureMovies = fetchMovies('Drive');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 102, 46, 28),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 175, 68, 37),
        leading: Icon(
          Icons.coffee_outlined,
          size: 36.0,
          color: Color.fromARGB(255, 235, 220, 178),
        ),
        title: TextField(
          controller: _controller,
          onSubmitted: (value) {
            setState(() {
              futureMovies = fetchMovies(value);
            });
          },
          decoration: InputDecoration(
            hintText: 'Поиск фильма...',
            filled: true,
            fillColor: const Color.fromARGB(255, 235, 220, 178),
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            color: Color.fromARGB(255, 235, 220, 178),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Movie>>(
        future: futureMovies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 235, 220, 178),
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final movies = snapshot.data!;
          if (movies.isEmpty) {
            return const Center(child: Text('Ничего не найдено'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              return Card(
                color: const Color.fromARGB(255, 235, 220, 178),
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  leading: movie.poster != null
                      ? Image.network(movie.poster!, width: 50, fit: BoxFit.cover)
                      : const Icon(Icons.movie),
                  title: Text(movie.title),
                  subtitle: Text(
                    '${movie.year ?? '—'} | ⭐ ${movie.rating ?? '—'}',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetailsScreen(movie: movie),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}



