import 'package:cinema2/data_film.dart';
import 'package:cinema2/inherited.dart';
import 'package:flutter/material.dart';

class TitleSelectedFilm extends StatelessWidget {
  const TitleSelectedFilm({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    //Через провайдер получаем индекс текущего фильма
    //При изменении индекса виджет переписывается
    final index = Inherited.watch(context)?.indexFilm ?? 0;
    //По индексу берем нужный фильм из массива
    final Map infoFilm = DataFilm.dataFilm[index];

    return Column(
      crossAxisAlignment: deviceWidth < 600
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          infoFilm['title'],
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'Roboto-Regular'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
              mainAxisAlignment: deviceWidth < 600
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Text(infoFilm['runningTime'],
                    style: const TextStyle(
                        color: Color.fromARGB(75, 255, 255, 255),
                        fontSize: 10,
                        fontFamily: 'Roboto-Regular')),
                const SizedBox(width: 5),
                Container(
                    width: 1,
                    height: 10,
                    color: const Color.fromARGB(75, 255, 255, 255)),
                const SizedBox(width: 5),
                Text('Age: ${infoFilm['ageLimit']}',
                    style: const TextStyle(
                        color: Color.fromARGB(75, 255, 255, 255),
                        fontSize: 10,
                        fontFamily: 'Roboto-Regular')),
              ]),
        ),
      ],
    );
  }
}
