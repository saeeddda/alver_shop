import 'dart:developer';

import 'package:alver_shop/constants/colors.dart';
import 'package:alver_shop/constants/fonts.dart';
import 'package:alver_shop/constants/size.dart';
import 'package:alver_shop/data/demo_salad_data.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AlverProductCarouselOne extends StatefulWidget {
  const AlverProductCarouselOne({
    Key? key,
  }) : super(key: key);

  @override
  State<AlverProductCarouselOne> createState() =>
      _AlverProductCarouselOneState();
}

class _AlverProductCarouselOneState extends State<AlverProductCarouselOne> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding,
        ),
        child: Row(
          children: List.generate(saladData.length, (index) {
            return AlverProductCarouselOneItem(
              title: saladData['salad_$index']['name'],
              price: "\$" + saladData['salad_$index']['price'],
              image: Image.asset(saladData['salad_$index']['image']),
              onPressed: () {
                setState(() {
                  log('carousel item $index clicked!', name: 'test');
                });
              },
            );
          }),
        ),
      ),
    );
  }
}

class AlverProductCarouselOneItem extends StatelessWidget {
  const AlverProductCarouselOneItem({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String price;
  final Image image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
      child: SizedBox(
        height: 190.0,
        child: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: cartColor,
                  borderRadius: BorderRadius.circular(defaultRadius),
                  boxShadow: [cartShadow],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: header2Text,
                                  overflow: TextOverflow.fade,
                                  softWrap: true,
                                  maxLines: 3,
                                ),
                                Text(price, style: normalText),
                                const SizedBox(height: defaultPadding / 3),
                              ],
                            ),
                          ),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius:
                                  BorderRadius.circular(defaultRadius * 5),
                            ),
                            child: IconButton(
                              onPressed: onPressed,
                              icon: const Icon(Iconsax.arrow_right_3, size: 25),
                              color: Colors.white,
                              splashColor: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //const SizedBox(height: 20.0),
            Positioned(
              top: 0,
              child: SizedBox(
                width: 110.0,
                height: 110.0,
                child: image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
