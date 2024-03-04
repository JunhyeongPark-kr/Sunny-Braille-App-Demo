import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sunny_braille_apk/pages/home.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});
  Future<void> _showFilePicker(BuildContext context) async {
    List<String> files = ['0070번.brf', '0070번.txt', '0070번.pdf'];

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose a file'),
          content: Container(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: files.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(files[index]),
                  onTap: () {
                    _downloadFile(context, files[index]);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _downloadFile(BuildContext context, String fileName) async {
    final byteData = await rootBundle.load('assets/converted/$fileName');
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(byteData.buffer.asUint8List());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$fileName downloaded successfully')),
    );
  }

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
              children: const [
                Text(
                  '파일 변환 완료!',
                  style: TextStyle(
                    color: Color(0xFF1F2024),
                    fontSize: 30,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Image(
                  image: AssetImage('assets/icons/complete.png'),
                  width: 90,
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    '파일이 성공적으로 변환되었습니다.\n\n파일을 선택하고 다운로드하려면 아래 끝의 버튼을 눌러주세요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1F2024),
                      fontSize: 15,
                      fontFamily: 'Pretendard',
                    ),
                  ),
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
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => _showFilePicker(context),
          child: Text('Download File'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xffFF6B40),
          ),
        ),
      ),
    );
  }
}
