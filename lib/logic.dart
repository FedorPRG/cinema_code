import 'package:cinema2/current_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IndexFilm extends ChangeNotifier {
  //Объект с логикой
  bool isCheckedMain = false;
  bool buttonAddToCart = false;
  int? indexFilm;
  int? sitrow;
  int? sitnum;
  String? titleFilm;
  String? timeOfFilm;
  String? month;
  String? day;
  String? selectedData = currentDay;
  var listTicketsInCart = <Map>[];
  var listSelectedSeats = <Map>[];
  var listTicketsFromBuy = <Map>[];
  var currentTicket = <String, dynamic>{};

  void buyTickets() {
    listTicketsFromBuy = [];
    for (var ticket in listTicketsInCart) {
      if (ticket['select']) {
        listTicketsFromBuy.add(ticket);
      }
    }
  }

  void deleteTickets() {
    listTicketsInCart.removeWhere((ticket) => ticket['select']);
    isCheckedMain = false;
    notifyListeners();
  }

  void selectTicket(value, indexTicked) {
    listTicketsInCart[indexTicked]['select'] = value;
    notifyListeners();
  }

  void selectAllTicket(value) {
    for (var ticket in listTicketsInCart) {
      ticket['select'] = value;
    }
    isCheckedMain = value;
    notifyListeners();
  }

  void selectFilmForTicket(titleFilm) {
    this.titleFilm = titleFilm;
    currentTicket['title'] = titleFilm;
    notifyListeners();
  }

  void selectDataForTicket(String dataFilm) {
    final data = dataFilm.split(' ');
    month = data[0];
    day = data[1];
    currentTicket['month'] = data[0];
    currentTicket['day'] = data[1];
    notifyListeners();
  }

  void selectTimeForTicket(String timeOfFilm) {
    this.timeOfFilm = timeOfFilm;
    currentTicket['time'] = timeOfFilm;
    notifyListeners();
  }

  void selectingSeat(numberOfSeat) {
    //Ищем ряд
    if (numberOfSeat % 10 == 0) {
      sitrow = numberOfSeat ~/ 10;
    } else {
      sitrow = numberOfSeat ~/ 10 + 1;
    }
    currentTicket['sitrow'] = '$sitrow';

    if (numberOfSeat % 10 != 0) {
      sitnum = numberOfSeat % 10;
    } else {
      sitnum = 10;
    }
    currentTicket['sitnum'] = '$sitnum';
    //Если список выбранных мест пуст, то сразу добавляем выбранное место в список
    if (listSelectedSeats.isEmpty) {
      listSelectedSeats.add({
        'title': currentTicket['title'],
        'month': currentTicket['month'],
        'day': currentTicket['day'],
        'time': currentTicket['time'],
        'sitrow': currentTicket['sitrow'],
        'sitnum': currentTicket['sitnum'],
      });
    } else {
      //Проверяем на предмет повторного клика
      bool seatRemoveSecondClick = false;
      for (var i = 0; i < listSelectedSeats.length; i++) {
        if (listSelectedSeats[i]['title'] == currentTicket['title'] &&
            listSelectedSeats[i]['month'] == currentTicket['month'] &&
            listSelectedSeats[i]['day'] == currentTicket['day'] &&
            listSelectedSeats[i]['time'] == currentTicket['time'] &&
            listSelectedSeats[i]['sitrow'] == currentTicket['sitrow'] &&
            listSelectedSeats[i]['sitnum'] == currentTicket['sitnum']) {
          //Если это место уже есть в списке выбранных мест, то удаляем его
          seatRemoveSecondClick = true;
          listSelectedSeats.removeWhere((seat) =>
              seat['title'] == currentTicket['title'] &&
              seat['month'] == currentTicket['month'] &&
              seat['day'] == currentTicket['day'] &&
              seat['time'] == currentTicket['time'] &&
              seat['sitrow'] == currentTicket['sitrow'] &&
              seat['sitnum'] == currentTicket['sitnum']);
        }
      }
      //Если это не повторный клик, то добавляем место в список
      if (!seatRemoveSecondClick) {
        listSelectedSeats.add({
          'title': currentTicket['title'],
          'month': currentTicket['month'],
          'day': currentTicket['day'],
          'time': currentTicket['time'],
          'sitrow': currentTicket['sitrow'],
          'sitnum': currentTicket['sitnum'],
        });
      }
    }
    notifyListeners();
  }

  void clearSelectedSeat() {
    //Удаляем все места в списке выбранных мест, которые соответствуют экрану
    listSelectedSeats.removeWhere((ticket) =>
        ticket['title'] == currentTicket['title'] &&
        ticket['month'] == currentTicket['month'] &&
        ticket['day'] == currentTicket['day'] &&
        ticket['time'] == currentTicket['time']);
    buttonAddToCart = false;
    notifyListeners();
  }

  void addSeatsInCart() {
    //Добавление выбранные мест, которые соответствуют текущему экрану в корзину
    for (var i = 0; i < listSelectedSeats.length; i++) {
      if (listSelectedSeats[i]['title'] == currentTicket['title'] &&
          listSelectedSeats[i]['month'] == currentTicket['month'] &&
          listSelectedSeats[i]['day'] == currentTicket['day'] &&
          listSelectedSeats[i]['time'] == currentTicket['time']) {
        listTicketsInCart.add({
          'title': currentTicket['title'],
          'month': currentTicket['month'],
          'day': currentTicket['day'],
          'time': currentTicket['time'],
          'sitrow': listSelectedSeats[i]['sitrow'],
          'sitnum': listSelectedSeats[i]['sitnum'],
          'cost': '5\$',
          'select': false
        });
      }
    }
    //Удаление добавленых в корзину мест из списка выбранных мест
    for (var i = 0; i < listTicketsInCart.length; i++) {
      listSelectedSeats.removeWhere((seat) =>
          seat['title'] == listTicketsInCart[i]['title'] &&
          seat['month'] == listTicketsInCart[i]['month'] &&
          seat['day'] == listTicketsInCart[i]['day'] &&
          seat['time'] == listTicketsInCart[i]['time'] &&
          seat['sitrow'] == listTicketsInCart[i]['sitrow'] &&
          seat['sitnum'] == listTicketsInCart[i]['sitnum']);
    }
    notifyListeners();
  }

  void selestData(data) {
    selectedData = data;
    notifyListeners();
  }

  void changFilm(index) {
    if (indexFilm != index) {
      indexFilm = index;
      notifyListeners();
    }
  }

  void forButtonAddToCart() {
    //По умолчанию кнопка не активна
    buttonAddToCart = false;
    for (var i = 0; i < listSelectedSeats.length; i++) {
      //Если в списке выбранных мест есть места соответствующие экрану,
      //то кнопка активна
      if (listSelectedSeats[i]['title'] == currentTicket['title'] &&
          listSelectedSeats[i]['month'] == currentTicket['month'] &&
          listSelectedSeats[i]['day'] == currentTicket['day'] &&
          listSelectedSeats[i]['time'] == currentTicket['time']) {
        buttonAddToCart = true;
      }
    }
    notifyListeners();
  }
}
