import 'package:flutter/material.dart';
import 'package:pruefungsleistung/behavior/coursePlanSystem.dart';

import '../structure/coursePlan.dart';
import 'AddCoursePlan.dart';
import 'AddCourse.dart';
import 'DeleteCourse.dart';
import 'DeleteCoursePlan.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  var role = "admin";
  CoursePlanSystem coursePlanSystem = CoursePlanSystem.createCoursePlanSystem();

  @override
  Widget build(BuildContext context) {


    if(role == 'admin') {
      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Wochenplan'),
      ),
        drawer: Drawer(
          //If und else für Admin rolle hinzufügen
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
              onTap: (){
                Navigator.push(
                  context,
                    MaterialPageRoute(builder: (_) => AddCoursePlan())
                  );
                },
              ),
            ListTile(
              title: const Text('add Course'),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AddCourse())
                );
              },
            ),
            ListTile(
              title: const Text('delete Courseplan'),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DeleteCoursePlan())
                );
              },
            ),
            ListTile(
              title: const Text('delete Course'),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DeleteCourse())
                );
              },
            ),
            ],
          ),
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            for(var i = 1; i <= coursePlanSystem.getCoursePlans().length; i++)
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                      side: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    child: InkWell(
                      splashColor: Colors.lightBlueAccent.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => DeleteCourse()));
                      },
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child:Center(
                          child: Text(
                            'Week $i',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ),
          ],

        ),
      );
    }
    else{
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Wochenpaln'),
        ),

      );
    }

  }

}
