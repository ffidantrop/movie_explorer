import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movie_explorer/screens/notes.dart';
import 'package:http/http.dart' as http;
import 'package:movie_explorer/classes/movie.dart';
import 'package:movie_explorer/constaints.dart';

Future<Movie> fetchMovie(String title) async {
  final response = await http.get(
    Uri.parse('https://www.omdbapi.com/?t=$title&apikey=5bee7d98'),
  );

  final data = jsonDecode(response.body);

  if (response.statusCode == 200 && data['Response'] == 'True') {
    return Movie.fromJson(data);
  } else {
    throw Exception(data['Error'] ?? 'Фильм не найден');
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Movie> futureMovie;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureMovie = fetchMovie('Drive');
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
              futureMovie = fetchMovie(value);
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

      body: Center(
        child: FutureBuilder<Movie>(
          future: futureMovie,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Color.fromARGB(255, 235, 220, 178),
              );
            }
            if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.red),
              );
            }
            if (!snapshot.hasData) {
              return const Text('Нет данных');
            }
            final movie = snapshot.data!;

            return ListView(
              padding: const EdgeInsets.all(24),
              children: [
                if (movie.poster != 'N/A')
                  Image.network(movie.poster, height: 400),

                const SizedBox(height: 16),
                OverflowBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty<Color>.fromMap(
                          <WidgetStatesConstraint, Color>{
                            WidgetState.focused: Color.fromARGB(255, 238, 207, 124),
                            WidgetState.pressed | WidgetState.hovered:
                                Color.fromARGB(255, 238, 207, 124),
                            WidgetState.any: Color.fromARGB(255, 235, 220, 178),
                          },
                        ),
                      ),
                      child: Icon(Icons.remove_red_eye, color: Color.fromARGB(255, 102, 46, 28)),
                      onPressed: () {},
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty<Color>.fromMap(
                          <WidgetStatesConstraint, Color>{
                            WidgetState.focused: Color.fromARGB(255, 238, 207, 124),
                            WidgetState.pressed | WidgetState.hovered:
                                Color.fromARGB(255, 238, 207, 124),
                            WidgetState.any: Color.fromARGB(255, 235, 220, 178),
                          },
                        ),
                      ),
                      child: Icon(Icons.list_alt_rounded, color: Color.fromARGB(255, 102, 46, 28)),
                      onPressed: () {},
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty<Color>.fromMap(
                          <WidgetStatesConstraint, Color>{
                            WidgetState.focused: Color.fromARGB(255, 238, 207, 124),
                            WidgetState.pressed | WidgetState.hovered:
                                Color.fromARGB(255, 238, 207, 124),
                            WidgetState.any: Color.fromARGB(255, 235, 220, 178),
                          },
                        ),
                      ),
                      child: Icon(Icons.favorite,  color: Color.fromARGB(255, 102, 46, 28)),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Center(
                  child: Column(
                    children: [
                      Text(
                        'Название фильма: ${movie.title}',
                        style: myListViewTextStyle,
                      ),
                      Text('Год: ${movie.year}', style: myListViewTextStyle),
                      Text(
                        'Актеры: ${movie.actors}',
                        style: myListViewTextStyle,
                      ),
                      Text(
                        'Рейтинг: IMDB ${movie.imdbrating}',
                        style: myListViewTextStyle,
                      ),
                      Text(
                        'Рейтинг: Metascore ${movie.metascore}',
                        style: myListViewTextStyle,
                      ),
                      Text('Жанр: ${movie.genre}', style: myListViewTextStyle),
                      Text(
                        'Длительность: ${movie.runtime}',
                        style: myListViewTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
