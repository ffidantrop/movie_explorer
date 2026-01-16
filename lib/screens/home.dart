import 'package:flutter/material.dart';
import 'package:movie_explorer/screens/notes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.coffee_outlined, size: 36.0,),
        actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => NotesScreen())
                );
              },
            )
          ],
        )
    );
  }
}
