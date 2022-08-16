import 'dart:developer';

import 'package:alver_shop/constants/colors.dart';
import 'package:alver_shop/constants/fonts.dart';
import 'package:alver_shop/constants/size.dart';
import 'package:alver_shop/data/demo_category_data.dart';
import 'package:alver_shop/pages/alver_archive.dart';
import 'package:flutter/material.dart';

class AlverCategory extends StatefulWidget {
  const AlverCategory({Key? key}) : super(key: key);

  @override
  State<AlverCategory> createState() => _AlverCategoryState();
}

class _AlverCategoryState extends State<AlverCategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding / 2),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(categoryData.length, (index) {
            return AlverCategoryItem(
              title: categoryData["cat_$index"]['name'],
              image: categoryData["cat_$index"]['image'],
              onTap: () {
                index == 1
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AlverArchive(),
                        ),
                      )
                    : setState(() {
                        log('category item $index', name: 'test');
                      });
              },
            );
          }),
        ),
      ),
    );
  }
}

class AlverCategoryItem extends StatelessWidget {
  const AlverCategoryItem({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding / 2),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(defaultRadius),
        child: Column(
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                color: catColor,
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: Image.asset(image),
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Text(title, style: normalText),
          ],
        ),
      ),
    );
  }
}
