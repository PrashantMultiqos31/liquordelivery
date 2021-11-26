import 'package:flutter/material.dart';
import 'package:liquordelivery/constant/color_constant.dart';
import 'package:liquordelivery/constant/message_constatnt.dart';
import 'package:liquordelivery/ui/homepage/deliveryproduct/liqour_google_map.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40))),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.lightBtnColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
              side: const BorderSide(color: AppColors.lightBtnColor),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const GoogleMApDelivery()));
        },
        child:const Text(
          kProcessCheckOut,
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
