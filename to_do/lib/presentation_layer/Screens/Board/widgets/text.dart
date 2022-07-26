import 'package:flutter/material.dart';
import 'package:to_do/Bussiness_Layer/cubit.dart';
import 'package:to_do/utilities/size.dart';

class SharedText extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback onTap;
  const SharedText(
      {Key? key, required this.index, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(text,
              style: AppCubit.get(context).indexOfList == index
                  ? TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.defaultSize! * 1.8)
                  : TextStyle(
                      color: Colors.grey[500],
                      fontSize: SizeConfig.defaultSize! * 1.8)),
        ));
  }
}
