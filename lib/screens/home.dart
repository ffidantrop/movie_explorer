import 'package:flutter/material.dart';
import 'package:movie_explorer/constaints.dart';
import 'package:movie_explorer/screens/notes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 102, 46, 28),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 175, 68, 37),
        leading: Icon(
          Icons.coffee_outlined,
          size: 36.0,
          color: Color.fromARGB(255, 235, 220, 178),
        ),
        title: TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.0,
                color: Color.fromARGB(255, 235, 220, 178),
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Icon(
              Icons.search,
              color: Color.fromARGB(255, 175, 68, 37),
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 235, 220, 178),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 0.0,
                color: Color.fromARGB(255, 235, 220, 178),
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            labelText: 'Поиск...',
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
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Center(
              child: Image(
                image: NetworkImage(
                  'http://images-s.kinorium.com/movie/poster/139702/w1500_52153708.jpg',
                ),
                width: 256,
                height: 256,
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton( child: Icon(Icons.remove_red_eye), onPressed: () {}),
              OutlinedButton(child: Icon(Icons.list_alt_rounded), onPressed: () {}),
              OutlinedButton(child: Icon(Icons.favorite), onPressed: () {}),
            ],
          ),
          Center(
            child: Column(
              children: [
                Text('Название фильма: Малхолланд Драйв',style: myListViewTextStyle,),
                Text('Рейтинг: IMDB 8.5',style: myListViewTextStyle,),
                Text('Актеры: Наоми Уоттс, Лаура Хэрринг',style: myListViewTextStyle,),
                Text('Режиссер: Дэвид Линч',style: myListViewTextStyle,),
                Text('Жанр: триллер, драма, детектив',style: myListViewTextStyle,),
                Text('Длительность: 2ч 27 мин',style: myListViewTextStyle,),
                Text('Год: 2001',style: myListViewTextStyle,),
                Text('Кассовые сборы: \$20117339',style: myListViewTextStyle,)
              ],
            )),
        ],),
    );
  }
}
