import 'course.dart';
import 'weekday.dart';

class CoursePlan{
  late int _weekNumber;
  late Map<Weekday, Course> _coursePlan;

  CoursePlan(int weekNumber){
    _weekNumber = weekNumber;
  }

  void addCourse(Weekday weekday, Course course){
    _coursePlan[weekday] = course;
  }

  int getWeekNumber(){
    return _weekNumber;
  }
  Map getCoursePlan(){
    return _coursePlan;
  }
}