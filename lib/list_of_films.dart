import 'package:cinema2/data_film.dart';
import 'package:cinema2/one_film.dart';
import 'package:flutter/material.dart';

class ListOfFilms extends StatelessWidget {
  //Виджет отображения списка фильмов
  //Получаем массив с фильмами
  final dataFilm = DataFilm.dataFilm;
  ListOfFilms({super.key});

  @override
  Widget build(BuildContext context) {
    /*Создаем массив виджетов. Пробегаемся по массиву с фильмами методом map
     и на каждый фильм в массиве создаем виджет OneFilm*/
    final List<Widget> listFilm = dataFilm
        .map((Map movie) => OneFilm(src: movie['src'], index: movie['id']))
        .toList();
    return SizedBox(
      height: 150,
      child:
          // для изменения цвета скрола
          RawScrollbar(
        thumbColor: Colors.orange,
        radius: const Radius.circular(20),
        //для изменения размера скрола
        thickness: 10,
        //для постоянной видимости скрола
        thumbVisibility: true,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          primary: true,
          itemCount: listFilm.length,
          itemBuilder: (BuildContext context, int index) {
            return listFilm[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 10,
            );
          },
        ),
      ),
    );
  }
}
