import 'dart:developer';

import 'package:alver_shop/components/alver_button.dart';
import 'package:alver_shop/components/alver_minus_plus_button.dart';
import 'package:alver_shop/constants/colors.dart';
import 'package:flutter/material.dart';

class AlverAddToCart extends StatefulWidget {
  const AlverAddToCart({
    Key? key,
    required this.itemIndex,
  }) : super(key: key);

  final int itemIndex;

  @override
  State<AlverAddToCart> createState() => _AlverAddToCartState();
}

class _AlverAddToCartState extends State<AlverAddToCart> {
  bool _isAddToCart = false;
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return !_isAddToCart
        ? AlverButton(
            child: const Text('ADD'),
            bgColor: mainColor,
            frColor: Colors.white,
            onPressed: () {
              setState(() {
                _isAddToCart = true;
                log(
                  'item ${widget.itemIndex} value is added to cart',
                  name: 'Cart Item',
                );
              });
            },
          )
        : AlverMinusPlusButton(
            value: _value.toString(),
            minusBGColor: Colors.white,
            minusFRColor: mainColor,
            plusBGColor: mainColor,
            plusFRColor: Colors.white,
            onMinusPressed: () {
              setState(() {
                if (_value != 1) {
                  _value--;
                  log(
                    'item ${widget.itemIndex} value is $_value',
                    name: 'Cart Item',
                  );
                }
              });
            },
            onPlusPressed: () {
              setState(() {
                _value++;
                log(
                  'item ${widget.itemIndex} value is $_value',
                  name: 'Cart Item',
                );
              });
            },
          );
  }
}
