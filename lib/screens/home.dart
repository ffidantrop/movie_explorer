import 'package:flutter/material.dart';
import 'package:movie_explorer/screens/notes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 102, 46, 28),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 175, 68, 37),
        leading: Icon(Icons.coffee_outlined, size: 36.0, color: Color.fromARGB(255, 235, 220, 178)),
        title: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.0, color: Color.fromARGB(255, 235, 220, 178)), 
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 175, 68, 37)),
              filled: true,
              fillColor: Color.fromARGB(255, 235, 220, 178),
              border: UnderlineInputBorder(
                borderSide: BorderSide(width: 0.0, color: Color.fromARGB(255, 235, 220, 178)), 
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ), 
              labelText: 'Поиск...'),
            ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            color: Color.fromARGB(255, 235, 220, 178),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotesScreen()));
            },
          )
          ],
        ),
        body: Center(
          child: Text('Пока что ничего'),
        ),
    );
  }
}
