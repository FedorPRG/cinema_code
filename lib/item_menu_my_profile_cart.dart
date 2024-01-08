import 'package:cinema2/header_cart.dart';
import 'package:cinema2/inherited.dart';
import 'package:cinema2/one_ticket.dart';
import 'package:cinema2/tickets_from_buy.dart';
import 'package:flutter/material.dart';

class ItemMenuMyProfileCart extends StatelessWidget {
  const ItemMenuMyProfileCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //Пустой массив виджетов билетов
    final List<Widget> listTickets;
    //Через провайдер получаем список выбранных билетов
    final listTicketFilm = Inherited.watch(context)?.listTicketsInCart ?? [];
    if (listTicketFilm.isNotEmpty) {
      var indexTicked = -1;
      //Заполняем массив виджетов
      listTickets = listTicketFilm
          .map((Map ticket) => OneTicket(
              //Передаем в шаблон билет для заполнения
              ticketFilm: ticket,
              //Передаем индекс билета для отслеживания Checkbox
              indexTicket: indexTicked += 1))
          .toList();
    } else {
      listTickets = [
        const Text('Билеты не добавлены в корзину',
            style: TextStyle(color: Colors.white))
      ];
    }

    return SimpleDialog(
      titlePadding: const EdgeInsets.all(0),
      shape: const BeveledRectangleBorder(side: BorderSide.none),
      backgroundColor: const Color.fromARGB(255, 6, 13, 31),
      insetPadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(0),
      children: [
        const HeaderCart(),
        Column(children: listTickets),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  //Добавляем выбранные билеты к покупке
                  Inherited.watch(context)?.buyTickets();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const TicketsFromBuy();
                      });
                },
                child: const Text('BUY')),
            const SizedBox(width: 10),
            ElevatedButton(
                onPressed: () {
                  //Добавляем выбранные билеты к удалению
                  Inherited.watch(context)?.deleteTickets();
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                child: const Icon(Icons.delete)),
          ],
        )
      ],
    );
  }
}
