import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquordelivery/common/app_routes.dart';
import 'package:liquordelivery/common/clippathclass.dart';
import 'package:liquordelivery/constant/app_assets.dart';
import 'package:liquordelivery/constant/color_constant.dart';
import 'package:liquordelivery/constant/font_style.dart';
import 'package:liquordelivery/constant/message_constatnt.dart';

class DetailsHome extends StatefulWidget {
  const DetailsHome({Key? key}) : super(key: key);

  @override
  _DetailsHomeState createState() => _DetailsHomeState();
}

class _DetailsHomeState extends State<DetailsHome> {
  final List<String> images = [
    AssetImages.single,
    AssetImages.allSeasons,
    AssetImages.blackDog,
    AssetImages.chivas,
    AssetImages.glenn,
    AssetImages.oldMonk,
    AssetImages.redLabel,
    AssetImages.beer,
  ];

  final List<String> names = [
    'Whiskey',
    'Brandi',
    'vodka',
    'Beer',
    'Whiskey',
    'Brandi',
    'vodka',
    'Beer'
  ];

  final List<String> brandNames = [
    'Chivas Regal',
    'Crown Royal',
    'Jack Daniel',
    'Jim Beam',
    'Jagereister',
    'Baileys',
    'Fernet Branca',
    'Fireball'
  ];

  final List<String> prices = [
    '\$ 190',
    '\$ 180',
    '\$ 120',
    '\$ 200',
    '\$ 250',
    '\$ 290',
    '\$ 4000',
    'v'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: Icon(
          Icons.apps,
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
        elevation: 0,
        backgroundColor: AppColors.transparent,
        title: Text(
          kLiquor,
          style: AppFontStyle.normalTextSize.copyWith(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: Theme.of(context).textTheme.bodyText1!.color,
                onPressed: () {
                  Get.toNamed(Routes.cartDetails);
                }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 10.0,
                    bottom: 12,
                    top: 12,
                  ),
                  child: _searchBar(),
                ),
                _headingTitle(
                  kCategories,
                  kViewAll,
                ),
                SizedBox(
                  height: 120,
                  child: _categories(),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.viewAllBrand);
                  },
                  child: _headingTitle(kPopularBrand, kViewAll),
                ),
                SizedBox(
                  height: 242,
                  child: _popularBrand(),
                ),
                _headingTitle(
                  kPopularBrand,
                  kViewAll,
                ),
                SizedBox(
                  height: 242,
                  child: _popularBrand(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//all categories list here
  Widget _categories() {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
          child: Column(
            children: [
              // navigation on other page
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.brandDetailsPage);
                },
                child: Container(
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
                  child: Center(
                    child: Image(
                      image: AssetImage(images[index]),
                      height: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                names[index],
                style: AppFontStyle.smallSizeFont.copyWith(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

//popular brand list
  Widget _popularBrand() {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.brandDetailsPage);
            },
            child: Stack(
              fit: StackFit.loose,
              children: [
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    alignment: Alignment.center,
                    //custom path shape
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
                    Center(
                      child: Image(
                        height: 150,
                        width: 150,
                        image: AssetImage(images[index]),
                      ),
                    ),
                    Text(
                      brandNames[index],
                      style: AppFontStyle.smallSizeFont.copyWith(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      prices[index],
                      style: AppFontStyle.smallSizeFont
                          .copyWith(color: Theme.of(context).bottomAppBarColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

// all page heading
  Widget _headingTitle(String names, String viewAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          names,
          style: AppFontStyle.textFieldPrice.copyWith(
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            viewAll,
            style: AppFontStyle.viewAllSmall
                .copyWith(color: Theme.of(context).bottomAppBarColor),
          ),
        ),
      ],
    );
  }

// searchbar add here
  Widget _searchBar() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              border: Border.all(color: Theme.of(context).shadowColor),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: kSearch,
                  hintStyle: AppFontStyle.normalTextSize.copyWith(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.lightBtnColor,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            height: 39,
            width: 39,
            child: const Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
