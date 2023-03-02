import 'package:flutter/material.dart';
import 'package:task6/pages/audio_pages.dart';
import 'package:task6/pages/video_pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectIndex = 0;

  void _onItemPadd(int index){
    setState(() {
      _selectIndex = index;
    });
  }

  static const List<Widget> selectBody = [
    VideoPage(),
    AudioPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Youtube"),
      ),
      body: Center(
        child: selectBody.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectIndex,
        onTap: _onItemPadd,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              label: "Video",
              icon: Icon(Icons.video_camera_back_rounded)
          ),
          BottomNavigationBarItem(
              label: "Music",
              icon: Icon(Icons.surround_sound)
          ),
        ],
      ),
    );
  }
}
