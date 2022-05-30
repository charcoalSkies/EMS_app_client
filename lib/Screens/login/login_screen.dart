import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rf_radar_03/Screens/chatting/chat_screen.dart';
import 'package:rf_radar_03/Utilities/routes.dart';
import 'package:rf_radar_03/components/background.dart';
import 'package:rf_radar_03/constants.dart';
import 'package:rf_radar_03/components/icons_svg.dart';
import 'dio_server.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool _isObscure = true;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String _url = "http://10.0.2.2:8000/login";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false, // 위젯의 크기가 범위를 벗어나 오류 발생 -> 제거
      body: Background(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/emblem.png',
            width: size.width * 0.7,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: const Text(
              "로그인",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffffffff),
                  fontSize: 24),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
              height: 60,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _usernameController,
                style: const TextStyle(color: rf_WhiteColor),
                decoration: const InputDecoration(
                    labelText: "소방청 통합 계정",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: rf_BorderColor),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    labelStyle: TextStyle(color: rf_GrayColor, fontSize: 16)),
              )),
          SizedBox(height: size.height * 0.015),
          Container(
              height: 60,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                obscureText: _isObscure,
                controller: _passwordController,
                style: const TextStyle(color: rf_WhiteColor),
                decoration: InputDecoration(
                    labelText: "비밀번호",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: rf_BorderColor),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    labelStyle:
                        const TextStyle(color: rf_GrayColor, fontSize: 16)),
              )),
          SizedBox(height: size.height * 0.1),
          Container(
              height: 60,
              width: 400,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                  child: const Text(
                    '로그인',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                        fontSize: 20),
                  ),
                  onPressed: () async {
                    print(_usernameController);
                    print(_passwordController);
                    var data = {
                      "id": _usernameController.text,
                      "pw": _passwordController.text
                    };
                    var body = json.encode(data);
                    http.Response _res = await http.post(Uri.parse(_url),
                        headers: {"Content-Type": "application/json"},
                        body: body);

                    print(_res.statusCode);
                    print(_res.body);
                    // server.postReq(
                    //    _usernameController.text, _passwordController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatScreen()),
                    );
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      rf_RedColor,
                    ),
                  ))),
        ],
      )),
    );
  }
}
