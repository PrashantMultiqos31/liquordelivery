import 'package:flutter/material.dart';
import 'package:liquordelivery/common/customappbar.dart';
import 'package:liquordelivery/constant/app_assets.dart';
import 'package:liquordelivery/constant/color_constant.dart';
import 'package:liquordelivery/constant/font_style.dart';
import 'package:liquordelivery/constant/message_constatnt.dart';
import 'package:liquordelivery/model/cartvalue.dart';
import 'package:liquordelivery/ui/homepage/popularbrand/brand_detail_page.dart';

class ViewAllBrand extends StatefulWidget {
  const ViewAllBrand({Key? key}) : super(key: key);

  @override
  _ViewAllBrandState createState() => _ViewAllBrandState();
}

class _ViewAllBrandState extends State<ViewAllBrand> {
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

  List<ItemData> _loadList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleName: kAllBrand,
        centerTitle: true,
      ),
      //load list to view all brands
      body: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: _loadList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BrandDetailsPage()),
                  );
                },
                //create card to list all data.
                child: Card(
                  elevation: 5.0,
                  shadowColor: AppColors.black,
                  color: Theme.of(context).shadowColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Container(
                        width: 45,
                        decoration: BoxDecoration(
                          color: Theme.of(context).shadowColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: Image(
                          height: 60,
                          width: 60,
                          image: AssetImage(_loadList[index].image.toString()),
                        ),
                      ),
                      Expanded(child: _listViewTiles(index)),
                    ]),
                  ),
                ),
              ),
            );
          }),
    );
  }
// list data load
  Widget _listViewTiles(int index) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        _loadList[index].itemName.toString(),
        style: AppFontStyle.normalTextSize
            .copyWith(color: Theme.of(context).textTheme.bodyText1!.color),
      ),
      Text(
        (_loadList[index].itemPrice.toString()),
        style: AppFontStyle.normalTextSize
            .copyWith(color: Theme.of(context).textTheme.bodyText1!.color),
      ),
    ]);
  }

  _loadData() {
    _loadList = [
      ItemData(
        image: AssetImages.single,
        itemName: 'Green Label',
        itemPrice: 150,
      ),
      ItemData(
        image: AssetImages.redLabel,
        itemName: 'Red Label',
        itemPrice: 250,
      ),
      ItemData(
        image: AssetImages.oldMonk,
        itemName: 'Old Monk',
        itemPrice: 340,
      ),
      ItemData(
        image: AssetImages.chivas,
        itemName: 'White Label',
        itemPrice: 480,
      ),
      ItemData(
        image: AssetImages.blackDog,
        itemName: 'Black Dog',
        itemPrice: 480,
      ),
      ItemData(
        image: AssetImages.beer,
        itemName: 'Bira Beer',
        itemPrice: 280,
      ),
      ItemData(
        image: AssetImages.allSeasons,
        itemName: 'All Seasons',
        itemPrice: 780,
      ),
      ItemData(
        image: AssetImages.allSeasons,
        itemName: 'All Seasons',
        itemPrice: 780,
      ),
      ItemData(
        image: AssetImages.allSeasons,
        itemName: 'All Seasons',
        itemPrice: 780,
      ),
      ItemData(
        image: AssetImages.allSeasons,
        itemName: 'All Seasons',
        itemPrice: 780,
      ),
      ItemData(
        image: AssetImages.allSeasons,
        itemName: 'All Seasons',
        itemPrice: 780,
      ),
      ItemData(
        image: AssetImages.allSeasons,
        itemName: 'All Seasons',
        itemPrice: 780,
      ),
      ItemData(
        image: AssetImages.allSeasons,
        itemName: 'All Seasons',
        itemPrice: 780,
      ),
      ItemData(
        image: AssetImages.allSeasons,
        itemName: 'All Seasons',
        itemPrice: 780,
      ),
      ItemData(
        image: AssetImages.single,
        itemName: 'Green Label',
        itemPrice: 150,
      ),
      ItemData(
        image: AssetImages.redLabel,
        itemName: 'Red Label',
        itemPrice: 250,
      ),
    ];
  }
}
