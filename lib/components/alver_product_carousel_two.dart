import 'package:alver_shop/components/alver_product_cart.dart';
import 'package:alver_shop/constants/size.dart';
import 'package:alver_shop/data/demo_product_data.dart';
import 'package:flutter/material.dart';

class AlverProductCarouselTwo extends StatefulWidget {
  const AlverProductCarouselTwo({Key? key}) : super(key: key);

  @override
  State<AlverProductCarouselTwo> createState() =>
      _AlverProductCarouselTwoState();
}

class _AlverProductCarouselTwoState extends State<AlverProductCarouselTwo> {
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
          children: List.generate(productData.length, (index) {
            return AlverProductCartItem(
              title: productData['product_$index']['name'],
              price: "\$ " + productData['product_$index']['price'],
              image: productData['product_$index']['image'],
              itemIndex: index,
              onPress: () {},
            );
          }),
        ),
      ),
    );
  }
}
