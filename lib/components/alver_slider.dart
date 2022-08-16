import 'dart:developer';

import 'package:alver_shop/constants/colors.dart';
import 'package:alver_shop/constants/size.dart';
import 'package:alver_shop/data/demo_slider_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AlverSlider extends StatefulWidget {
  const AlverSlider({Key? key}) : super(key: key);

  @override
  State<AlverSlider> createState() => _AlverSliderState();
}

class _AlverSliderState extends State<AlverSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: CarouselSlider.builder(
            itemCount: sliderData.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(defaultRadius),
                child: Image.asset(sliderData['$index']['image']),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 9),
              enableInfiniteScroll: false,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              aspectRatio: 2.1,
              pageSnapping: true,
              pauseAutoPlayOnTouch: true,
              scrollPhysics: const BouncingScrollPhysics(),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  log('slider item $index', name: 'test');
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: sliderData.entries.map((entry) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 2.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                color: ('$_current' == entry.key ? mainColor : dotColor),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
