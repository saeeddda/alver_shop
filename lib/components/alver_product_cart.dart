import 'dart:developer';

import 'package:alver_shop/components/alver_product_add_to_cart.dart';
import 'package:alver_shop/constants/colors.dart';
import 'package:alver_shop/constants/fonts.dart';
import 'package:alver_shop/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AlverProductCartItem extends StatefulWidget {
  const AlverProductCartItem({
    Key? key,
    required this.itemIndex,
    required this.title,
    required this.price,
    required this.image,
    this.width = 150.0,
    this.height = 230.0,
    required this.onPress,
  }) : super(key: key);

  final int itemIndex;
  final String title;
  final String price;
  final String image;
  final double width;
  final double height;
  final VoidCallback onPress;

  @override
  State<AlverProductCartItem> createState() => _AlverProductCartItemState();
}

class _AlverProductCartItemState extends State<AlverProductCartItem> {
  bool _isHeart = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      borderRadius: const BorderRadius.all(Radius.circular(defaultRadius)),
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: cartColor,
            borderRadius: BorderRadius.circular(defaultRadius),
            boxShadow: [cartShadow],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      if (_isHeart) {
                        _isHeart = false;
                        log(
                          'item ${widget.itemIndex} is removed from wishlist',
                          name: 'Cart Item',
                        );
                      } else {
                        _isHeart = true;
                        log(
                          'item ${widget.itemIndex} is added to wishlist',
                          name: 'Cart Item',
                        );
                      }
                    });
                  },
                  icon: Icon(
                    _isHeart ? Iconsax.heart5 : Iconsax.heart,
                    color: _isHeart ? redColor : disableColor,
                  ),
                ),
              ),
              Image.asset(widget.image, width: 80.0),
              Text(widget.title, style: header3Text),
              Text(widget.price, style: normalText),
              AlverAddToCart(itemIndex: widget.itemIndex),
              const SizedBox(height: defaultPadding / 2),
            ],
          ),
        ),
      ),
    );
  }
}
