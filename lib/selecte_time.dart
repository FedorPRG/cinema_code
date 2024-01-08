import 'package:cinema2/cinema_hall.dart';
import 'package:cinema2/data_film.dart';
import 'package:cinema2/inherited.dart';
import 'package:flutter/material.dart';

class SelecteTime extends StatelessWidget {
  final String selectedData;
  final String timeOfFilm;
  const SelecteTime({
    super.key,
    required this.timeOfFilm,
    required this.selectedData,
  });

  @override
  Widget build(BuildContext context) {
    final index = Inherited.watch(context)?.indexFilm ?? 0;
    final Map infoFilm = DataFilm.dataFilm[index];
    return InkWell(
      onTap: () {
        //Записали выбранные дату и время
        Inherited.read(context)?.selectDataForTicket(selectedData);
        Inherited.read(context)?.selectTimeForTicket(timeOfFilm);
        //Для определения активности или не активности кнопки ADD TO CART
        Inherited.watch(context)?.forButtonAddToCart();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CinemaHall(
                titleFilm: '${infoFilm['title']}',
                ageLimit: '${infoFilm['ageLimit']}',
              );
            });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.orange),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          timeOfFilm,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
