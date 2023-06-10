import 'package:alt_access/styling/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String imageSrc;
  final VoidCallback press;

  const RoundedButton({Key? key, required this.imageSrc, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.only(
            top: Constants.appPadding, bottom: Constants.appPadding / 2),
        child: Container(
          padding: EdgeInsets.all(Constants.appPadding / 2),
          width: 65,
          height: 65,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Constants.darkPrimary,
                    Constants.lightPrimary,
                  ]),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(3, 3),
                  spreadRadius: 1,
                  blurRadius: 4,
                  color: Constants.darkShadow,
                ),
                BoxShadow(
                  offset: const Offset(-5, -5),
                  spreadRadius: 1,
                  blurRadius: 4,
                  color: Constants.lightShadow,
                ),
              ]),
          child: Image.asset(imageSrc),
        ),
      ),
    );
  }
}
