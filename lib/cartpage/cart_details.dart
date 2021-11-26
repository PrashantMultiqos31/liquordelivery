import 'package:flutter/material.dart';
import 'package:liquordelivery/common/CustomWidgets/custombutton.dart';
import 'package:liquordelivery/common/customappbar.dart';
import 'package:liquordelivery/common/myseparator.dart';
import 'package:liquordelivery/constant/app_assets.dart';
import 'package:liquordelivery/constant/color_constant.dart';
import 'package:liquordelivery/constant/font_style.dart';
import 'package:liquordelivery/constant/message_constatnt.dart';
import 'package:liquordelivery/model/cartvalue.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({Key? key}) : super(key: key);

  @override
  _CartDetailsState createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
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
  ItemData? itemData;
  int price = 0;
  int texPrice = 50;
  int delPrice = 50;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    _customTotal();
    return Scaffold(
      appBar: CustomAppBar(
        titleName: kMyCart,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: Container(child: _categories())),
          _bottomSheetView(),
        ],
      ),
    );
  }
  // List of All categories
  Widget _categories() {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: _loadList.length,
        itemBuilder: (context, index) {
          return _cartItemTiles(index);
        });
  }
// addiction and total of all cart value as well as tex and delivery Charges
  Widget _bottomSheetView() {
    return SizedBox(
      height: 220,
      child: Card(
        elevation: 10,
        color: Theme.of(context).highlightColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
            bottom: 10,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    kSubTotal,
                    style: AppFontStyle.textFieldPrice.copyWith(
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                  Text(
                    price.toString(),
                    style: AppFontStyle.viewAll,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    kTax,
                    style: AppFontStyle.textFieldPrice.copyWith(
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                  const Text(
                    '\$ 50',
                    style: AppFontStyle.viewAll,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    kDeliveryCharges,
                    style: AppFontStyle.textFieldPrice.copyWith(
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                  const Text(
                    '\$ 50',
                    style: AppFontStyle.viewAll,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 10),
                // counter addiction and substance
                child: MySeparator(
                  color: AppColors.green,
                  height: 2,
                  directions: Axis.horizontal,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    kTotalAmount,
                    style: AppFontStyle.smallSize.copyWith(
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                  Text(
                    (price + texPrice + delPrice).toString(),
                    style: AppFontStyle.viewAll
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // custom cart tiles
  Widget _cartItemTiles(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Card(
        elevation: 5.0,
        shadowColor: AppColors.black,
        color: Theme.of(context).shadowColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: Center(
                  child: Image(
                    height: 50,
                    image: AssetImage(_loadList[index].image.toString()),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        _loadList[index].itemName.toString(),
                        style: AppFontStyle.normalTextSize.copyWith(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color),
                      ),
                    ),
                    Row(
                      children: [
                        Row(
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
                                      setState(() {
                                        // substance counter
                                        int temp = _loadList[index].counter;
                                        temp = temp - 1;
                                        _loadList[index].sCounter = temp;
                                        temp == 0 ? _loadList.removeAt(index) : 1;
                                      });
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
                            Text(_loadList[index].counter.toString(),
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
                                      setState(() {
                                        // addiction counter
                                        int temp = _loadList[index].counter;
                                        temp = temp + 1;
                                        _loadList[index].sCounter = temp;
                                      });
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
                        ),
                        const Spacer(),
                        Text(
                          ('\$ ' +
                              (_loadList[index].itemPrice! *
                                      _loadList[index].counter)
                                  .toString()),
                          style: AppFontStyle.normalTextSize
                              .copyWith(color: AppColors.lightBtnColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// list item data load
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
          itemPrice: 780),
    ];
  }

  _customTotal() {
    price = 0;
    for (var element in _loadList) {
      price = (element.itemPrice! * element.counter) + price;
    }
    setState(() {});
    return price.toString();
  }
}
