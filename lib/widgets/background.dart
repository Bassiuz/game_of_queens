import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/background.svg',
      semanticsLabel: 'Background',
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}
