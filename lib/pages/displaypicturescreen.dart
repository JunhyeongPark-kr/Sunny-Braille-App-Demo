import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_to_pdf_converter/image_to_pdf_converter.dart';
import 'downloadpage.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final VoidCallback onGoBack;

  DisplayPictureScreen({required this.imagePath, required this.onGoBack});

  Future<void> convertImageToPdfAndNavigate(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Converting to BRF..."),
              ],
            ),
          ),
        );
      },
    );

    await Future.delayed(Duration(seconds: 10));

    final File imageFile = File(imagePath);
    final File pdfFile = await ImageToPdf.imageList(listOfFiles: [imageFile]);

    final directory = await getApplicationDocumentsDirectory();
    final String newPath = '${directory.path}/converted_file.pdf';
    await pdfFile.rename(newPath);

    Navigator.of(context).pop();

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DownloadPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Container(
            color: Color(0xffF0EAE0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 350,
                height: 250,
                margin: EdgeInsets.only(top: 50),
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ]),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => convertImageToPdfAndNavigate(context),
          child: Text('Convert Now'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xffFF6B40),
          ),
        ),
      ),
    );
  }
}
