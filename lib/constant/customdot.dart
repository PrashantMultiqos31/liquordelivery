import 'package:flutter/material.dart';
import 'package:liquordelivery/constant/app_assets.dart';
import 'package:liquordelivery/constant/color_constant.dart';

class CustomDot extends StatefulWidget {
  const CustomDot({
    Key? key,
  }) : super(key: key);

  @override
  _CustomDotState createState() => _CustomDotState();
}

class _CustomDotState extends State<CustomDot> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCount() {
    setState(
      () => _counter--,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightBtnColor,
                border: Border.all(
                  color: AppColors.lightBtnColor,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  _decrementCount();
                },
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Image(
                    image: AssetImage(AssetImages.minus),
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        Text('$_counter',
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyText1!.color)),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightBtnColor,
              border: Border.all(
                color: AppColors.lightBtnColor,
              ),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  _incrementCounter();
                },
                child: const Icon(
                  Icons.add,
                  size: 17,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
