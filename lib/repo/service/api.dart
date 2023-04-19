import 'dart:convert';
import 'package:upload_files/model/file.dart';
import 'package:upload_files/repo/file_repo.dart';
import 'package:http/http.dart' as http;
import 'package:upload_files/utils/const_functions/print.dart';
import 'package:upload_files/utils/constants/strings.dart';

class Api extends FileRepo {
  @override
  Future<void> addFile(File file) async {
    checkDebugMode('from api file 4 $file');

    try {
      await http.post(Uri.parse('$url/add'),
          headers: {"content-type": "application/json"},
          body: jsonEncode(file.toJson()));
    } catch (e) {
      checkDebugMode(e);
    }
  }
}
