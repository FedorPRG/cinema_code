import 'package:cinema2/cinema_page.dart';
import 'package:cinema2/inherited.dart';
import 'package:cinema2/logic.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //создаем и храним ссылку на объект логики
  final _indexFilm = IndexFilm();

  @override
  Widget build(BuildContext context) {
    return
        //Inherited должен быть выше зависимых виджетов по дереву
        Inherited(
      indexFilm: _indexFilm,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,

        // theme: ThemeData.light().copyWith(
        //     scrollbarTheme: ScrollbarThemeData().copyWith(
        //   thumbColor:
        //       MaterialStateProperty.all(const Color.fromARGB(182, 255, 153, 0)),
        // )),
        home: CinemaPage(),
        // home: const Exaple(),
      ),
    );
  }
}
