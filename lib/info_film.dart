import 'package:cinema2/data_film.dart';
import 'package:cinema2/inherited.dart';
import 'package:cinema2/selecte_data_time.dart';
import 'package:flutter/material.dart';

class InfoFilm extends StatefulWidget {
  const InfoFilm({
    super.key,
  });

  @override
  State<InfoFilm> createState() => _InfoFilmState();
}

class _InfoFilmState extends State<InfoFilm> {
  /*Stateful сделан для того, чтобы разделить скролы.
  Если этого не сделать, то оба скрола будут 
  перемещать один список*/
  final ScrollController _firstController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    const double heightImg = 450;
    //Через провайдер получаем индекс текущего фильма
    //При изменении индекса виджет переписывается
    final index = Inherited.watch(context)?.indexFilm ?? 0;
    final Map infoFilm = DataFilm.dataFilm[index];
    const textStyleOrange =
        TextStyle(color: Colors.orange, fontFamily: 'Roboto-Regular');
    const textStyleWhite =
        TextStyle(color: Colors.white, fontFamily: 'Roboto-Regular');

    return Container(
      decoration: const BoxDecoration(
          color: Color(0xff171d31),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: deviceWidth < 600 ? 350 : 1000,
      height: deviceWidth < 600 ? 975 : heightImg,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RawScrollbar(
          thumbVisibility: true,
          thumbColor: Colors.orange,
          controller: _firstController,
          radius: const Radius.circular(20),
          thickness: 10,
          child: deviceWidth < 600
              ? ListView(
                  controller: _firstController,
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      children: [
                        Image(
                          width: heightImg * .675,
                          image: AssetImage(infoFilm['src']),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                        const SizedBox(width: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 300,
                              child: Text(
                                infoFilm['description'],
                                textAlign: TextAlign.justify,
                                style: textStyleWhite,
                                softWrap: true,
                                maxLines: 23,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                                style: const ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.all(0)),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.orange)),
                                onPressed: () {
                                  Inherited.read(context)
                                      ?.selectFilmForTicket(infoFilm['title']);
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SelecteDataTime(
                                          titleFilm: '${infoFilm['title']}',
                                          ageLimit: '${infoFilm['ageLimit']}',
                                        );
                                      });
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 300,
                                    child: const Text(
                                      'BUY TICKETS',
                                      style: TextStyle(
                                          fontFamily: 'Roboto-Regular'),
                                    )))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Running time', style: textStyleOrange),
                                  const SizedBox(height: 10),
                                  Text('Release date', style: textStyleOrange),
                                  const SizedBox(height: 10),
                                  Text('Genre', style: textStyleOrange)
                                ]),
                            const SizedBox(width: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(infoFilm['runningTime'],
                                    style: textStyleWhite),
                                const SizedBox(height: 10),
                                Text(infoFilm['releaseDate'],
                                    style: textStyleWhite),
                                const SizedBox(height: 10),
                                Text(infoFilm['genre'], style: textStyleWhite)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                )
              : ListView(
                  controller: _firstController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        Image(
                          width: heightImg * .675,
                          image: AssetImage(infoFilm['src']),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                        const SizedBox(width: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Text(
                                infoFilm['description'],
                                textAlign: TextAlign.justify,
                                style: textStyleWhite,
                                softWrap: true,
                                maxLines: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            ElevatedButton(
                                style: const ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.all(0)),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.orange)),
                                onPressed: () {
                                  Inherited.read(context)
                                      ?.selectFilmForTicket(infoFilm['title']);
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SelecteDataTime(
                                          titleFilm: '${infoFilm['title']}',
                                          ageLimit: '${infoFilm['ageLimit']}',
                                        );
                                      });
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 300,
                                    child: const Text('BUY TICKETS')))
                          ],
                        ),
                        const SizedBox(width: 50),
                        const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Running time', style: textStyleOrange),
                              Text('Release date', style: textStyleOrange),
                              Text('Genre', style: textStyleOrange)
                            ]),
                        const SizedBox(width: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(infoFilm['runningTime'],
                                style: textStyleWhite),
                            Text(infoFilm['releaseDate'],
                                style: textStyleWhite),
                            Text(infoFilm['genre'], style: textStyleWhite)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
