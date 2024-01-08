import 'package:flutter/material.dart';

//Шаблон для вывода билета на экран
class OneTicketFromBuy extends StatelessWidget {
  const OneTicketFromBuy({
    super.key,
    required this.ticketFilm,
  });

  final Map ticketFilm;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            width: 200,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1)),
            child: Text(
              ticketFilm['title'],
              style: const TextStyle(color: Colors.black),
            )),
        Container(
            padding: const EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            width: 200,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1)),
            child: Text(
              '${ticketFilm['month']} ${ticketFilm['day']} (${ticketFilm['time']})',
              style: const TextStyle(color: Colors.black),
            )),
        Container(
            padding: const EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1)),
            child: Text(
              '${ticketFilm['sitrow']} row ${ticketFilm['sitnum']} sit',
              style: const TextStyle(color: Colors.black),
            )),
        Container(
            padding: const EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1)),
            child: Text(
              ticketFilm['cost'],
              style: const TextStyle(color: Colors.black),
            )),
      ],
    );
  }
}
