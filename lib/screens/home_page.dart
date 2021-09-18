import 'package:book_now_null_safety/controllers/search_controller.dart';
import 'package:book_now_null_safety/controllers/theme_controller.dart';
import 'package:book_now_null_safety/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'hotels/hotels_search_page.dart';
import 'restaurants/restaurants_search_page.dart';

class HomePage extends GetView<SearchController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize.init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF212843),
            title: Text(
              'Travel Mate',
              style:
                  TextStyle(fontFamily: 'Urban', fontWeight: FontWeight.w700),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  if (Get.locale.toString() == 'en')
                    Get.updateLocale(Locale('ar'));
                  else
                    Get.updateLocale(Locale('en'));
                },
                icon: Icon(MdiIcons.abjadArabic),
              ),
              IconButton(
                onPressed: () => ThemeService().switchTheme(),
                icon: Icon(MdiIcons.themeLightDark),
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: [
                customTap(
                    icon: Icon(MdiIcons.pizza, size: 25.0),
                    title: 'Restaurants'.tr),
                customTap(
                    icon: Icon(MdiIcons.bedKingOutline, size: 30.0),
                    title: 'Hotels'.tr),
              ],
            )),
        body: TabBarView(
          children: [
            RestaurantsPage(),
            HotelBookingPage(),
            // AttractionsPage(),
          ],
        ),
      ),
    );
  }

  Widget customTap({icon, title}) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          icon,
          Text(title,
              style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Urban',
                  fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
