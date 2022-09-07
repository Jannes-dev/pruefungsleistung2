enum TimeSlot {
  midday,
  earlyAfternoon,
  lateAfternoon;
}

extension TimeSlotExtension on TimeSlot {
  String get value {
    switch (this) {
      case TimeSlot.midday:
        return '12:00';
      case TimeSlot.earlyAfternoon:
        return '14:00';
      case TimeSlot.lateAfternoon:
        return '16:00';
    }
  }
}
