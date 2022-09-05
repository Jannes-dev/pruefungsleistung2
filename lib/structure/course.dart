import 'goal.dart';

class Course {
  static int _courseCounter = 0;

  late int _id;
  late String _name;
  late String _trainer;
  late int _durationInMinutes;
  late List<Goal> _goals;

  Course(String name, String trainer, int durationInMinutes, List<Goal> goals) {
    _id = ++_courseCounter;
    _name = name;
    _trainer = trainer;
    _durationInMinutes = durationInMinutes;
    _goals = goals;
  }

  void setName(String name){
    _name = name;
  }
  void setTrainer(String trainer){
    _trainer = trainer;
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
    return _trainer;
  }
  int getDuration(){
    return _durationInMinutes;
  }
  List getGoals(){
    return _goals;
  }
}