import 'package:flutter/material.dart';
import 'package:liquordelivery/cartpage/cart_details.dart';
import 'package:liquordelivery/constant/app_assets.dart';
import 'package:liquordelivery/constant/color_constant.dart';
import 'package:liquordelivery/constant/customdot.dart';
import 'package:liquordelivery/constant/font_style.dart';
import 'package:liquordelivery/constant/message_constatnt.dart';

class BrandDetailsPage extends StatefulWidget {
  const BrandDetailsPage({Key? key}) : super(key: key);

  @override
  _BrandDetailsPageState createState() => _BrandDetailsPageState();
}

class _BrandDetailsPageState extends State<BrandDetailsPage> {
  bool _alreadySaved = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 1.6,
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(25.0)),
                                  color: Theme.of(context).highlightColor,
                                  shape: BoxShape.rectangle,
                                ),
                                child:const Padding(
                                  padding:  EdgeInsets.only(top: 60,bottom: 40,),
                                  child:  Image(
                                    height: 150,
                                    fit: BoxFit.fitHeight,
                                    image: AssetImage(AssetImages.redLabel),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _liquorSpecification(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                        IconButton(
                          icon: _alreadySaved
                              ? const Image(
                                  image: AssetImage(AssetImages.redHeart))
                              :  Image(
                            color: Theme.of(context).buttonColor,
                                  image: const AssetImage(AssetImages.blackHeart)),
                          onPressed: () {
                            _alreadySaved = !_alreadySaved;
                            setState(() {

                            });
                          },
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _customBottom(),
            ],
          ),
        ),
      ),
    );
  }
// liquor details with counter
  Widget _customBottom() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
            bottom: 10,
          ),
          child: Row(
            children: [
              Text(
                'Red Wine',
                style: AppFontStyle.textFieldPrice.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: 18
                ),
              ),
              const Spacer(),
              Text(
                '\$ 199',
                style: AppFontStyle.yellowBoldColor
                    .copyWith(color: Theme.of(context).bottomAppBarColor),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 10,
          ),
          child: Text(
            kDetails,
            maxLines: 3,
            style: AppFontStyle.textFieldPrice
                .copyWith(color: Theme.of(context).textTheme.bodyText1!.color),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: const CustomDot(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartDetails()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: AppColors.lightBtnColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: AppColors.lightBtnColor,
                    ),
                  ),
                  child:const Center(
                      child: Text(
                    kAddToBeg,
                    style: AppFontStyle.textFieldPrice

                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  //liquor details
  Widget _liquorSpecification() {
    return Padding(
      padding: const EdgeInsets.only(right: 38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kWhiskyType,
                style: AppFontStyle.normalTextSize.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Red',
                style: AppFontStyle.viewAll
                    .copyWith(color: Theme.of(context).bottomAppBarColor),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kAlcohol,
                style: AppFontStyle.normalTextSize.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '18 %',
                style: AppFontStyle.viewAll
                    .copyWith(color: Theme.of(context).bottomAppBarColor),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kVolume,
                style: AppFontStyle.normalTextSize.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '500 Ml',
                style: AppFontStyle.viewAll
                    .copyWith(color: Theme.of(context).bottomAppBarColor),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kCountry,
                style: AppFontStyle.normalTextSize.copyWith(
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Italy',
                style: AppFontStyle.viewAll
                    .copyWith(color: Theme.of(context).bottomAppBarColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
