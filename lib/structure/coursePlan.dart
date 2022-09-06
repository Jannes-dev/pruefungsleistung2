import 'course.dart';
import 'goal.dart';
import 'weekday.dart';
import 'TimeSlot.dart';

class CoursePlan {
  late int _weekNumber;
  Map<Weekday, Map<TimeSlot, Course>> _coursePlan = {};

  CoursePlan(int weekNumber) {
    _weekNumber = weekNumber;
    addCourseToCoursePlan(
        Weekday.monday, TimeSlot.midday, Course.courseForWeekdays());
    addCourseToCoursePlan(Weekday.monday, TimeSlot.earlyAfternoon,
        Course('Yoga', 'Frau Hampeline', 45, [Goal.relax, Goal.stretch]));
    addCourseToCoursePlan(Weekday.monday, TimeSlot.lateAfternoon,
        Course('Yoga', 'Frau Hampeline', 45, [Goal.relax, Goal.stretch]));

    addCourseToCoursePlan(
        Weekday.tuesday, TimeSlot.midday, Course.courseForWeekdays());
    addCourseToCoursePlan(
        Weekday.tuesday, TimeSlot.earlyAfternoon, Course.courseForWeekdays());
    addCourseToCoursePlan(
        Weekday.tuesday, TimeSlot.lateAfternoon, Course.courseForWeekdays());

    addCourseToCoursePlan(
        Weekday.wednesday, TimeSlot.midday, Course.courseForWeekdays());
    addCourseToCoursePlan(
        Weekday.wednesday, TimeSlot.earlyAfternoon, Course.courseForWeekdays());
    addCourseToCoursePlan(
        Weekday.wednesday, TimeSlot.lateAfternoon, Course.courseForWeekdays());

    addCourseToCoursePlan(
        Weekday.thursday, TimeSlot.midday, Course.courseForWeekdays());
    addCourseToCoursePlan(
        Weekday.thursday, TimeSlot.earlyAfternoon, Course.courseForWeekdays());
    addCourseToCoursePlan(
        Weekday.thursday, TimeSlot.lateAfternoon, Course.courseForWeekdays());

    addCourseToCoursePlan(
        Weekday.friday, TimeSlot.midday, Course.courseForWeekdays());
    addCourseToCoursePlan(
        Weekday.friday, TimeSlot.earlyAfternoon, Course.courseForWeekdays());
    addCourseToCoursePlan(
        Weekday.friday, TimeSlot.lateAfternoon, Course.courseForWeekdays());

    addCourseToCoursePlan(
        Weekday.saturday, TimeSlot.midday, Course.courseForWeekdays());
    addCourseToCoursePlan(
        Weekday.saturday, TimeSlot.earlyAfternoon, Course.courseForWeekdays());
    addCourseToCoursePlan(
        Weekday.saturday, TimeSlot.lateAfternoon, Course.courseForWeekdays());

    addCourseToCoursePlan(
        Weekday.sunday, TimeSlot.midday, Course.courseForWeekdays());
    addCourseToCoursePlan(
        Weekday.sunday, TimeSlot.earlyAfternoon, Course.courseForWeekdays());
    addCourseToCoursePlan(
        Weekday.sunday, TimeSlot.lateAfternoon, Course.courseForWeekdays());

    addCourseToCoursePlan(Weekday.thursday, TimeSlot.lateAfternoon,
        Course('Yoga', 'Frau Penislutscher', 45, [Goal.relax, Goal.stretch]));
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
