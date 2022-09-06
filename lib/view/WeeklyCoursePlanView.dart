import 'package:flutter/material.dart';
import 'package:pruefungsleistung/structure/coursePlan.dart';
import 'package:pruefungsleistung/structure/TimeSlot.dart';
import 'package:pruefungsleistung/structure/weekday.dart';


class WeeklyCoursePlanView extends StatelessWidget {
  late CoursePlan _coursePlan;

  WeeklyCoursePlanView(CoursePlan coursePlan, {super.key}) {
    _coursePlan = coursePlan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Week ' + _coursePlan.getWeekNumber().toString()),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          for (Weekday weekDay
              in _coursePlan.getCoursePlan().keys)
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                    children: [
                      Text(weekDay.value.toString()!),
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                          side: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            for (TimeSlot course in _coursePlan.getCoursePlan()[weekDay].keys)
                              ListTile(
                                leading: Icon(Icons.account_circle),
                                title: Row(
                                  children: [
                                    Text(course.value.toString() ?? ""),
                                    Text(_coursePlan.getCoursePlan()[weekDay][course].getName()?? ""),

                                  ],
                                ),
                                subtitle: Text(_coursePlan.getCoursePlan()[weekDay][course].getTrainer()?? ""),
                              ),
                          ],
                        ),
                      )
                    ],
                ),
            ),
        ],
      ),
    );
  }
}
