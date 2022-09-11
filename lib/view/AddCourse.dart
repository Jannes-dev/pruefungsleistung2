import 'package:get/get.dart';
import 'package:pruefungsleistung/structure/goal.dart';
import 'package:pruefungsleistung/behavior/coursePlanSystem.dart';
import 'HomePage.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class AddCourse extends StatefulWidget {
  var _role = "";
  AddCourse(String? role, {super.key}){
    _role = role!;
  }

  @override
  State<AddCourse> createState() => _AddCourse(_role);
}

class _AddCourse extends State<AddCourse> {

  var _role = "";

  final formKey = GlobalKey<FormState>();

  CoursePlanSystem _coursePlanSystem =
      CoursePlanSystem.createCoursePlanSystem();
  String _courseName = "";
  String _instructorName = "";
  int _durationInMinutes = 0;
  List<Goal> _allGoals = [];
  List<Goal> _selectedGoals = [];
  Map<Goal, bool> _checkedGoals = {};

  _AddCourse(String? role) {
    _role = role!;
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
          title:  Text('Add course'.tr, style: TextStyle(fontSize: 26)),
        ),
        body: Form(
            key: formKey,
            child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: TextFormField(
                key: const ValueKey('name'),
                autocorrect: false,
                enableSuggestions: false,
                validator: (value) {
                  if (value == '')
                    return 'Please enter a name'.tr;
                  else
                    return null;
                },
                decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter name for course'.tr),
                onChanged: (value) => setState(() {
                  _courseName = value;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 15),
              child: TextFormField(
                key: const ValueKey('instructorName'),
                validator: (value) {
                  if (value == '')
                    return 'Please enter an instructor'.tr;
                  else
                    return null;
                },
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Instructor'.tr,
                  hintText: 'Enter name of instructor'.tr,
                ),
                onChanged: (value) =>
                    setState(() => _instructorName = value),
              )),
            Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 15),
                child: TextFormField(
                  key: const ValueKey('durationInMinutes'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Duration (minutes)'.tr,
                    hintText: 'Enter duration of the course'.tr,
                  ),
                  onChanged: (value) {
                    setState(() {});
                    _durationInMinutes = int.tryParse(value)!;
                  }
                )),
             Padding(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 15),
              child: Text(
                'Add goal:'.tr,
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
                  value: _checkedGoals[goal],
                  onChanged: (value) {
                    setState(() => _checkedGoals[goal] = value!);
                  },
                ),
              ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                child:  Text(
                  'Add course'.tr,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                onPressed: () {
                  final isValid = formKey.currentState?.validate();

                  if(isValid!) {
                    formKey.currentState?.save();
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title:  Text('Course has been added'.tr),
                          content: Text("$_courseName, $_instructorName, $_durationInMinutes minutes"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AddCourse(_role))),
                              child:  Text('add another course'.tr),
                            ),
                            TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomePage(_role))),
                              child:  Text('return to week plan'.tr),
                            ),
                          ],
                        ));
                    _selectedGoals.clear();
                    for (Goal goal in _allGoals) {
                      if (_checkedGoals[goal] == true) {
                        _selectedGoals.add(goal);
                      }
                    }
                    _coursePlanSystem.addCourse(
                        _courseName,
                        _instructorName,
                        _durationInMinutes,
                        _selectedGoals);
                  }
                },
              ),
            ),
          ],
        ))));
  }
}
