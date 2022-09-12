import 'package:pruefungsleistung/structure/Course.dart';
import 'package:pruefungsleistung/structure/CoursePlan.dart';
import 'package:pruefungsleistung/structure/goal.dart';

class CoursePlanSystem{

  static CoursePlanSystem _coursePlanSystem = CoursePlanSystem._CoursePlanSystem();

  static Map<int, Course> _courses = {};
  static Map<int, CoursePlan> _weekPlan = {};
  static int _weekNumberCounter = 1;

  CoursePlanSystem._CoursePlanSystem() {
    addCoursePlan();
    addCoursePlan();
    addCoursePlan();
    addCourse('Yoga', 'Bernd', 15, [Goal.stamina, Goal.coreStability]);
    addCourse('Zumba', 'Bernd', 15, [Goal.stamina, Goal.coreStability]);
  }

  static CoursePlanSystem createCoursePlanSystem(){
    if(_coursePlanSystem == null){
      _coursePlanSystem = CoursePlanSystem._CoursePlanSystem();
    }
    return _coursePlanSystem;
  }

  void addCoursePlan(){
    CoursePlan coursePlan = new CoursePlan(_weekNumberCounter);
    _weekPlan[_weekNumberCounter] = coursePlan;
    _weekNumberCounter++;
  }
  void addCourse(String name, String trainer, int durationInMinutes, List<Goal> goals){
    Course course = new Course(name, trainer, durationInMinutes, goals);
    _courses[course.getId()] = course;
    print(course);
  }

  void deleteCoursePlan(int weekNumber){ //TODO WeekNumber löschen und Map neu sortieren
    Map<int, CoursePlan> newMap = {};
    int newWeekNumberCounter = 1;
    _weekPlan.remove(weekNumber);
    for(CoursePlan coursePlan in _weekPlan.values){
      coursePlan.setWeekNumber(newWeekNumberCounter);
      newMap[newWeekNumberCounter] = coursePlan;
      newWeekNumberCounter++;
    }
    _weekPlan = newMap;
    _weekNumberCounter = newWeekNumberCounter;
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

  int getWeekNumberCounter() {
    return _weekNumberCounter;
  }


}