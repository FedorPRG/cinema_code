import 'package:flutter/material.dart';

class HeaderTicketFromBuy extends StatelessWidget {
  const HeaderTicketFromBuy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      ],
    );
  }
}
