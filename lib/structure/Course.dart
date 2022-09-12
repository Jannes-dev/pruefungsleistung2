import 'goal.dart';

class Course {
  static int _courseCounter = 0;

  late int _id;
  late String _name;
  late String _instructor;
  late int _durationInMinutes;
  late List<Goal> _goals;

  Course(String name, String trainer, int durationInMinutes, List<Goal> goals) {
    _id = ++_courseCounter;
    _name = name;
    _instructor = trainer;
    _durationInMinutes = durationInMinutes;
    _goals = goals;
  }
  Course.courseForWeekdays(){
    _id = 0;
    _name = "";
    _instructor = "";
    _durationInMinutes = 0;
    _goals = [];
  }

  void setName(String name){
    _name = name;
  }
  void setTrainer(String trainer){
    _instructor = trainer;
  }
  void setDuration(int durationInMinutes){
    _durationInMinutes = durationInMinutes;
  }
  void setGoals(List<Goal> goals){
    _goals = goals;
  }
  void addGoal(Goal goal){
    _goals.add(goal);
  }

  int getId(){
    return _id;
  }
  String getName(){
    return _name;
  }
  String getTrainer(){
    return _instructor;
  }
  int getDuration(){
    return _durationInMinutes;
  }
  List getGoals(){
    return _goals;
  }
}