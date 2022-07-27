import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/Bussiness_Layer/cubit.dart';
import 'package:to_do/models/notification_model.dart';
import 'package:to_do/presentation_layer/Screens/Board/board_screen.dart';
import 'package:to_do/utilities/router.dart';
import 'package:to_do/utilities/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotifications()
      .initialize('resource://drawable/res_notification_app_icon', [
    NotificationChannel(
        channelKey: 'schedule_tasks',
        channelName: 'Schedule Tasks',
        channelDescription: 'Schedule Tasks',
        defaultColor: Colors.green,
        importance: NotificationImportance.Max,
        channelShowBadge: true)
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..initDatabase()
        ..changeDayColors(0)
        ..onCreateNotification(TaskNotificationModel(
            id: Random().nextInt(2147483647), dateTime: DateTime.now())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.boardScreenRoute,
        home: BoardingScreen(),
      ),
    );
  }
}
