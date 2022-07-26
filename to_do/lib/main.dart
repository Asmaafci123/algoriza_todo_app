import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/Bussiness_Layer/cubit.dart';
import 'package:to_do/presentation_layer/Screens/Board/board_screen.dart';
import 'package:to_do/utilities/router.dart';
import 'package:to_do/utilities/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..initDatabase()
        ..changeDayColors(0),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.boardScreenRoute,
        home: BoardingScreen(),
      ),
    );
  }
}
