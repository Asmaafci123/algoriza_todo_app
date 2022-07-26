import 'package:flutter/material.dart';
import 'package:to_do/utilities/colors.dart';
import 'package:to_do/utilities/size.dart';

class TaskOfSchedual extends StatelessWidget {
  final Map task;
  const TaskOfSchedual({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 7,
      decoration: BoxDecoration(
          color: KMainColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(SizeConfig.defaultSize! * 1, 0, 0, 0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  task['startTime'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.defaultSize! * 2),
                ),
                Text(
                  task['title'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.defaultSize! * 2),
                ),
              ],
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.watch_later_outlined))
          ],
        ),
      ),
    );
  }
}
