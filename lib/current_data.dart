String IntToString(mont) {
  switch (mont) {
    case 01:
      return 'January';
    case 02:
      return 'February';
    case 03:
      return 'March';
    case 04:
      return 'April';
    case 05:
      return 'May';
    case 06:
      return 'June';
    case 07:
      return 'July';
    case 08:
      return 'August';
    case 09:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
  }
  return 'Месяц не определен';
}

final data = DateTime.now();

final String currentDay = '${IntToString(data.month)} ${data.day}';
final String tomorrowDay =
    '${IntToString(data.add(Duration(days: 1)).month)} ${data.add(Duration(days: 1)).day}';
final String dayAfterTomorrowDay =
    '${IntToString(data.add(Duration(days: 2)).month)} ${data.add(Duration(days: 2)).day}';
