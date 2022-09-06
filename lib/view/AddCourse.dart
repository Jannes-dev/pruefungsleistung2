import 'package:pruefungsleistung/structure/goal.dart';
import 'package:pruefungsleistung/behavior/coursePlanSystem.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


class AddCourse extends StatefulWidget{
  const AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourse();

}

class _AddCourse extends State<AddCourse>{

  CoursePlanSystem _coursePlanSystem = CoursePlanSystem.createCoursePlanSystem();
  String _courseName = "";
  String _instructorName = "";
  int _durationInMinutes = 0;
  List<Goal> _allGoals = [];
  List<Goal> _selectedGoals = [];
  Map<Goal, bool> _checkedGoals = {};


  _AddCourse(){
    Goal.values.forEach((goal) {
      _allGoals.add(goal);
      _checkedGoals[goal] = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Kurs hinzufügen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: TextFormField(
                key: const ValueKey('name'),
                autocorrect: false,
                textCapitalization: TextCapitalization.none,
                enableSuggestions: false,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter name for course.'
                ),
                onSaved: (value){
                  _courseName = value!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 15.0,
                  bottom: 15
              ),
              child: TextFormField(
                key: const ValueKey('instructorName'),
                validator: (String? value) {
                  return (value != null) ? 'Please enter an instructor' : null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Instructor',
                  hintText: 'Enter name of instructor',
                ),
                onSaved: (value){
                  _instructorName = value!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 15.0,
                  bottom: 15
              ),
              child: TextFormField(
                key: const ValueKey('durationInMinutes'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Duration (minutes)',
                  hintText: 'Enter duration of the course',
                ),
                onSaved: (value) {
                  _durationInMinutes = value! as int;
                }
              )
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 15.0,
                  bottom: 15),
              child: Text(
                  'Select goal:',
                  textAlign: TextAlign.left,
                  textScaleFactor: 1.3,
                ),
            ),
            for (Goal goal in _allGoals)
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                ),
                child: CheckboxListTile(
                  title: Text(goal.value.toString()),
                  value : _checkedGoals[goal],
                  onChanged: (value) {
                    setState(() => _checkedGoals[goal] = value!);
                  },
                ),
              ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: TextButton(
                onPressed: () {
                  _selectedGoals.clear();
                  for (Goal goal in _allGoals) {
                    if (_checkedGoals[goal] == true) {
                      _selectedGoals.add(goal);
                    }
                  }
                  _coursePlanSystem.addCourse(_courseName, _instructorName, _durationInMinutes, _selectedGoals); //TODO Variablen speichern
                },
                child: const Text(
                  'Add course',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                  ),
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}