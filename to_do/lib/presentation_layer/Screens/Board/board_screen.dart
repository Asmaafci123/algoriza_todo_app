import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/Bussiness_Layer/cubit.dart';
import 'package:to_do/Bussiness_Layer/states.dart';
import 'package:to_do/presentation_layer/Screens/Board/widgets/list_of_tasks.dart';
import 'package:to_do/presentation_layer/Screens/Board/widgets/text.dart';
import 'package:to_do/presentation_layer/widgets/main_button.dart';
import 'package:to_do/utilities/routes.dart';
import 'package:to_do/utilities/size.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              leadingWidth: 0,
              title: Text(
                'Board',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.defaultSize! * 2.5),
              ),
              actions: [
                IconButton(
                    color: Colors.black,
                    onPressed: () {
                      AppCubit.get(context).tasksOfDate(DateTime.now());
                      Navigator.pushNamed(
                          context, AppRoutes.scheduleScreenRoute);
                    },
                    icon: const Icon(Icons.calendar_month_rounded))
              ],
            ),
            body: Padding(
              padding:
                  EdgeInsets.fromLTRB(0, SizeConfig.defaultSize! * 1.8, 0, 0),
              child: Column(children: [
                Row(children: [
                  Expanded(
                      flex: 1,
                      child: SharedText(
                        index: 0,
                        text: 'All',
                        onTap: () => AppCubit.get(context).changeIndexOfList(0),
                      )),
                  Expanded(
                      flex: 2,
                      child: SharedText(
                        index: 1,
                        text: 'Completed',
                        onTap: () => AppCubit.get(context).changeIndexOfList(1),
                      )),
                  Expanded(
                      flex: 2,
                      child: SharedText(
                        index: 2,
                        text: 'UnCompleted',
                        onTap: () => AppCubit.get(context).changeIndexOfList(2),
                      )),
                  Expanded(
                      flex: 2,
                      child: SharedText(
                        index: 3,
                        text: 'Favorites',
                        onTap: () => AppCubit.get(context).changeIndexOfList(3),
                      )),
                ]),
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
                        SizeConfig.defaultSize! * 1,
                        SizeConfig.defaultSize! * 1,
                        SizeConfig.defaultSize! * 1,
                        0),
                    child: IndexedStack(
                      index: AppCubit.get(context).indexOfList,
                      children: [
                        ListOfTasks(
                          text: 'Your Tasks will be her',
                          items: AppCubit.get(context).tasks,
                        ),
                        ListOfTasks(
                          text: 'Your Completed Tasks will be her',
                          items: AppCubit.get(context).completedTasks,
                        ),
                        ListOfTasks(
                          text: 'Your  UnCompleted Tasks will be her',
                          items: AppCubit.get(context).unCompletedTasks,
                        ),
                        ListOfTasks(
                          text: 'Your Favorite Tasks will be her',
                          items: AppCubit.get(context).favoriteTasks,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize! * 2.8,
                        vertical: SizeConfig.defaultSize! * 2),
                    child: MainButton(
                      text: 'Add a task',
                      onTap: () => Navigator.pushNamed(
                          context, AppRoutes.addTaskScreenRoute),
                    ))
              ]),
            ));
      },
    );
  }
}
