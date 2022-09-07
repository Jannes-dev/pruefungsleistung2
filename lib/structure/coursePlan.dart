import 'course.dart';
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
    addCourseToCoursePlan(Weekday.monday, TimeSlot.earlyAfternoon,
        Course('Yoga', 'Frau Hampeline', 45, [Goal.relax, Goal.stretch]));
    addCourseToCoursePlan(Weekday.monday, TimeSlot.lateAfternoon,
        Course('Zumba', 'Frau Hampeline', 45, [Goal.fun, Goal.stamina]));
    addCourseToCoursePlan(Weekday.thursday, TimeSlot.lateAfternoon,
        Course('Yoga', 'Frau Müller', 45, [Goal.relax, Goal.stretch]));
  }

  void addCourseToCoursePlan(
      Weekday weekday, TimeSlot timeSlot, Course course) {
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
