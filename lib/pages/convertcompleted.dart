import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ConvertCompleted extends StatelessWidget {
  final PlatformFile selectedFile;

  ConvertCompleted({super.key, required this.selectedFile});

  Widget _bodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            color: Color(0xffF0EAE0),
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
