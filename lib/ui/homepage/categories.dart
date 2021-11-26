import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquordelivery/constant/app_assets.dart';
import 'package:liquordelivery/constant/font_style.dart';

class CategoriesDetails extends StatefulWidget {
  String? names;

  CategoriesDetails({Key? key, required this.names}) : super(key: key);

  @override
  _CategoriesDetailsState createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              border: Border.all(
                  width: 1.0, color: Theme.of(context).highlightColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ), //DecorationImage,
            ),
            child: const Center(
              child: Image(
                image: AssetImage(AssetImages.whisky),
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.names ?? '',
            style: AppFontStyle.smallSizeFont.copyWith(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ],
      ),
    );
  }
}
