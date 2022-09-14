import 'package:pruefungsleistung/structure/Course.dart';
import 'package:pruefungsleistung/structure/CoursePlan.dart';
import 'package:pruefungsleistung/structure/TimeSlot.dart';
import 'package:pruefungsleistung/structure/goal.dart';
import 'package:pruefungsleistung/structure/weekday.dart';


class CoursePlanSystem{
  String test = '';
  static CoursePlanSystem _coursePlanSystem = CoursePlanSystem._CoursePlanSystem();

  static Map<int, Course> _courses = {};
  static Map<int, CoursePlan> _weekPlan = {};
  static int _weekNumberCounter = 1;

  CoursePlanSystem._CoursePlanSystem() {

    addCourse('Yoga', 'Maria Mueller', 60, [Goal.stretch, Goal.relax]);
    addCourse('Pilates', 'Meike Meier', 45, [Goal.strength, Goal.stamina]);
    addCourse('Zumba', 'Kerstin Schiller', 30, [Goal.stamina, Goal.fun]);
    addCourse('Core', 'Klaus Kleber', 60, [Goal.coreStability, Goal.strength]);
    addCourse('Combat', 'Thorsten Legat', 30, [Goal.strength, Goal.stamina]);
    addCourse('Jumping', 'Bastian Yotta', 45, [Goal.stamina]);
    addCourse('Balance', 'Arno Duebel', 45, [Goal.coreStability]);
    addCourse('Bum / abs', 'Heidi Klum', 30, [Goal.strength, Goal.stamina]);
    addCourse('Judo', 'Thorsten Legat', 60, [Goal.fun, Goal.strength]);
    addCourse('Self defence', 'Carsten Stahl', 60, [Goal.fun, Goal.relax]);

    addCoursePlan(); addCoursePlan(); addCoursePlan(); addCoursePlan(); addCoursePlan(); addCoursePlan(); addCoursePlan(); addCoursePlan();
    getWeekPlan()[1].addCourseToCoursePlan(Weekday.monday, TimeSlot.midday, getCourses()[1]);
    getWeekPlan()[1].addCourseToCoursePlan(Weekday.tuesday, TimeSlot.midday, getCourses()[5]);
    getWeekPlan()[1].addCourseToCoursePlan(Weekday.friday, TimeSlot.midday, getCourses()[8]);
    getWeekPlan()[2].addCourseToCoursePlan(Weekday.monday, TimeSlot.midday, getCourses()[1]);
    getWeekPlan()[3].addCourseToCoursePlan(Weekday.monday, TimeSlot.midday, getCourses()[4]);
    getWeekPlan()[3].addCourseToCoursePlan(Weekday.tuesday, TimeSlot.midday, getCourses()[5]);
    getWeekPlan()[3].addCourseToCoursePlan(Weekday.thursday, TimeSlot.midday, getCourses()[9]);
    getWeekPlan()[4].addCourseToCoursePlan(Weekday.monday, TimeSlot.midday, getCourses()[4]);
    getWeekPlan()[4].addCourseToCoursePlan(Weekday.tuesday, TimeSlot.lateAfternoon, getCourses()[5]);
    getWeekPlan()[4].addCourseToCoursePlan(Weekday.thursday, TimeSlot.midday, getCourses()[10]);

  }


  static CoursePlanSystem createCoursePlanSystem(){
    return _coursePlanSystem;
  }

  void addCoursePlan(){
    CoursePlan coursePlan = CoursePlan(_weekNumberCounter);
    _weekPlan[_weekNumberCounter] = coursePlan;
    _weekNumberCounter++;
  }
  void addCourse(String name, String trainer, int durationInMinutes, List<Goal> goals){
    Course course = new Course(name, trainer, durationInMinutes, goals);
    _courses[course.getId()] = course;
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