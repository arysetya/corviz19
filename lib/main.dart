import 'package:corviz/pages/indocorona.dart';
import 'package:corviz/pages/infocorona.dart';
import 'package:corviz/pages/infocoronadunia.dart';
import 'package:corviz/pages/pusatbantuan.dart';
import 'package:corviz/pages/tentang.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  Future main() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(new MyApp());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return indoCorona();
      case 1:
        return infoCoronadunia();
      case 2:
        return infoCorona();
      case 3:
        return pusatBantuan();
      case 4:
        return tentangDevelop();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: callPage(_currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (value) {
              _currentIndex = value;

              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.flag,
                  size: 35,
                ),
                title: Text("Indonesia"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.language,
                  size: 35,
                ),
                title: Text("World"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_hospital,
                  size: 35,
                ),
                title: Text("Info"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_phone,
                  size: 35,
                ),
                title: Text("Bantuan"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_box,
                  size: 35,
                ),
                title: Text("Tentang"),
              ),
            ],
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.blueAccent,
          ),
        ));
  }
}
