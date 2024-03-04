// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'convertcompleted.dart';
import 'convertpage.dart';
import 'package:file_picker/file_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  void selectAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConvertCompleted(selectedFile: file),
        ),
      );
    } else {}
  }
  /*void handleTap() {
    // Define what happens when the InkWell is tapped
    print('InkWell tapped!');
    // Add your logic here
  }*/

  Widget _bodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            color: Color(0xffF0EAE0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '파일 변환하기',
                  style: TextStyle(
                    color: Color(0xFF1F2024),
                    fontSize: 30,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Image(
                  image: AssetImage('assets/icons/uploadfile.png'),
                  width: 50,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'PDF 형식의 파일을 업로드해주세요',
                  style: TextStyle(
                    color: Color(0xFF1F2024),
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: selectAndUploadFile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1F2024),
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Text('파일 업로드하기'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }
}
