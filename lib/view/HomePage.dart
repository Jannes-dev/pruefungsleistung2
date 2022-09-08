import 'package:flutter/material.dart';
import 'package:pruefungsleistung/behavior/coursePlanSystem.dart';

import '../structure/CoursePlan.dart';
import 'AddCoursePlan.dart';
import 'AddCourse.dart';
import 'DeleteCourse.dart';
import 'WeeklyCoursePlanView.dart';

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
            'Weekly schedule',
            style: TextStyle(fontSize: 26),
          ),
          actions: <Widget>[
            if (_role == 'admin')
              IconButton(
                  onPressed: () {
                    setState(() {});
                    _coursePlanSystem.addCoursePlan();
                    CoursePlan coursePlan = _coursePlanSystem.getWeekPlan()[
                        (_coursePlanSystem.getWeekNumberCounter()) - 1];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => WeeklyCoursePlanView(coursePlan)));
                  },
                  icon: Icon(Icons.add))
          ],
        ),
        drawer: Drawer(
          //TODO If und else für Admin rolle hinzufügen
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Text('Penis'),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                ),
              ),
              ListTile(
                title: const Text('add CoursePlan'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AddCoursePlan()));
                },
              ),
              ListTile(
                title: const Text('add Course'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AddCourse(_role)));
                },
              ),
              ListTile(
                title: const Text('delete Course'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DeleteCourse()));
                },
              ),
            ],
          ),
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
                                    WeeklyCoursePlanView(coursePlan)));
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
                                'Week ' + coursePlan.getWeekNumber().toString(),
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
                                            title: Text('Delete week ' + coursePlan.getWeekNumber().toString() + '?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(context),
                                                child: const Text ('cancel', style: TextStyle(fontWeight: FontWeight.bold)),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  _coursePlanSystem.deleteCoursePlan(coursePlan.getWeekNumber());
                                                  setState(() {});
                                                  Navigator.pop(context);
                                                },
                                                child: const Text ('submit'),
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
