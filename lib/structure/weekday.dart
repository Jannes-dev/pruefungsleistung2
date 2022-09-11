import 'package:get/get.dart';

enum Weekday {
  monday, tuesday, wednesday, thursday, friday, saturday, sunday;
}

extension WeekdayExtension on Weekday {
  String get value {
    switch (this) {
      case Weekday.monday:
        return "Monday".tr;
      case Weekday.tuesday:
        return "Tuesday".tr;
      case Weekday.wednesday:
        return "Wednesday".tr;
      case Weekday.thursday:
        return "Thursday".tr;
      case Weekday.friday:
        return "Friday".tr;
      default:
        return "";
    }
  }
}