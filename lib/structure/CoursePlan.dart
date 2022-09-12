import 'Course.dart';
import 'goal.dart';
import 'weekday.dart';
import 'TimeSlot.dart';

class CoursePlan {
  late int _weekNumber;

  Map<Weekday, Map<TimeSlot, Course>> _coursePlan = {
    Weekday.monday: {
      TimeSlot.midday: Course.courseForWeekdays(),
      TimeSlot.earlyAfternoon: Course.courseForWeekdays(),
      TimeSlot.lateAfternoon: Course.courseForWeekdays()
    },
    Weekday.tuesday: {
      TimeSlot.midday: Course.courseForWeekdays(),
      TimeSlot.earlyAfternoon: Course.courseForWeekdays(),
      TimeSlot.lateAfternoon: Course.courseForWeekdays()
    },
    Weekday.wednesday: {
      TimeSlot.midday: Course.courseForWeekdays(),
      TimeSlot.earlyAfternoon: Course.courseForWeekdays(),
      TimeSlot.lateAfternoon: Course.courseForWeekdays()
    },
    Weekday.thursday: {
      TimeSlot.midday: Course.courseForWeekdays(),
      TimeSlot.earlyAfternoon: Course.courseForWeekdays(),
      TimeSlot.lateAfternoon: Course.courseForWeekdays()
    },
    Weekday.friday: {
      TimeSlot.midday: Course.courseForWeekdays(),
      TimeSlot.earlyAfternoon: Course.courseForWeekdays(),
      TimeSlot.lateAfternoon: Course.courseForWeekdays()
    },
  };

  CoursePlan(int weekNumber) {
    _weekNumber = weekNumber;
  }

  void setWeekNumber(int value) {
    _weekNumber = value;
  }

  void addCourseToCoursePlan(Weekday weekday, TimeSlot timeSlot, Course course) {
    Map<TimeSlot, Course>? newCourse = {};
    if (_coursePlan.containsKey(weekday)) {
      newCourse = _coursePlan[weekday];
    }
    newCourse![timeSlot] = course;
    _coursePlan[weekday] = newCourse;
  }

  int getWeekNumber() {
    return _weekNumber;
  }

  Map getCoursePlan() {
    return _coursePlan;
  }
}
