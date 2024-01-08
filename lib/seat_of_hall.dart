import 'package:cinema2/inherited.dart';
import 'package:flutter/material.dart';

class SeatOfHall extends StatelessWidget {
//Виджет-шаблон для кресла
  final int numberOfSeat;
  const SeatOfHall({Key? key, required this.numberOfSeat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Стиль отображения для не выбранного кресла
    const notSelectedSeats =
        BoxDecoration(shape: BoxShape.circle, color: Colors.blue);
    //Стиль отображения для выбранного кресла
    final selectedSeat = BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1.5, color: Colors.white),
        color: Colors.orange);
    //Стиль отображения для кресла в корзине
    final seatInCart = BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 5, color: const Color(0xff171d31)),
        // borderRadius: BorderRadius.circular(10),
        color: Colors.teal);
    //Через провайдер получаем список выбранных кресел
    final listSelectedSeats = Inherited.watch(context)?.listSelectedSeats ?? [];
    //Через провайдер получаем список кресел в корзине
    final listTickets = Inherited.watch(context)?.listTicketsInCart ?? [];
    //Определяем информацию о текущем фильме для поиска кресла в списках выбранных и корзине
    final titleFilm = Inherited.watch(context)?.titleFilm ?? '';
    final month = Inherited.watch(context)?.month ?? '';
    final day = Inherited.watch(context)?.day ?? '';
    final timeOfFilm = Inherited.watch(context)?.timeOfFilm ?? '';
    //Определяем ряд и номер кресла для поиска его в списках выбранных и корзине
    int sitrow;
    int sitnum;
    if (numberOfSeat % 10 == 0) {
      sitrow = numberOfSeat ~/ 10;
    } else {
      sitrow = numberOfSeat ~/ 10 + 1;
    }
    if (numberOfSeat % 10 != 0) {
      sitnum = numberOfSeat % 10;
    } else {
      sitnum = 10;
    }
    //По умолчанию кресло не выбрано и не в корзине
    BoxDecoration displaySeats = notSelectedSeats;
    //По умолчанию клик по креслу активен
    bool isButtonActiv = true;

    //Если все данные текущего фильма и кресло есть в списках выбранных,
    // то стиль - в выбранные
    for (var seat in listSelectedSeats) {
      if (seat['title'] == titleFilm &&
          seat['month'] == month &&
          seat['day'] == day &&
          seat['time'] == timeOfFilm &&
          seat['sitrow'] == '$sitrow' &&
          seat['sitnum'] == '$sitnum') {
        displaySeats = selectedSeat;
      }
    }
    //Если все данные текущего фильма и кресло есть в корзине, то стиль - в корзине
    for (var ticket in listTickets) {
      if (ticket['title'] == titleFilm &&
          ticket['month'] == month &&
          ticket['day'] == day &&
          ticket['time'] == timeOfFilm &&
          ticket['sitrow'] == '$sitrow' &&
          ticket['sitnum'] == '$sitnum') {
        displaySeats = seatInCart;
        //Клик по креслу не активен
        isButtonActiv = false;
      }
    }

    return Container(
      decoration: displaySeats,
      child: TextButton(
          onPressed: isButtonActiv
              ? () {
                  //По клику на кpесло через провайдер добавляем выбранные места
                  Inherited.read(context)?.selectingSeat(numberOfSeat);
                  //Для определения активности или не активности кнопки ADD TO CART
                  Inherited.read(context)?.forButtonAddToCart();
                }
              : null,
          child: const Text('')),
    );
  }
}
