import 'dart:developer';

import 'package:alver_shop/components/alver_category.dart';
import 'package:alver_shop/components/alver_nav_button.dart';
import 'package:alver_shop/components/alver_product_carousel_one.dart';
import 'package:alver_shop/components/alver_product_carousel_two.dart';
import 'package:alver_shop/components/alver_slider.dart';
import 'package:alver_shop/components/alver_title.dart';
import 'package:alver_shop/constants/colors.dart';
import 'package:alver_shop/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AlverHome extends StatefulWidget {
  const AlverHome({Key? key}) : super(key: key);

  @override
  State<AlverHome> createState() => _AlverHomeState();
}

class _AlverHomeState extends State<AlverHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            const SizedBox(width: defaultPadding),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  child: Image.asset(
                    'assets/images/avatar.png',
                    scale: 50.0,
                  ),
                  backgroundColor: disableColor,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.notification),
              color: iconColor,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.search_normal),
              color: iconColor,
            ),
            const SizedBox(width: defaultPadding),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const AlverCategory(),
              const SizedBox(height: defaultPadding / 2),
              const AlverSlider(),
              const AlverProductCarouselOne(),
              AlverTitle(
                title: 'Fresh Fruit',
                buttonTitle: 'See all',
                onPressed: () {
                  setState(() {
                    log('title clicked!', name: 'Title');
                  });
                },
              ),
              const AlverProductCarouselTwo(),
              const SizedBox(height: defaultPadding / 2),
            ],
          ),
        ),
        bottomNavigationBar: const AlverNavButton(),
      ),
    );
  }
}
