import 'package:flutter/material.dart';
import 'package:to_do/utilities/size.dart';

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black,
          fontSize: SizeConfig.defaultSize! * 2.2,
          fontWeight: FontWeight.w500),
    );
  }
}
