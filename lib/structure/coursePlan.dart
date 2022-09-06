import 'course.dart';
import 'weekday.dart';
import 'timeSlot.dart';

class CoursePlan{
  late int _weekNumber;
  Map<Weekday,Map<TimeSlot, Course>> _coursePlan = {};

  CoursePlan(int weekNumber){
    _weekNumber = weekNumber;
  }

  void addCourse(Weekday weekday, TimeSlot timeSlot, Course course){
    Map<TimeSlot, Course> newCourse = {};
    newCourse[timeSlot] = course;
    _coursePlan[weekday] = newCourse;
  }

  int getWeekNumber(){
    return _weekNumber;
  }
  Map getCoursePlan(){
    return _coursePlan;
  }
}

