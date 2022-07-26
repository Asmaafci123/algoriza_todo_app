import 'package:flutter/material.dart';
import 'package:to_do/Bussiness_Layer/cubit.dart';
import 'package:to_do/presentation_layer/Screens/schedual/widgets/item_of_indexedstack.dart';
import 'package:to_do/utilities/size.dart';
import 'package:intl/intl.dart';

class SchedualScreen extends StatefulWidget {
  const SchedualScreen({Key? key}) : super(key: key);

  @override
  State<SchedualScreen> createState() => _SchedualScreenState();
}

class _SchedualScreenState extends State<SchedualScreen> {
  @override
  Widget build(BuildContext context) {
    final _currentDate = DateTime.now();
    final _dayFormatter = DateFormat('d');
    final _dayNameFormatter = DateFormat('EEEE');
    final dateFormatter = DateFormat('dd MMM,y');
    final dates = <Widget>[];
    for (int i = 0; i < 7; i++) {
      final date = _currentDate.add(Duration(days: i));
      AppCubit.get(context).daysName.add(_dayNameFormatter.format(date));
      AppCubit.get(context).datesOf7.add(dateFormatter.format(date));

      dates.add(GestureDetector(
        onTap: () {
          setState(() {
            AppCubit.get(context).changeDayColors(i);
            AppCubit.get(context).tasksOfDate(date);
          });
        },
        child: Container(
            height: SizeConfig.defaultSize! * 7,
            width: SizeConfig.defaultSize! * 5,
            decoration: BoxDecoration(
                color: AppCubit.get(context).dayColors[i],
                borderRadius: BorderRadius.circular(7)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _dayNameFormatter.format(date).substring(0, 3),
                    style: TextStyle(
                        color: AppCubit.get(context).textDayColors[i],
                        fontSize: SizeConfig.defaultSize! * 1.5),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * .8,
                  ),
                  Text(
                    _dayFormatter.format(date),
                    style: TextStyle(
                        color: AppCubit.get(context).textDayColors[i],
                        fontSize: SizeConfig.defaultSize! * 1.5),
                  ),
                ],
              ),
            )),
      ));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          iconSize: SizeConfig.defaultSize! * 1.8,
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Schedual',
          style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.defaultSize! * 2.2,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
        titleSpacing: 0,
        elevation: 1,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, SizeConfig.defaultSize! * 1.8, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: dates,
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * 0.8,
            ),
            Divider(
              indent: 0,
              endIndent: 0,
              color: Colors.grey[400],
              thickness: 0.7,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    SizeConfig.defaultSize! * 1.8,
                    SizeConfig.defaultSize! * 1.8,
                    SizeConfig.defaultSize! * 1.8,
                    SizeConfig.defaultSize! * 1.8),
                child: IndexedStack(
                  index: AppCubit.get(context).choosenDayIndex,
                  children: [
                    ItemOfIndexedStack(
                      dayName: AppCubit.get(context).daysName[0],
                      dayDate: AppCubit.get(context).datesOf7[0],
                    ),
                    ItemOfIndexedStack(
                      dayName: AppCubit.get(context).daysName[1],
                      dayDate: AppCubit.get(context).datesOf7[1],
                    ),
                    ItemOfIndexedStack(
                      dayName: AppCubit.get(context).daysName[2],
                      dayDate: AppCubit.get(context).datesOf7[2],
                    ),
                    ItemOfIndexedStack(
                      dayName: AppCubit.get(context).daysName[3],
                      dayDate: AppCubit.get(context).datesOf7[3],
                    ),
                    ItemOfIndexedStack(
                      dayName: AppCubit.get(context).daysName[4],
                      dayDate: AppCubit.get(context).datesOf7[4],
                    ),
                    ItemOfIndexedStack(
                      dayName: AppCubit.get(context).daysName[5],
                      dayDate: AppCubit.get(context).datesOf7[5],
                    ),
                    ItemOfIndexedStack(
                      dayName: AppCubit.get(context).daysName[6],
                      dayDate: AppCubit.get(context).datesOf7[6],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
