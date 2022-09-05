import 'package:flutter/material.dart';
import 'package:pruefungsleistung/behavior/coursePlanSystem.dart';


class AddCourse extends StatefulWidget{

  CoursePlanSystem _coursePlanSystem = CoursePlanSystem.createCoursePlanSystem();

  const AddCourse({super.key});



  @override
  State<AddCourse> createState() => _AddCoursePlan();

}

class _AddCoursePlan extends State<AddCourse>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}