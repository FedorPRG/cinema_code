import 'package:cinema2/inherited.dart';
import 'package:flutter/material.dart';

//Шаблон для вывода билета на экран
class OneTicket extends StatelessWidget {
  final int indexTicket;
  const OneTicket({
    super.key,
    required this.ticketFilm,
    required this.indexTicket,
  });

  final Map ticketFilm;

  @override
  Widget build(BuildContext context) {
    //Для отображения значения Checkbox
    bool isChecked = Inherited.watch(context)?.listTicketsInCart[indexTicket]
            ['select'] ??
        false;

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
        Container(
          alignment: Alignment.center,
          width: 72,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1)),
          child: Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                //Через провайдер отмечаем билет
                Inherited.read(context)?.selectTicket(value, indexTicket);
              }),
        ),
      ],
    );
  }
}
