import 'exercise.dart';

class Workout{
   late String _name;
   int _duration = 0;
   late List<Exercise> _exercises;

   Workout(String name){
     this._name = name;
   }

}