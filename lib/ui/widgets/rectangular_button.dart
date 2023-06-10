import 'package:alt_access/styling/constants.dart';
import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const RectangularButton({Key? key, required this.text, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.only(
            top: Constants.appPadding, bottom: Constants.appPadding / 2),
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
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
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
