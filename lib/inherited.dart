import 'package:cinema2/logic.dart';
import 'package:flutter/material.dart';

class Inherited extends InheritedNotifier<IndexFilm> {
  //Провайдер между логикой и виджетами
  final IndexFilm indexFilm;
  //Вызываеи обновления в виджетах подписчиках, когда в indexFilm вызывается notifyListeners()
  const Inherited({
    Key? key,
    required this.indexFilm,
    required Widget child,
  }) : super(key: key, notifier: indexFilm, child: child);

  static IndexFilm? watch(BuildContext context) {
    //Подписка на переписывание виджета при изменениях в логики
    return context.dependOnInheritedWidgetOfExactType<Inherited>()?.indexFilm;
  }

  static IndexFilm? read(BuildContext context) {
    //Подписка, если не надо переписывать виджет при изменениях в логики
    final widget =
        context.getElementForInheritedWidgetOfExactType<Inherited>()?.widget;
    return widget is Inherited ? widget.notifier : null;
  }

  //   static IndexFilm? of(BuildContext context) {
  //   return context
  //       .dependOnInheritedWidgetOfExactType<DataInherited>()
  //       ?.indexFilm;
  // }
}
