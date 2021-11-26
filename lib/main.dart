import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:liquordelivery/common/app_routes.dart';
import 'package:liquordelivery/common/themefile.dart';
import 'package:liquordelivery/ui/homepage/home_details.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
        return GetMaterialApp(
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          theme: AppThemes.appThemeData[AppTheme.lightTheme],
          darkTheme: AppThemes.appThemeData[AppTheme.darkTheme],
          themeMode: ThemeMode.system,
            home:const DetailsHome(),
        );


  }
}
