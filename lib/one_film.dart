import 'package:cinema2/inherited.dart';
import 'package:flutter/material.dart';

class OneFilm extends StatelessWidget {
//Виджет-шаблон для списка фильмов
  final int index;
  final String src;
  const OneFilm({
    super.key,
    required this.src,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //По клику на фильм через провайдер меняем индекс для вывода инфо о фильме
        //При этом виджет не переписывается
        Inherited.read(context)?.changFilm(index);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image(image: AssetImage(src)),
          ),
        ),
      ),
    );
  }
}
