import 'package:flutter/material.dart';
import 'package:sunny_braille_apk/pages/camerascreen.dart';
import 'package:sunny_braille_apk/pages/uploadpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('click');
        },
        child: Row(
          children: [
            Image.asset(
              'assets/icons/bannerlogo.ico',
              width: 25,
              height: 25,
              color: Color(0xFF1F2024),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'SUNNY',
                  style: TextStyle(fontSize: 10, color: Color(0xFF1F2024)),
                ),
                Text('BRAILLE',
                    style: TextStyle(fontSize: 10, color: Color(0xFF1F2024))),
              ],
            )
          ],
        ),
      ),
      elevation: 1,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
      ],
    );
  }*/

  Widget _bodyWidget() {
    return Column(
      children: [
        Container(
          height: 400,
          color: Color(0xffFF6B40),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 130,
                ),
                child: Text(
                  'SUNNY BRAILLE',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: -100,
                      right: -100,
                      child: Image.asset(
                        'assets/icons/bannerlogo.ico',
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Color(0xffF0EAE0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '원하는 교육 자료 파일을 Sunny Braille에 업로드해 점자로 변환해보세요.\n변환된 파일을 다운로드해 점자정보단말기에 읽힐 수 있습니다.',
                        style: TextStyle(fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CameraScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff1F2024),
                          splashFactory: NoSplash.splashFactory,
                        ),
                        child: Text('CONVERT TO BRF'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
