import 'package:flutter/material.dart';
import 'package:to_do/Bussiness_Layer/cubit.dart';
import 'package:to_do/utilities/colors.dart';
import 'package:to_do/utilities/size.dart';

class Task extends StatelessWidget {
  final Map item;
  const Task({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            activeColor: KMainColor,
            value: AppCubit.get(context).checkBoxStatus,
            onChanged: (x) {
              AppCubit.get(context).changeCheckBoxStatus(x!);
              AppCubit.get(context).checkBoxStatus == true
                  ? AppCubit.get(context)
                      .update(status: 'complete', id: item['id'])
                  : AppCubit.get(context).update(status: 'new', id: item['id']);
              AppCubit.get(context).getAllTasks();
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        Text(
          item['title'],
          style: TextStyle(
              color: Colors.black, fontSize: SizeConfig.defaultSize! * 1.7),
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  AppCubit.get(context).delete(id: item['id']);
                },
                icon: const Icon(Icons.delete),
                color: Colors.red),
            IconButton(
                onPressed: () {
                  AppCubit.get(context).changeFavStatus();

                  AppCubit.get(context).fav == false
                      ? AppCubit.get(context)
                          .updateFavorite(favorite: "0", id: item['id'])
                      : AppCubit.get(context)
                          .updateFavorite(favorite: "1", id: item['id']);
                  AppCubit.get(context).getAllTasks();
                },
                icon: item['favorite'] == '0'
                    ? Image(
                        height: SizeConfig.defaultSize! * 2.5,
                        image: const AssetImage(
                          'assets/icons/dislike.png',
                        ),
                      )
                    : Image(
                        height: SizeConfig.defaultSize! * 2.5,
                        image: const AssetImage(
                          'assets/icons/like.png',
                        ),
                      )),
          ],
        )
      ],
    );
  }
}
