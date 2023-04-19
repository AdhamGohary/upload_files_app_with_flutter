import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upload_files/ui/screen/mobile_screen/first_screen/first_screen_functions/first_screen_functions.dart';
import 'package:upload_files/ui/widget/custom_elvated_btn.dart';
import 'package:upload_files/utils/const_functions/print.dart';
import 'package:upload_files/utils/const_functions/size_functions.dart';
import 'package:upload_files/view_model/file_view_model/file_view_model.dart';

// ignore: must_be_immutable
class FirstScreen extends StatefulWidget with ChangeNotifier {
  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    Provider.of<FileViewModel>(context, listen: false).filePath = 'file path';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '*Run As Mobile App*',
          style: TextStyle(
              fontSize: 0.05 * getWidth(context: context), color: Colors.red),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 0.05 * getHeight(context: context),
                bottom: 0.07 * getHeight(context: context)),
            child: Center(
              child: Text(
                'Send File From Your \n     App To Your Api ',
                style: TextStyle(
                    fontSize: 0.1 * getWidth(context: context),
                    color: Colors.red),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 0.05 * getHeight(context: context),
                left: 0.05 * getWidth(context: context),
                bottom: 0.01 * getHeight(context: context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomElvatedBtn(
                    backgroudColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    txt: 'choose file',
                    function: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        setState(() {
                          Provider.of<FileViewModel>(context, listen: false)
                              .filePath = result.files.single.name;
                          checkDebugMode(result);
                        });
                      }
                    }),
                Container(
                  width: 0.6 * getWidth(context: context),
                  height: 0.05 * getHeight(context: context),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(
                          color: Colors.blueGrey,
                          width: 0.008 * getWidth(context: context)),
                      borderRadius: BorderRadius.circular(
                          0.1 * getWidth(context: context))),
                  child: Selector<FileViewModel, String?>(
                    selector: (context, fileViewModel) =>
                        fileViewModel.filePath,
                    builder: (context, value, _) => Center(
                        child: Text(
                      value!,
                      maxLines: 1,
                    )),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 0.3 * getWidth(context: context)),
            child: CustomElvatedBtn(
                txt: ' upload file',
                backgroudColor:
                    Provider.of<FileViewModel>(context).filePath == 'file path'
                        ? MaterialStateProperty.all<Color>(Colors.grey)
                        : MaterialStateProperty.all<Color>(Colors.black),
                overlayColor: MaterialStateProperty.all<Color>(Colors.grey),
                function: () => setState(() {
                      uploadBtnFunction(
                          filePath:
                              Provider.of<FileViewModel>(context, listen: false)
                                  .filePath,
                          context: context);
                    })),
          )
        ],
      ),
    );
  }
}
