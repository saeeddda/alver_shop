import 'package:alver_shop/constants/size.dart';
import 'package:flutter/material.dart';

class AlverButton extends StatelessWidget {
  const AlverButton({
    Key? key,
    required this.child,
    required this.bgColor,
    required this.frColor,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final Color bgColor;
  final Color frColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
        foregroundColor: MaterialStateProperty.all(frColor),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius / 2),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(defaultPadding * 7, defaultPadding * 2.2),
        ),
      ),
    );
  }
}
