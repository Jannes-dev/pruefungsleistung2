import 'package:pruefungsleistung/structure/course.dart';
import 'package:pruefungsleistung/structure/coursePlan.dart';
import 'package:pruefungsleistung/structure/goal.dart';

class CoursePlanSystem{

  static CoursePlanSystem _coursePlanSystem = CoursePlanSystem._CoursePlanSystem();

  static Map<int, Course> _courses = {};
  static Map<int, CoursePlan> _weekPlan = {};

  CoursePlanSystem._CoursePlanSystem() {
    addCoursePlan(1);
    addCoursePlan(2);
    addCoursePlan(3);
  }

  static CoursePlanSystem createCoursePlanSystem(){
    if(_coursePlanSystem == null){
      _coursePlanSystem = CoursePlanSystem._CoursePlanSystem();
    }
    return _coursePlanSystem;
  }

  void addCoursePlan(int weekNumber){
    CoursePlan coursePlan = new CoursePlan(weekNumber);
    _weekPlan[weekNumber] = coursePlan;
  }
  void addCourse(String name, String trainer, int durationInMinutes, List<Goal> goals){
    Course course = new Course(name, trainer, durationInMinutes, goals);
    _courses[course.getId()] = course;
  }

  void deleteCoursePlan(int weekNumber){
    _weekPlan.remove(weekNumber);
  }
  void deleteCourse(int id){
    _courses.remove(id);
  }

  Map getWeekPlan(){
    return _weekPlan;
  }
  Map getCourses(){
    return _courses;
  }

}