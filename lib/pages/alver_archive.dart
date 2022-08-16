import 'package:alver_shop/components/alver_nav_checkout.dart';
import 'package:alver_shop/components/alver_product_cart.dart';
import 'package:alver_shop/constants/colors.dart';
import 'package:alver_shop/constants/size.dart';
import 'package:alver_shop/data/demo_product_data.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AlverArchive extends StatefulWidget {
  const AlverArchive({Key? key}) : super(key: key);

  @override
  State<AlverArchive> createState() => _AlverArchiveState();
}

class _AlverArchiveState extends State<AlverArchive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: iconColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Iconsax.arrow_left_2),
        ),
        title: const Text('Greens'),
        centerTitle: true,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.search_normal),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.setting_5),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(defaultPadding),
        scrollDirection: Axis.vertical,
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: defaultPadding / 6,
          children: List.generate(productData.length, (index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, defaultPadding),
              child: AlverProductCartItem(
                title: productData['product_$index']['name'],
                price: "\$ " + productData['product_$index']['price'],
                image: productData['product_$index']['image'],
                itemIndex: index,
                width: 160.0,
                height: 230.0,
                onPress: () {},
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: const AlverNavCheckout(),
    );
  }
}
