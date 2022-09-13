import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruefungsleistung/structure/CoursePlan.dart';
import 'package:pruefungsleistung/structure/TimeSlot.dart';
import 'package:pruefungsleistung/structure/weekday.dart';

import '../behavior/coursePlanSystem.dart';
import '../structure/Course.dart';
import '../structure/goal.dart';

class WeeklyCoursePlanView extends StatefulWidget {
  late CoursePlan _coursePlan;
  String _role = '';

  WeeklyCoursePlanView(String role, CoursePlan coursePlan, {super.key}) {
    _role = role;
    _coursePlan = coursePlan;
  }

  @override
  State<WeeklyCoursePlanView> createState() =>
      _WeeklyCoursePlanView(_role, _coursePlan);
}

class _WeeklyCoursePlanView extends State<WeeklyCoursePlanView> {


  CoursePlanSystem _coursePlanSystem =
      CoursePlanSystem.createCoursePlanSystem();
  late CoursePlan _coursePlan;
  var _role = "";

  String? _selectedItem = 'none'.tr;
  int _selectedItemIndex = 0;
  List<String> _items = ['none'.tr];

  _WeeklyCoursePlanView(String role, CoursePlan coursePlan) {
    _coursePlan = coursePlan;
    _role = role;
    for (Course course in _coursePlanSystem.getCourses().values) {
      _items.add(course.getName().toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Week'.tr + ' ${_coursePlan.getWeekNumber()}',
            style: TextStyle(fontSize: 26)),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          for (Weekday weekDay in _coursePlan.getCoursePlan().keys)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Text(weekDay.value.toString().toUpperCase(),
                      textScaleFactor: 1.3,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                      side: BorderSide(
                        color: Colors.black26,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        for (TimeSlot timeSlot
                            in _coursePlan.getCoursePlan()[weekDay].keys)
                          ListTile(
                            leading: const Icon(Icons.access_time),
                            minLeadingWidth: 10,
                            title: Transform.translate(
                                offset: Offset(0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: <Widget>[
                                      Text('${timeSlot.value} ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          if (_coursePlan
                                                  .getCoursePlan()[weekDay]
                                                      [timeSlot]
                                                  .getName() ==
                                              '')
                                            if (_role == 'admin')
                                              // add button
                                              Column(
                                                children: <Widget>[
                                                  ElevatedButton.icon(
                                                      onPressed: () async {
                                                        await showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return StatefulBuilder(
                                                                  builder: (context,
                                                                      setState) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Select course'
                                                                          .tr),
                                                                  content: DropdownButtonFormField<
                                                                          String>(
                                                                      decoration: InputDecoration(
                                                                          enabledBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(12),
                                                                              borderSide: BorderSide(width: 1.5, color: Colors.blue))),
                                                                      value: _selectedItem,
                                                                      items: _items
                                                                          .map((item) => DropdownMenuItem(
                                                                                value: item,
                                                                                child: Text(item),
                                                                              ))
                                                                          .toList(),
                                                                      onChanged: (item) {
                                                                        setState(() =>
                                                                            _selectedItem =
                                                                                item);
                                                                        _selectedItemIndex =
                                                                            _items.indexOf(item!);
                                                                      }),
                                                                  actions: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(
                                                                                  context),
                                                                          child: Text(
                                                                              'cancel'.tr,
                                                                            style: TextStyle(fontSize: 17.5))),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            if (_selectedItem ==
                                                                                'none'.tr)
                                                                              Navigator.pop(context);
                                                                            else {
                                                                              _coursePlan.getCoursePlan()[weekDay][timeSlot] =
                                                                                  _coursePlanSystem.getCourses().values.elementAt(_selectedItemIndex - 1);
                                                                              setState(() {});
                                                                              this.setState(() {});
                                                                              Navigator.pop(context);
                                                                            }
                                                                          },
                                                                          child: Text(
                                                                              'add'.tr,
                                                                            style: TextStyle(fontSize: 17.5),)),
                                                                    )
                                                                  ],
                                                                );
                                                              });
                                                            });
                                                        setState(() {});
                                                      },
                                                      icon: Icon(Icons.add),
                                                      label: Text('add'.tr)),
                                                ],
                                              ),
                                          if (_coursePlan
                                                  .getCoursePlan()[weekDay]
                                                      [timeSlot]
                                                  .getName() !=
                                              '')
                                            // course name
                                            Row(children: <Widget>[
                                              Text(
                                                _coursePlan
                                                        .getCoursePlan()[
                                                            weekDay][timeSlot]
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
                                            // Instructor
                                            Row(children: <Widget>[
                                              Text(
                                                _coursePlan
                                                        .getCoursePlan()[
                                                            weekDay][timeSlot]
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
                                              left: 10.0,
                                              right: 10.0,
                                            ),
                                            //details
                                            child: TextButton(
                                                onPressed: () {
                                                  showDialog<String>(
                                                      context: context,
                                                      builder:
                                                          (BuildContext
                                                                  context) =>
                                                              AlertDialog(
                                                                title: Text(_coursePlan
                                                                    .getCoursePlan()[
                                                                        weekDay]
                                                                        [
                                                                        timeSlot]
                                                                    .getName()),
                                                                content: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: <
                                                                        Widget>[
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: <
                                                                            Widget>[
                                                                          Row(children: <
                                                                              Widget>[
                                                                            Text('${'Instructor'.tr}: ',
                                                                                textAlign: TextAlign.start),
                                                                          ]),
                                                                          Row(children: <
                                                                              Widget>[
                                                                            Text('${'Duration'.tr}: ',
                                                                                textAlign: TextAlign.start),
                                                                          ]),
                                                                          Row(children: <
                                                                              Widget>[
                                                                            Text('${'Goals'.tr}: ',
                                                                                textAlign: TextAlign.start),
                                                                          ]),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                          mainAxisSize: MainAxisSize
                                                                              .min,
                                                                          crossAxisAlignment: CrossAxisAlignment
                                                                              .start,
                                                                          children: <
                                                                              Widget>[
                                                                            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                                                                              Text(_coursePlan.getCoursePlan()[weekDay][timeSlot].getTrainer())
                                                                            ]),
                                                                            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                                                                              Text('${_coursePlan.getCoursePlan()[weekDay][timeSlot].getDuration()} ${'minutes'.tr}')
                                                                            ]),
                                                                            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
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
                                                                    child: Text(
                                                                        'close'
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                17.5)),
                                                                  ),
                                                                ],
                                                              ));
                                                },
                                                child: Text('Details',
                                                    textScaleFactor: 1.15)),
                                          )
                                        ]),
                                        if (_role == 'admin')
                                          //delete button
                                          Column(
                                            children: <Widget>[
                                              IconButton(
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                            title: Text(
                                                                '${'${'Delete course'.tr} ' + _coursePlan.getCoursePlan()[weekDay][timeSlot].getName()}?'),
                                                            actions: [
                                                              Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          context),
                                                                  child: Text(
                                                                      'cancel'.tr,
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                          fontSize:
                                                                              17.5)),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: TextButton(
                                                                  onPressed: () {
                                                                    _coursePlan.getCoursePlan()[
                                                                                weekDay]
                                                                            [
                                                                            timeSlot] =
                                                                        Course
                                                                            .courseForWeekdays();
                                                                    setState(
                                                                        () {});
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      'submit'.tr,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              17.5)),
                                                                ),
                                                              ),
                                                            ],
                                                          ));
                                                },
                                              ),
                                            ],
                                          )
                                      ]),
                                  ],
                                )),
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
