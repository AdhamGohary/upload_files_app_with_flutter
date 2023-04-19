import 'package:flutter/cupertino.dart';
import 'package:upload_files/model/file.dart';
import 'package:upload_files/repo/file_repo.dart';
import 'package:upload_files/utils/const_functions/print.dart';

class FileViewModel extends ChangeNotifier {
  late FileRepo fileRepo;
  String? filePath;
  FileViewModel({required this.fileRepo});
  Future<void> addFile(File file) async {
    checkDebugMode('from file view model 3 $filePath');

    await fileRepo.addFile(file);
    notifyListeners();
  }
}
