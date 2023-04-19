import 'package:upload_files/model/file.dart';

abstract class FileRepo {
  Future<void> addFile(File file);
}
