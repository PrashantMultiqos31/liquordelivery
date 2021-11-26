import 'package:flutter/material.dart';

class MySeparator extends StatelessWidget {
  final double height;
  final double wight;
  final Color color;
   Axis directions;

   MySeparator({this.height = 1,this.wight = 0.5, this.color = Colors.black,this.directions=Axis.horizontal});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 2.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Theme.of(context).textTheme.bodyText1!.color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: directions,
        );
      },
    );
  }
}