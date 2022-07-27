import 'package:flutter/material.dart';
import 'package:to_do/presentation_layer/Screens/Board/widgets/task.dart';
import 'package:to_do/utilities/size.dart';

class ListOfTasks extends StatelessWidget {
  final String text;
  final List items;
  const ListOfTasks({Key? key, required this.text, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return items.length > 0
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Task(
              item: items[index],
            ),
            itemCount: items.length,
          )
        : Center(
            child: Text(
            text,
            style: TextStyle(
                color: Colors.grey, fontSize: SizeConfig.defaultSize! * 2),
          ));
  }
}
