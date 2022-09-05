import 'package:flutter/material.dart';

import 'AddCoursePlan.dart';
import 'AddCourse.dart';
import 'DeleteCourse.dart';
import 'DeleteCoursePlan.dart';

class HomePage extends StatelessWidget {

  var role = "admin";
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
                Navigator.pop(
                  context,
                    MaterialPageRoute(builder: (_) => AddCoursePlan())
                  );
                },
              ),
            ListTile(
              title: const Text('add Course'),
              onTap: (){
                Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (_) => AddCourse())
                );
              },
            ),
            ListTile(
              title: const Text('delete Courseplan'),
              onTap: (){
                Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (_) => DeleteCoursePlan())
                );
              },
            ),
            ListTile(
              title: const Text('delete Course'),
              onTap: (){
                Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (_) => DeleteCourse())
                );
              },
            ),
            ],
          ),
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
