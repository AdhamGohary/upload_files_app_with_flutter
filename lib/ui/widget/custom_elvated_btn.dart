import 'package:flutter/material.dart';
import 'package:upload_files/utils/const_functions/size_functions.dart';

class CustomElvatedBtn extends StatelessWidget {
  final void Function()? function;
  final MaterialStateProperty<Color?>? backgroudColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final String txt;
  const CustomElvatedBtn(
      {super.key,
      required this.function,
      required this.txt,
      required this.backgroudColor,
      required this.overlayColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
          backgroundColor: backgroudColor,
          overlayColor: overlayColor,
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(0.05 * getWidth(context: context)),
              side: BorderSide(
                  color: Colors.blueGrey,
                  width: 0.0008 * getWidth(context: context))))),
      child: Text(
        txt,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
