import 'package:flutter/material.dart';
import 'package:pruefungsleistung/structure/CoursePlan.dart';
import 'package:pruefungsleistung/structure/TimeSlot.dart';
import 'package:pruefungsleistung/structure/weekday.dart';

import '../structure/goal.dart';

class WeeklyCoursePlanView extends StatefulWidget {
  late CoursePlan _coursePlan;

  WeeklyCoursePlanView(CoursePlan coursePlan, {super.key}) {
    _coursePlan = coursePlan;
  }

  @override
  State<WeeklyCoursePlanView> createState() =>
      _WeeklyCoursePlanView(_coursePlan);
}

class _WeeklyCoursePlanView extends State<WeeklyCoursePlanView> {
  late CoursePlan _coursePlan;
  var _role = "";

  _WeeklyCoursePlanView(CoursePlan coursePlan) {
    _coursePlan = coursePlan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Week ${_coursePlan.getWeekNumber()}',
            style: TextStyle(fontSize: 26)),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          for (Weekday weekDay in _coursePlan.getCoursePlan().keys)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                  Text(weekDay.value.toString().toUpperCase(),
                      textScaleFactor: 1.3,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
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
                        for (TimeSlot timeSlot
                            in _coursePlan.getCoursePlan()[weekDay].keys)
                          ListTile(
                            leading: const Icon(Icons.access_time),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: <Widget>[
                                  Text('${timeSlot.value} ' ?? "",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ]),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      if (_coursePlan
                                              .getCoursePlan()[weekDay]
                                                  [timeSlot]
                                              .getName() ==
                                          '')
                                        if (_role == 'admin')
                                          Column(
                                            children: <Widget>[
                                              ElevatedButton.icon(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.add),
                                                  label: Text('add')),
                                            ],
                                          ),
                                      if (_coursePlan
                                              .getCoursePlan()[weekDay]
                                                  [timeSlot]
                                              .getName() !=
                                          '')
                                        Row(children: <Widget>[
                                          Text(
                                            _coursePlan
                                                    .getCoursePlan()[weekDay]
                                                        [timeSlot]
                                                    .getName() ??
                                                "",
                                            textAlign: TextAlign.left,
                                          ),
                                        ]),
                                      if (_coursePlan
                                              .getCoursePlan()[weekDay]
                                                  [timeSlot]
                                              .getName() !=
                                          '')
                                        Row(children: <Widget>[
                                          Text(
                                            _coursePlan
                                                    .getCoursePlan()[weekDay]
                                                        [timeSlot]
                                                    .getTrainer() ??
                                                "",
                                            textAlign: TextAlign.left,
                                            textScaleFactor: 0.8,
                                            style: const TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ]),
                                    ]),
                                if (_coursePlan
                                        .getCoursePlan()[weekDay][timeSlot]
                                        .getName() !=
                                    '')
                                  Row(children: <Widget>[
                                    Column(children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                        ),
                                        child: TextButton(
                                            onPressed: () {
                                              showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                            title: Text(_coursePlan
                                                                .getCoursePlan()[
                                                                    weekDay]
                                                                    [timeSlot]
                                                                .getName()),
                                                            content: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Row(children: const <
                                                                          Widget>[
                                                                        Text(
                                                                            'Instructor: ',
                                                                            textAlign:
                                                                                TextAlign.start),
                                                                      ]),
                                                                      Row(children: const <
                                                                          Widget>[
                                                                        Text(
                                                                            'Duration: ',
                                                                            textAlign:
                                                                                TextAlign.start),
                                                                      ]),
                                                                      Row(children: <
                                                                          Widget>[
                                                                        const Text(
                                                                            'Goals: ',
                                                                            textAlign:
                                                                                TextAlign.start),
                                                                      ]),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                        Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: <Widget>[
                                                                              Text(_coursePlan.getCoursePlan()[weekDay][timeSlot].getTrainer())
                                                                            ]),
                                                                        Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: <Widget>[
                                                                              Text('${_coursePlan.getCoursePlan()[weekDay][timeSlot].getDuration()} minutes')
                                                                            ]),
                                                                        Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: <Widget>[
                                                                              for (Goal goal in _coursePlan.getCoursePlan()[weekDay][timeSlot].getGoals())
                                                                                Row(children: <Widget>[
                                                                                  Text(
                                                                                    '${goal.value} ',
                                                                                    textAlign: TextAlign.left,
                                                                                  )
                                                                                ]),
                                                                            ]),
                                                                      ]),
                                                                ]),
                                                            actions: [
                                                              ElevatedButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        context),
                                                                child:
                                                                    const Text(
                                                                  'close',
                                                                  textScaleFactor:
                                                                      1.3,
                                                                ),
                                                              ),
                                                            ],
                                                          ));
                                            },
                                            child: Text('Details',
                                                textScaleFactor: 1.15)),
                                      )
                                    ]),
                                    if (_role == 'admin')
                                      Column(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ],
                                      )
                                  ]),
                              ],
                            ),
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
