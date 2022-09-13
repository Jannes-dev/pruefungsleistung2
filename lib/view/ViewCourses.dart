import 'package:flutter/material.dart';
import 'package:pruefungsleistung/behavior/coursePlanSystem.dart';
import 'package:get/get.dart';
import 'package:pruefungsleistung/view/AddCourse.dart';
import 'package:pruefungsleistung/view/EditCourseView.dart';
import 'package:pruefungsleistung/view/HomePage.dart';

import '../structure/Course.dart';
import '../structure/goal.dart';

class ViewCourses extends StatefulWidget{
  var _role = '';

  ViewCourses(String? role, {super.key}){
    _role = role!;
  }

  @override
  State<ViewCourses> createState() => _ViewCourses(_role);

}

class _ViewCourses extends State<ViewCourses>{

  CoursePlanSystem _coursePlanSystem = CoursePlanSystem.createCoursePlanSystem();
  var _role = '';

  _ViewCourses(String role){
    _role = role;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage(_role)));
          },
        ),
        title: Text('All courses'.tr, style: TextStyle(fontSize: 26)),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => AddCourse(_role)));
              }, icon: Icon(Icons.add))
            ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget> [
          for(Course course in _coursePlanSystem.getCourses().values)
            Container(
                padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black26))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(course.getName(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(course.getTrainer(), style: TextStyle(fontSize: 15, color: Colors.black45)),
                        Text('${course.getDuration()} ${'min.'.tr}', style: TextStyle(fontSize: 15)),
                        Row(
                          children: [
                            for (Goal goal in course.getGoals())
                              Text('${goal.value} ', style: TextStyle(fontSize: 15))
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => EditCourseView(_role, course)));
                              },
                              icon: Icon(Icons.edit, color: Colors.black54,)),
                          IconButton(
                            onPressed: (){
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: Text('${'delete course'.tr} ${course.getName()}?'),
                                    actions:[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: Text('cancel'.tr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5))
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextButton(
                                            onPressed: (){
                                              _coursePlanSystem.getCourses().remove(course.getId());
                                              setState(() {});
                                              Navigator.pop(context);
                                              },
                                            child: Text ('submit'.tr,
                                              style: TextStyle(fontSize: 17.5),
                                            )),
                                      ),
                                    ]
                                  ));
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          )
                        ],
                      )
                  )
          /*        Padding(padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text('${course.getDuration()} ${'min.'.tr}', style: TextStyle(fontSize: 15))
                      ],
                    )
                  ) */
                ],
              )
            )
        ],
      ),
    );

  }
}