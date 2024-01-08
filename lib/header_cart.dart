import 'package:cinema2/inherited.dart';
import 'package:flutter/material.dart';

class HeaderCart extends StatelessWidget {
  const HeaderCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isChecked = Inherited.watch(context)?.isCheckedMain ?? false;
    return Row(
      children: [
        Container(
            alignment: Alignment.center,
            width: 200,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.black, width: 1)),
            child: const Text('MOVIE', style: TextStyle(color: Colors.white))),
        Container(
            alignment: Alignment.center,
            width: 200,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.black, width: 1)),
            child: const Text('DATA', style: TextStyle(color: Colors.white))),
        Container(
            alignment: Alignment.center,
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.black, width: 1)),
            child: const Text('SIT', style: TextStyle(color: Colors.white))),
        Container(
            alignment: Alignment.center,
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.black, width: 1)),
            child: const Text('COST', style: TextStyle(color: Colors.white))),
        Container(
          alignment: Alignment.center,
          width: 72,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.orange,
              border: Border.all(color: Colors.black, width: 1)),
          child: Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                //Через провайдер отмечаем все билеты
                Inherited.read(context)?.selectAllTicket(value);
              }),
        ),
      ],
    );
  }
}
