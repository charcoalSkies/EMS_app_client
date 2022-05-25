import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("assets/images/vector.png",
                width: size.width * 1.0,
                color: Colors.white.withOpacity(0.3), // 30% 투명도 적용
                colorBlendMode: BlendMode.modulate),
          ),
          child
        ],
      ),
    );
  }
}
