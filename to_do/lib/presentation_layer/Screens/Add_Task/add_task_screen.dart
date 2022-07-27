import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do/Bussiness_Layer/cubit.dart';
import 'package:to_do/Bussiness_Layer/states.dart';
import 'package:to_do/presentation_layer/Screens/Add_Task/widgets/dropdownbutton.dart';
import 'package:to_do/presentation_layer/Screens/Add_Task/widgets/header_text.dart';
import 'package:to_do/presentation_layer/Screens/Add_Task/widgets/inpute_field.dart';
import 'package:to_do/presentation_layer/widgets/main_button.dart';
import 'package:to_do/utilities/size.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime _date = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
              'Add task',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: SizeConfig.defaultSize! * 2.2,
                  fontWeight: FontWeight.w500),
            ),
            centerTitle: false,
            titleSpacing: 0,
            elevation: 1,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.defaultSize! * 1.8,
                  SizeConfig.defaultSize! * 1.8,
                  SizeConfig.defaultSize! * 1.8,
                  0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderText(
                      text: 'Title',
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize!,
                    ),
                    InputField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Title field is empty';
                        }
                        return null;
                      },
                      hintText: 'Design team meeting',
                      controller: AppCubit.get(context).titleController,
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2.3,
                    ),
                    const HeaderText(
                      text: 'Date',
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize!,
                    ),
                    InputField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Date field is empty';
                        }
                        return null;
                      },
                      controller: AppCubit.get(context).dateController,
                      hintText: DateFormat('y - MM - d').format(_date),
                      suffixIcon: Icons.keyboard_arrow_down_outlined,
                      onPressedSuffix: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2024),
                        ).then((value) {
                          setState(() {
                            String dateformatted =
                                DateFormat('y - d - MM').format(value!);
                            AppCubit.get(context).dateController.text =
                                dateformatted;
                          });
                        });
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2.3,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeaderText(
                                text: 'Start Time',
                              ),
                              SizedBox(
                                height: SizeConfig.defaultSize!,
                              ),
                              InputField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Start time field is empty';
                                    }
                                    return null;
                                  },
                                  controller:
                                      AppCubit.get(context).startTimeController,
                                  hintText: _startTime.format(context),
                                  suffixIcon: Icons.watch_later_outlined,
                                  onPressedSuffix: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) {
                                      setState(() {
                                        AppCubit.get(context)
                                            .startTimeController
                                            .text = value!.format(context);
                                      });
                                    });
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.defaultSize! * 1.5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeaderText(
                                text: 'End Date',
                              ),
                              SizedBox(
                                height: SizeConfig.defaultSize!,
                              ),
                              InputField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'End time field is empty';
                                    }
                                    return null;
                                  },
                                  controller:
                                      AppCubit.get(context).endTimeController,
                                  hintText: _endTime.format(context),
                                  suffixIcon: Icons.watch_later_outlined,
                                  onPressedSuffix: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) {
                                      setState(() {
                                        AppCubit.get(context)
                                            .endTimeController
                                            .text = value!.format(context);
                                      });
                                    });
                                  }),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2.3,
                    ),
                    const HeaderText(
                      text: 'Reminde',
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize!,
                    ),
                    DropDownButtonField(
                        items: AppCubit.get(context).reminderList,
                        value: AppCubit.get(context).reminderTime),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2.3,
                    ),
                    Text(
                      'Repeat',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.defaultSize! * 2.2,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize!,
                    ),
                    DropDownButtonField(
                      items: AppCubit.get(context).repeatList,
                      value: AppCubit.get(context).repeatTime,
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 5,
                    ),
                    MainButton(
                      text: 'Create a task',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          AppCubit.get(context).insertUserData();
                          AppCubit.get(context)..getAllTasks();
                          Navigator.pop(context);
                        }
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
