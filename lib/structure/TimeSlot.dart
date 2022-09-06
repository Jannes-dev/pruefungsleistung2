enum TimeSlot {
  midday,
  earlyAfternoon,
  lateAfternoon;
}

extension TimeSlotExtension on TimeSlot {
  String get value {
    switch (this) {
      case TimeSlot.midday:
        return 'midday';
      case TimeSlot.earlyAfternoon:
        return 'early afternoon';
      case TimeSlot.lateAfternoon:
        return 'late afternoon';
    }
  }
}
