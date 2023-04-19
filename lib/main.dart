import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upload_files/repo/service/api.dart';
import 'package:upload_files/responsive/responsive.dart';
import 'package:upload_files/view_model/file_view_model/file_view_model.dart';

void main() {
  runApp(const MyApp());
  Provider.debugCheckInvalidValueType = null;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FileViewModel>(
            create: (context) => FileViewModel(fileRepo: Api()))
      ],
      child: const MaterialApp(
        home: Responsive(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
