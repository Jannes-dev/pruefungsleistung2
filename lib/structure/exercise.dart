import 'package:pruefungsleistung/structure/muscleGroup.dart';

class Exercise {
  late String _name;
  late MuscleGroup _muscleGroup;
  int _duration = 0;
  int _repetitions = 0;

  Excercise(String name, MuscleGroup muscleGroup) {
    this._name = name;
    this._muscleGroup = muscleGroup;
  }

  void setName(String name){
    this._name = name;
  }
  void setMuscleGroup(MuscleGroup muscleGroup){
    this._muscleGroup= muscleGroup;
  }
  void setDuration(int duration) {
    this._duration = duration;
  }
  void setRepitions(int repitions) {
    this._repetitions = repitions;
  }

  String getName(){
    return _name;
  }
  MuscleGroup getMuscleGroup() {
    return _muscleGroup;
  }
  int getDuration(){
    return _duration;
  }
  int getRepitions(){
    return _repetitions;
  }
}