import 'package:alver_shop/constants/fonts.dart';
import 'package:alver_shop/constants/size.dart';
import 'package:flutter/material.dart';

class AlverTitle extends StatelessWidget {
  const AlverTitle({
    Key? key,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String buttonTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        defaultPadding,
        defaultPadding / 4,
        defaultPadding,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: header2Text),
          TextButton(
            onPressed: onPressed,
            child: Text(buttonTitle, style: header4Text),
          ),
        ],
      ),
    );
  }
}
