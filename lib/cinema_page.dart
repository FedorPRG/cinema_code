import 'package:cinema2/header_cinema_page.dart';
import 'package:cinema2/info_film.dart';
import 'package:cinema2/list_of_films.dart';
import 'package:cinema2/title_selected_film.dart';
import 'package:flutter/material.dart';

class CinemaPage extends StatefulWidget {
  const CinemaPage({Key? key}) : super(key: key);

  @override
  State<CinemaPage> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const HeaderCinemaPage(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: 1200,
                color: const Color.fromARGB(255, 6, 13, 31),
                child: Column(
                  crossAxisAlignment: deviceWidth < 600
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    ListOfFilms(),
                    const TitleSelectedFilm(),
                    const InfoFilm(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
