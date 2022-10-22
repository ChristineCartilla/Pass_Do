import 'package:flutter/material.dart';

class WelBackground extends StatelessWidget {
  final Widget child;
  const WelBackground({
    key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size bodySize = MediaQuery.of(context).size;
    return SizedBox(
      height: bodySize.height,
      width: double.infinity,
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Positioned(
          top: 70,
          left: 0,
          child: Image.asset(
            "assets/images/Heading.png",
            width: bodySize.width * 0.5,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: bodySize.height * 0.5),
          height: 400,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(70),
              )),
        ),
        child,
      ]),
    );
  }
}
