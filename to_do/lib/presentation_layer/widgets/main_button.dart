import 'package:flutter/material.dart';
import 'package:to_do/utilities/colors.dart';
import 'package:to_do/utilities/size.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const MainButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: SizeConfig.defaultSize! * 5,
        width: double.infinity,
        decoration: BoxDecoration(
            color: KMainColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: SizeConfig.defaultSize! * 2.2),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
