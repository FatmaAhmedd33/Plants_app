import 'package:flower_app/shared/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({this.ontap,super.key, required this.text});
  final String text;
  VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap ,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kColorButtom,
          borderRadius: BorderRadius.circular(10),
        ),
        child:  Center(
            child: Text(
          text,
          style: const TextStyle(fontSize: 23),
        )),
      ),
    );
  }
}
