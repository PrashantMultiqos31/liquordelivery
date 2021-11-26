import 'package:flutter/material.dart';
import 'package:liquordelivery/common/clippathclass.dart';
import 'package:liquordelivery/constant/app_assets.dart';
import 'package:liquordelivery/constant/font_style.dart';

class PopularBrand extends StatefulWidget {
  String? names;
  String? price;

  PopularBrand({Key? key, this.names, this.price}) : super(key: key);

  @override
  _PopularBrandState createState() => _PopularBrandState();
}

class _PopularBrandState extends State<PopularBrand> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              alignment: Alignment.center,
              child: ClipPath(
                clipper: ClipPathClass(),
                child: SizedBox(
                  width: 150,
                  height: 180,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      color: Theme.of(context).highlightColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 150,
                height: 170,
                child: Center(
                  child: Image(
                    image: AssetImage(AssetImages.whisky),
                  ),
                ),
              ),
              Text(
                widget.names ?? '',
                style: AppFontStyle.smallSizeFont.copyWith(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: Text(
                  widget.price ?? '',
                  style: AppFontStyle.smallSizeFont
                      .copyWith(color: Theme.of(context).bottomAppBarColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
