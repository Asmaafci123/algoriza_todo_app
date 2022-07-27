import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:to_do/Bussiness_Layer/cubit.dart';
import 'package:to_do/presentation_layer/Screens/schedual/widgets/task_of_schedual.dart';
import 'package:to_do/utilities/size.dart';

class ItemOfIndexedStack extends StatelessWidget {
  final String dayName;
  final String dayDate;
  const ItemOfIndexedStack(
      {Key? key, required this.dayName, required this.dayDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              dayName,
              style: TextStyle(
                  fontSize: SizeConfig.defaultSize! * 2,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Text(
              dayDate,
              style: TextStyle(
                  fontSize: SizeConfig.defaultSize! * 1.6,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: SizeConfig.defaultSize! * 3,
        ),
        Expanded(
          child: AppCubit.get(context).tasksOfSomeDate.length > 0
              ? ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) => SizedBox(
                        height: SizeConfig.defaultSize! * 1.6,
                      ),
                  itemCount: AppCubit.get(context).tasksOfSomeDate.length,
                  itemBuilder: ((context, index) => TaskOfSchedual(
                      task: AppCubit.get(context).tasksOfSomeDate[index])))
              : Center(
                  child: Text(
                    'Day is empty',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: SizeConfig.defaultSize! * 2.2),
                  ),
                ),
        )
      ],
    );
  }
}
