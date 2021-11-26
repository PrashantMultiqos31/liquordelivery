import 'package:flutter/material.dart';
import 'package:liquordelivery/constant/color_constant.dart';
import 'package:liquordelivery/constant/font_style.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  String? titleName;
  bool?  centerTitle;

  CustomAppBar({Key? key, this.titleName,this.centerTitle}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
    Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
     centerTitle: widget.centerTitle,
      elevation: 0,
      backgroundColor: AppColors.transparent,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).textTheme.bodyText1!.color,
        ),
      ),
      title: Text(
        widget.titleName ?? '',
        style: AppFontStyle.appBarName
            .copyWith(color: Theme.of(context).textTheme.bodyText1!.color),
      ),
    );
  }
}
