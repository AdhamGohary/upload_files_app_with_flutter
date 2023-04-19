import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:upload_files/model/file.dart';
import 'package:upload_files/utils/const_functions/print.dart';
import 'package:upload_files/utils/const_functions/view_dialog.dart';
import 'package:upload_files/view_model/file_view_model/file_view_model.dart';

uploadBtnFunction({required String? filePath, required BuildContext context}) {
  checkDebugMode('from first screen function file 2 $filePath');

  context.read<FileViewModel>().addFile(File(filePath: filePath));
  Provider.of<FileViewModel>(context, listen: false).filePath = 'file path';
  viewDialog(
    context: context,
    title: 'عملية ناجحة ',
    content: 'تم إرسال البيانات بنجاح',
    dialogType: DialogType.success,
    btnOkTxt: 'Ok',
    btnCancelTxt: 'Cancel',
    btnOkFunc: () => Navigator.of(context).pop(),
    btnCancelFunc: () => Navigator.of(context).pop(),
  );
}
