import 'package:flutter/material.dart';
import 'package:to_do/presentation_layer/Screens/Add_Task/add_task_screen.dart';
import 'package:to_do/presentation_layer/Screens/Board/board_screen.dart';
import 'package:to_do/presentation_layer/Screens/schedual/schedual_screen.dart';
import 'package:to_do/utilities/routes.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.addTaskScreenRoute:
      return MaterialPageRoute(builder: (_) => const AddTaskScreen());
    case AppRoutes.scheduleScreenRoute:
      return MaterialPageRoute(builder: (_) => const SchedualScreen());
    default:
      return MaterialPageRoute(builder: (_) => const BoardingScreen());
  }
}
