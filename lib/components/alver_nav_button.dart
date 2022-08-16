import 'package:alver_shop/constants/colors.dart';
import 'package:alver_shop/constants/fonts.dart';
import 'package:alver_shop/constants/size.dart';
import 'package:alver_shop/data/demo_nav_buttons.dart';
import 'package:flutter/material.dart';

class AlverNavButton extends StatefulWidget {
  const AlverNavButton({
    Key? key,
  }) : super(key: key);

  @override
  State<AlverNavButton> createState() => _AlverNavButtonState();
}

class _AlverNavButtonState extends State<AlverNavButton> {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(navButtonsData.length, (index) {
              return TextButton(
                style: _currentNav == index
                    ? ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(secondColor),
                        overlayColor: MaterialStateProperty.all(overlayColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(defaultRadius / 2),
                          ),
                        ),
                      )
                    : ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(bgColor),
                        overlayColor: MaterialStateProperty.all(secondColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(defaultRadius / 2),
                          ),
                        ),
                      ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      navButtonsData[index]['icon'],
                      color: _currentNav == index ? mainColor : disableColor,
                    ),
                    SizedBox(
                      width: _currentNav == index ? defaultPadding / 2 : 0.0,
                    ),
                    Text(
                      _currentNav == index
                          ? navButtonsData[index]['title']
                          : '',
                      style: buttonText,
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    if (_currentNav != index) _currentNav = index;
                  });
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
