import 'package:get/get.dart';
import 'package:pruefungsleistung/structure/Course.dart';
import 'package:pruefungsleistung/structure/goal.dart';
import 'package:pruefungsleistung/behavior/coursePlanSystem.dart';
import 'package:pruefungsleistung/view/ViewCourses.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'AddCourse.dart';

class EditCourseView extends StatefulWidget {
  var _role = "";
  var _course;
  EditCourseView(String? role,Course course ,{super.key}){
    _role = role!;
    _course = course;
  }

  @override
  State<EditCourseView> createState() => _EditCourseView(_role, _course);
}

class _EditCourseView extends State<EditCourseView> {

  var _role = "";
  var _course;
  final formKey = GlobalKey<FormState>();

  CoursePlanSystem _coursePlanSystem = CoursePlanSystem.createCoursePlanSystem();
  String _courseName = "";
  String _instructorName = "";
  int _durationInMinutes = 0;
  List<Goal> _allGoals = [];
  List<Goal> _selectedGoals = [];
  Map<Goal, bool> _checkedGoals = {};

  _EditCourseView(String? role, course) {
    _role = role!;
    _course = course;
    Goal.values.forEach((goal) {
      _allGoals.add(goal);
      _checkedGoals[goal] = false;
    });
    for(Goal goal in _course.getGoals()){
      _checkedGoals[goal] = true;
    }
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
                        initialValue: _course.getName(),
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
                          _course.setName(value);
                        }),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15.0, bottom: 15),
                        child: TextFormField(
                          initialValue: _course.getTrainer(),
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
                              setState(() => _course.setTrainer(value)),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15.0, bottom: 15),
                        child: TextFormField(
                            initialValue: _course.getDuration().toString(),
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
                              if(value == ''){
                                value = '0';
                              }
                              setState(() {});
                              _course.setDuration(int.tryParse(value));
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          child:  Text(
                            'Save'.tr,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          onPressed: () {
                            final isValid = formKey.currentState?.validate();

                            if(isValid!) {
                              formKey.currentState?.save();

                              _selectedGoals.clear();
                              for (Goal goal in _allGoals) {
                                if (_checkedGoals[goal] == true) {
                                  _selectedGoals.add(goal);
                                }
                              }
                              _course.setGoals(_selectedGoals);
                              _coursePlanSystem.getCourses()[_course.getId()] = _course;
                              Navigator.push(context, MaterialPageRoute(builder: (_) => ViewCourses(_role)) );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
