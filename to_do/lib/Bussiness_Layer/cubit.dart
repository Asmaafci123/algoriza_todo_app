import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do/Bussiness_Layer/states.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:to_do/utilities/colors.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int indexOfList = 0;
  void changeIndexOfList(int index) {
    indexOfList = index;
    emit(ChangeIndexOfTaskState());
  }

  late Database database;

  void initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'todo.db');

    openAppDatabase(
      path: path,
    );

    emit(AppDatabaseInitializedState());
  }

  void openAppDatabase({
    required String path,
  }) async {
    openDatabase(
      path,
      version: 2,
      onCreate: (Database db, int version) async {
        db
            .execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT,date TEXT,startTime TEXT,endTime TEXT,reminde TEXT,repeat TEXT,status TEXT,favorite TEXT)', // sql statement
        )
            .then((value) {
          emit(TasksTableCreatedState());
        }).catchError((error) {
          emit(ErrorTasksTableCreatedState());
        });
      },
      onOpen: (Database db) {
        database = db;
        getAllTasks();
        emit(TasksTableOpenedState());
      },
    );
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  var reminderList = [
    "5 minutes early",
    "10 minutes early",
    "15 minutes early",
  ];
  var repeatList = [
    "Daily",
    "Weekly",
    "Monthly",
  ];
  String reminderTime = "5 minutes early";

  String repeatTime = "Daily";
  void insertUserData() async {
    int id = await database.transaction((txn) async {
      return txn.rawInsert(
          'INSERT INTO tasks(title,date,startTime,endTime,reminde,repeat,status,favorite) VALUES("${titleController.text}","${dateController.text}","${startTimeController.text}","${endTimeController.text}","$reminderTime","$repeatTime","new","0")');
    });
  }

  List<Map> tasks = [];
  List<Map> completedTasks = [];
  List<Map> unCompletedTasks = [];
  List<Map> favoriteTasks = [];
  void getAllTasks() async {
    completedTasks = [];
    unCompletedTasks = [];
    favoriteTasks = [];
    emit(LoadingGetTasksState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      tasks = value;
      tasks.forEach((element) {
        if (element['favorite'] == '1') {
          favoriteTasks.add(element);
        }
        if (element['status'] == 'complete') {
          completedTasks.add(element);
        } else {
          unCompletedTasks.add(element);
        }
      });
      emit(SuccessGetTasksState());
    });
  }

  List<Color> textDayColors = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  List<Color> dayColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  List<String> daysName = [];
  List<String> datesOf7 = [];
  int choosenDayIndex = 0;

  void changeDayColors(int index) {
    choosenDayIndex = index;
    for (int i = 0; i < 7; i++) {
      if (i == index) {
        dayColors[i] = KMainColor;
        textDayColors[i] = Colors.white;
      } else {
        dayColors[i] = Colors.white;
        textDayColors[i] = Colors.black;
      }
    }
    emit(ChangeTextDayColorState());
  }

  List<Map> tasksOfSomeDate = [];
  void tasksOfDate(DateTime date) {
    tasksOfSomeDate = [];
    String d = DateFormat('y - d - MM').format(date);
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i]['date'] == d) {
        tasksOfSomeDate.add(tasks[i]);
      }
    }
  }

  void update({required String status, required int id}) async {
    await database.rawUpdate(
        'UPDATE tasks SET status=? WHERE id=?', [status, id]).then((value) {
      emit(UpdateTaskState());
    });
  }

  void updateFavorite({required String favorite, required int id}) async {
    await database.rawUpdate(
        'UPDATE tasks SET favorite=? WHERE id=?', [favorite, id]).then((value) {
      emit(UpdateFavoriteTaskState());
    });
  }

  bool checkBoxStatus = false;
  void changeCheckBoxStatus(bool x) {
    checkBoxStatus = x;
    emit(ChangeCheckBoxStatusState());
  }

  bool fav = false;
  void changeFavStatus() {
    fav = !fav;
    emit(ChangeFavStatusState());
  }
}
