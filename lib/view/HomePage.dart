import 'package:flutter/material.dart';
import 'package:pruefungsleistung/behavior/coursePlanSystem.dart';
import 'package:get/get.dart';
import '../structure/CoursePlan.dart';
import 'AddCourse.dart';
import 'WeeklyCoursePlanView.dart';

enum Menu { addWeekPlan, addCourse}

class HomePage extends StatefulWidget {
  var _role = "";
  HomePage(String? role, {super.key}){
   _role = role!;
  }

  @override
  State<HomePage> createState() => _HomePage(_role);
}


class _HomePage extends State<HomePage> {

  var _role = "";

  _HomePage(String? role){
    _role = role!;
  }
  CoursePlanSystem _coursePlanSystem =
      CoursePlanSystem.createCoursePlanSystem();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Weekly schedule'.tr,
            style: TextStyle(fontSize: 26),
          ),

          actions: <Widget>[
            if (_role == 'admin')
              PopupMenuButton<Menu>(
                  onSelected: (Menu item) {
                    if(item == Menu.addWeekPlan){
                      _coursePlanSystem.addCoursePlan();
                      CoursePlan coursePlan = _coursePlanSystem.getWeekPlan()[
                      (_coursePlanSystem.getWeekNumberCounter()) - 1];
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (_) => WeeklyCoursePlanView(_role, coursePlan))
                      );
                      setState(() {
                      });
                      };
                    if(item == Menu.addCourse){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => AddCourse(_role))
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                    PopupMenuItem<Menu>(
                      value: Menu.addWeekPlan,
                      child: Text('Add weekplan'.tr),
                    ),
                    PopupMenuItem<Menu>(
                      value: Menu.addCourse,
                      child: Text('Add course'.tr),
                      onTap: (){

                    },
                  ),
                ]
                ),
                ],
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            for (CoursePlan coursePlan
                in _coursePlanSystem.getWeekPlan().values)
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Card(
                    elevation: 0,
                    child: InkWell(
                      splashColor: Colors.lightBlueAccent.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    WeeklyCoursePlanView(_role, coursePlan)));
                      },
                      child: SizedBox(
                          width: 200,
                          height: 50,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                              Text(
                                '${'Week'.tr} ${coursePlan.getWeekNumber()}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                              if (_role == 'admin')
                                IconButton(
                                    onPressed: () {
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) => AlertDialog(
                                            title: Text('${'Delete week'.tr} ${coursePlan.getWeekNumber()}?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(context),
                                                child: Text ('cancel'.tr, style: TextStyle(fontWeight: FontWeight.bold)),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  _coursePlanSystem.deleteCoursePlan(coursePlan.getWeekNumber());
                                                  setState(() {});
                                                  Navigator.pop(context);
                                                },
                                                child: Text ('submit'.tr),
                                              ),
                                            ],
                                          )
                                      );
                                    },
                                    icon:
                                        Icon(Icons.delete, color: Colors.red)),
                            ]),
                          )),
                    ),
                  )),
          ],
        ),
      );
  }
}
