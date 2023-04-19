import 'package:upload_files/utils/const_functions/print.dart';

class File {
  String? filePath;
  File({required this.filePath});
  factory File.fromJson(Map<String, dynamic> json) {
    return File(filePath: json['filePath']);
  }

  Map<String, dynamic> toJson() {
    checkDebugMode('from filemodel file 5 $filePath');

    return {"filePath": filePath};
  }
}
