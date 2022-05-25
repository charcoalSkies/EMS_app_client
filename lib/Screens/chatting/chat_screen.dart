import 'package:flutter/material.dart';
import 'package:rf_radar_03/Utilities/routes.dart';
import 'package:rf_radar_03/components/solid.dart';
import 'package:rf_radar_03/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rf_radar_03/components/icons_svg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var _selectedIndex = 0; // 언더바(_)를 붙이면 내부 클래스 밖에 사용 불가능

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('시흥소방서'),
        backgroundColor: rf_BlackColor,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.white,
          ),
        ],
      ),
      bottomNavigationBar: rf_BottomNaviBar(),
      resizeToAvoidBottomInset: false, // 위젯의 크기가 범위를 벗어나 오류 발생 -> 제거
    );
  }

  BottomNavigationBar rf_BottomNaviBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // bar의 형태를 고치기 위한 코드
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value; // Tap하는 label을 index로 반환
        }); // build가 Tap할 떄 마다 재실행 되게끔 함

        print("value : ${value}");
      },
      showSelectedLabels: false, // 선택된 라벨의 이름 지우기
      showUnselectedLabels: false, // 선택되지 않은 라벨의 이름 지우기
      backgroundColor: rf_BlackColor,
      selectedItemColor: Colors.red,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconLocation,
            height: 25,
            color: Colors.grey,
          ),
          activeIcon: SvgPicture.asset(
            iconLocation,
            height: 25,
            color: rf_RedColor,
          ),
          label: 'Location',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconChat,
            height: 25,
            color: Colors.grey,
          ),
          activeIcon: SvgPicture.asset(
            iconChat,
            height: 25,
            color: rf_RedColor,
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconDrone,
            height: 25,
            color: Colors.grey,
          ),
          activeIcon: SvgPicture.asset(
            iconDrone,
            height: 25,
            color: rf_RedColor,
          ),
          label: 'Drone',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconSiren,
            height: 25,
            color: Colors.grey,
          ),
          activeIcon: SvgPicture.asset(
            iconSiren,
            height: 25,
            color: rf_RedColor,
          ),
          label: 'Siren',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconEtc,
            height: 25,
            color: Colors.grey,
          ),
          activeIcon: SvgPicture.asset(
            iconEtc,
            height: 25,
            color: Colors.red,
          ),
          label: 'Etc',
        ),
      ],
    );
  }
}
