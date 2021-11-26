import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:liquordelivery/cartpage/cart_details.dart';
import 'package:liquordelivery/ui/homepage/popularbrand/brand_detail_page.dart';
import 'package:liquordelivery/ui/homepage/viewall_brand.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.brandDetailsPage,
      page: () => const BrandDetailsPage(),
    ),
    GetPage(
      name: Routes.viewAllBrand,
      page: () => const ViewAllBrand(),
    ),
    GetPage(
      name: Routes.cartDetails,
      page: () => const CartDetails(),
    ),
  ];
}

abstract class Routes {
  static const brandDetailsPage = '/brandDetails';
  static const viewAllBrand = '/viewAllBrand';
  static const cartDetails = '/cartDetails';
}
