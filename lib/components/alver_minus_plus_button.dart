import 'package:alver_shop/constants/fonts.dart';
import 'package:alver_shop/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AlverMinusPlusButton extends StatelessWidget {
  const AlverMinusPlusButton({
    Key? key,
    required this.value,
    required this.plusBGColor,
    required this.plusFRColor,
    required this.minusBGColor,
    required this.minusFRColor,
    required this.onPlusPressed,
    required this.onMinusPressed,
  }) : super(key: key);

  final String value;
  final Color plusBGColor;
  final Color plusFRColor;
  final Color minusBGColor;
  final Color minusFRColor;
  final VoidCallback onPlusPressed;
  final VoidCallback onMinusPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: onMinusPressed,
            child: const Icon(Iconsax.minus),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(minusBGColor),
              foregroundColor: MaterialStateProperty.all(minusFRColor),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              side: MaterialStateProperty.all(
                  BorderSide(color: minusFRColor, width: 2.0)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius / 2)),
              ),
              minimumSize: MaterialStateProperty.all(
                const Size(defaultPadding / 2, defaultPadding / 2),
              ),
            ),
          ),
          SizedBox(
            width: 30.0,
            child: Text(value, style: header3Text, textAlign: TextAlign.center),
          ),
          TextButton(
            onPressed: onPlusPressed,
            child: const Icon(Iconsax.add),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(plusBGColor),
              foregroundColor: MaterialStateProperty.all(plusFRColor),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius / 2)),
              ),
              minimumSize: MaterialStateProperty.all(
                  const Size(defaultPadding / 2, defaultPadding / 2)),
            ),
          ),
        ],
      ),
    );
  }
}
