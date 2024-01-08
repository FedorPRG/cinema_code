import 'package:cinema2/inherited.dart';
import 'package:cinema2/seat_of_hall.dart';
import 'package:flutter/material.dart';

class CinemaHall extends StatelessWidget {
  final String titleFilm;
  final String ageLimit;
  const CinemaHall({Key? key, required this.titleFilm, required this.ageLimit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Для определения активности или не активности кнопки ADD TO CART
    bool isButtonActiv = Inherited.watch(context)?.buttonAddToCart ?? false;
    //Пустой массив виджетов кресел
    List<Widget> seatsOfHall = <Widget>[];
    for (int i = 1; i < 101; i++) {
      final widget = SeatOfHall(numberOfSeat: i);
      //Заполняем массив кресел
      seatsOfHall.add(widget);
    }
    const textStyleTitle = TextStyle(
        color: Colors.orange, fontSize: 16, fontFamily: 'Roboto-Regular');

    return SimpleDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: const Color(0xff171d31),
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.orange),
              borderRadius: BorderRadius.circular(10)),
          width: 280,
          height: 460,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(titleFilm, style: textStyleTitle),
                    const SizedBox(width: 6),
                    Container(width: 1, height: 20, color: Colors.orange),
                    const SizedBox(width: 6),
                    Text(ageLimit, style: textStyleTitle)
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 300,
                      child: ListView.separated(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            '${index + 1}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto-Regular'),
                            textAlign: TextAlign.right,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10.3,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 300,
                      child: GridView.count(
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 5,
                        crossAxisCount: 10,
                        children: seatsOfHall,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                      height: 300,
                      child: ListView.separated(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            '${index + 1}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto-Regular'),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10.3,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange)),
                    onPressed: isButtonActiv
                        ? () {
                            //через провайдер добавляем выбранные места в корзину
                            Inherited.read(context)?.addSeatsInCart();
                            //Для определения активности или не активности кнопки ADD TO CART
                            Inherited.read(context)?.forButtonAddToCart();
                          }
                        : null,
                    child: Container(
                        alignment: Alignment.center,
                        width: 160,
                        child: const Text(
                          'ADD TO CART',
                          style: TextStyle(fontFamily: 'Roboto-Regular'),
                        ))),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Inherited.read(context)?.clearSelectedSeat();
                        },
                        child: const Text('CLEAR',
                            style: TextStyle(
                                color: Color.fromARGB(255, 117, 6, 207),
                                fontSize: 16,
                                fontFamily: 'Roboto-Regular'))),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('CLOSE',
                            style: TextStyle(
                                color: Color.fromARGB(255, 117, 6, 207),
                                fontSize: 16,
                                fontFamily: 'Roboto-Regular'))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
