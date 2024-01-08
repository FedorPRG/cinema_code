import 'package:cinema2/current_data.dart';
import 'package:cinema2/inherited.dart';
import 'package:cinema2/selecte_time.dart';
import 'package:flutter/material.dart';

class SelecteDataTime extends StatelessWidget {
  final String titleFilm;
  final String ageLimit;
  const SelecteDataTime(
      {super.key, required this.titleFilm, required this.ageLimit});

  @override
  Widget build(BuildContext context) {
    //Через провайдер получаем выбранную дату, по умолчанию равна текущей
    final String selectedData =
        Inherited.watch(context)?.selectedData ?? currentDay;
    const textStyleTitle = TextStyle(
        color: Colors.orange, fontSize: 20, fontFamily: 'Roboto-Regular');
    const textStyleData =
        TextStyle(color: Colors.white, fontFamily: 'Roboto-Regular');

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
          width: 550,
          height: 270,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      InkWell(
                        onTap: () {
                          //Меняем выбранную дату
                          Inherited.read(context)?.selestData(currentDay);
                        },
                        child: Text(currentDay, style: textStyleData),
                      ),
                      const SizedBox(height: 10),
                      Container(
                          width: 120,
                          height: 2,
                          color: selectedData == currentDay
                              ? Colors.white
                              : const Color(0xff171d31))
                    ]),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            //Меняем выбранную дату
                            Inherited.read(context)?.selestData(tomorrowDay);
                          },
                          child: Text(tomorrowDay, style: textStyleData),
                        ),
                        const SizedBox(height: 10),
                        Container(
                            width: 120,
                            height: 2,
                            color: selectedData == tomorrowDay
                                ? Colors.white
                                : const Color(0xff171d31))
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            //Меняем выбранную дату
                            Inherited.read(context)
                                ?.selestData(dayAfterTomorrowDay);
                          },
                          child:
                              Text(dayAfterTomorrowDay, style: textStyleData),
                        ),
                        const SizedBox(height: 10),
                        Container(
                            width: 120,
                            height: 2,
                            color: selectedData == dayAfterTomorrowDay
                                ? Colors.white
                                : const Color(0xff171d31))
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SelecteTime(
                        timeOfFilm: '11:00', selectedData: selectedData),
                    SelecteTime(
                        timeOfFilm: '14:30', selectedData: selectedData),
                    SelecteTime(
                        timeOfFilm: '17:00', selectedData: selectedData),
                    SelecteTime(timeOfFilm: '22:30', selectedData: selectedData)
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('CLOSE',
                            style: TextStyle(
                                color: Color.fromARGB(255, 117, 6, 207),
                                fontSize: 20))),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
