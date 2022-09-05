import 'package:pruefungsleistung/structure/course.dart';
import 'package:pruefungsleistung/structure/coursePlan.dart';
import 'package:pruefungsleistung/structure/goal.dart';

class CoursePlanSystem{

  static late CoursePlanSystem _coursePlanSystem;

  static late Map<int, Course> _courses;
  static late Map<int, CoursePlan> _coursePlans;

  CoursePlanSystem createCoursePlanSystem(){
    if(_coursePlanSystem == null){
      _coursePlanSystem = new CoursePlanSystem();
    }
    return _coursePlanSystem;
  }

  void addCoursePlan(int weekNumber){
    CoursePlan coursePlan = new CoursePlan(weekNumber);
    _coursePlans[weekNumber] = coursePlan;
  }
  void addCourse(String name, String trainer, int durationInMinutes, List<Goal> goals){
    Course course = new Course(name, trainer, durationInMinutes, goals);
    _courses[course.getId()] = course;
  }

  void deleteCoursePlan(int weekNumber){
    _coursePlans.remove(weekNumber);
  }
  void deleteCourse(int id){
    _courses.remove(id);
  }

  Map getCoursePlans(){
    return _coursePlans;
  }
  Map getCourses(){
    return _courses;
  }

}