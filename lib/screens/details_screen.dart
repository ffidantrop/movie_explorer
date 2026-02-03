import 'package:flutter/material.dart';
import 'package:movie_explorer/classes/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 102, 46, 28),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 175, 68, 37),
        title: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 235, 220, 178),
          ),
          onPressed: null,
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Text(
              movie.title,
              style: TextStyle(
                color: Color.fromARGB(255, 102, 46, 28),
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          if (movie.poster != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(movie.poster!, height: 400),
            ),
          const SizedBox(height: 24),
          OverflowBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty<Color>.fromMap(
                    <WidgetStatesConstraint, Color>{
                      WidgetState.focused: Color.fromARGB(255, 238, 207, 124),
                      WidgetState.pressed | WidgetState.hovered: Color.fromARGB(
                        255,
                        238,
                        207,
                        124,
                      ),
                      WidgetState.any: Color.fromARGB(255, 235, 220, 178),
                    },
                  ),
                ),
                child: Icon(
                  Icons.remove_red_eye,
                  color: Color.fromARGB(255, 102, 46, 28),
                ),
                onPressed: () {},
              ),
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty<Color>.fromMap(
                    <WidgetStatesConstraint, Color>{
                      WidgetState.focused: Color.fromARGB(255, 238, 207, 124),
                      WidgetState.pressed | WidgetState.hovered: Color.fromARGB(
                        255,
                        238,
                        207,
                        124,
                      ),
                      WidgetState.any: Color.fromARGB(255, 235, 220, 178),
                    },
                  ),
                ),
                child: Icon(
                  Icons.list_alt_rounded,
                  color: Color.fromARGB(255, 102, 46, 28),
                ),
                onPressed: () {},
              ),
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty<Color>.fromMap(
                    <WidgetStatesConstraint, Color>{
                      WidgetState.focused: Color.fromARGB(255, 238, 207, 124),
                      WidgetState.pressed | WidgetState.hovered: Color.fromARGB(
                        255,
                        238,
                        207,
                        124,
                      ),
                      WidgetState.any: Color.fromARGB(255, 235, 220, 178),
                    },
                  ),
                ),
                child: Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 102, 46, 28),
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),

          Text(
            movie.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 235, 220, 178),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            '${movie.year ?? '—'} |  ${movie.rating ?? '—'}',
            style: const TextStyle(color: Color.fromARGB(255, 235, 220, 178)),
          ),

          const SizedBox(height: 16),

          if (movie.genres != null)
            Text(
              'Жанры: ${movie.genres}',
              style: const TextStyle(color: Color.fromARGB(255, 235, 220, 178)),
            ),

          const SizedBox(height: 16),
          Text(
            ' Длительность: ${movie.length ?? 'Длительность отсутствует'} минут',
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 235, 220, 178),
            ),
          ),
          const SizedBox(height: 16),

          Text(
            movie.description ?? 'Описание отсутствует',
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 235, 220, 178),
            ),
          ),
        ],
      ),
    );
  }
}
