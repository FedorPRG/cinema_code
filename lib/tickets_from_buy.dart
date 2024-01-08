import 'package:cinema2/header_ticket_from_buy.dart';
import 'package:cinema2/inherited.dart';
import 'package:cinema2/one_ticket_from_buy.dart';
import 'package:flutter/material.dart';

class TicketsFromBuy extends StatelessWidget {
  const TicketsFromBuy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isButtonActiv = false;
    //Пустой массив виджетов билетов
    final List<Widget> listTicket;
    //Через провайдер получаем список выбранных билетов к покупке
    final listTicketsFromBuy =
        Inherited.watch(context)?.listTicketsFromBuy ?? [];
    if (listTicketsFromBuy.isNotEmpty) {
      //Заполняем массив виджетов
      //Передаем в шаблон билет для заполнения
      listTicket = listTicketsFromBuy
          .map((Map ticket) => OneTicketFromBuy(ticketFilm: ticket))
          .toList();
      isButtonActiv = true;
    } else {
      listTicket = [
        const Text('Нет билетов к покупке',
            style: TextStyle(color: Colors.white))
      ];
    }

    return Center(
      child: SizedBox(
        width: 680,
        child: SimpleDialog(
          shape: const BeveledRectangleBorder(side: BorderSide.none),
          backgroundColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(0),
          children: [
            const HeaderTicketFromBuy(),
            Column(
              children: listTicket,
            ),
            Align(
              child: ElevatedButton(
                  onPressed: isButtonActiv ? () {} : null,
                  child: const Text('К оформлению')),
            ),
            Center(
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('CLOSE',
                      style: TextStyle(
                          color: Color.fromARGB(255, 117, 6, 207),
                          fontSize: 16))),
            ),
          ],
        ),
      ),
    );
  }
}
