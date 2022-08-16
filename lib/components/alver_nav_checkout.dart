import 'package:alver_shop/components/alver_button.dart';
import 'package:alver_shop/constants/colors.dart';
import 'package:alver_shop/constants/fonts.dart';
import 'package:alver_shop/constants/size.dart';
import 'package:alver_shop/data/demo_nav_buttons.dart';
import 'package:flutter/material.dart';

class AlverNavCheckout extends StatefulWidget {
  const AlverNavCheckout({
    Key? key,
  }) : super(key: key);

  @override
  State<AlverNavCheckout> createState() => _AlverNavCheckoutState();
}

class _AlverNavCheckoutState extends State<AlverNavCheckout> {
  int _currentNav = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        defaultPadding + 10,
        0,
        defaultPadding + 10,
        defaultPadding + 20,
      ),
      child: Container(
        width: screenSize.width - 200,
        height: 80.0,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(defaultRadius + 10.0),
          boxShadow: const [
            mainShadow,
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('\$126', style: navCheckoutText),
                  const SizedBox(height: defaultPadding / 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '10 items',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(' in bucket list'),
                    ],
                  )
                ],
              ),
              AlverButton(
                child: const Text('CHECKOUT'),
                bgColor: mainColor,
                frColor: secondColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
