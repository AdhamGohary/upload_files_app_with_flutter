// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/cupertino.dart';
import 'package:upload_files/ui/screen/desktop_or_web_screen/desktop_or_web_screen.dart';
import 'package:upload_files/ui/screen/mobile_screen/mobile_screen.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext, BoxConstraints) =>
            BoxConstraints.maxWidth >= 650
                ? const DesktopOrWebScreen()
                : const MobileScreen());
  }
}
