import 'package:flutter/material.dart';
import 'package:rf_radar_03/Utilities/routes.dart';
import 'package:rf_radar_03/components/solid.dart';
import 'package:rf_radar_03/constants.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false, // 위젯의 크기가 범위를 벗어나 오류 발생 -> 제거
      bottomNavigationBar: Row(),
      body: Solid(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[],
      )),
    );
  }
}
