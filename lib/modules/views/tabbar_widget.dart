import 'package:cryptoapp/modules/views/home_page/favourite_page.dart';
import 'package:cryptoapp/modules/views/home_page/home_page.dart';
import 'package:cryptoapp/themes/colors.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int initialIndex = 0;

  @override
  void initState() {
    _tabController =
        TabController(vsync: this, length: 2, initialIndex: initialIndex);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: initialIndex,
      animationDuration: const Duration(seconds: 1),
      child: Scaffold(
        backgroundColor: AppColors.myPrimary,
        appBar: AppBar(
          backgroundColor: AppColors.myPrimary,
          title: Text(
            "Crypto Coin",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.white),
          ),
          bottom: TabBar(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            indicatorColor: Colors.red,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.red, width: 4.0),
              insets: EdgeInsets.symmetric(horizontal: 100),
            ),
            labelColor: AppColors.cancelledColor,
            labelStyle: Theme.of(context)
              .textTheme
              .labelMedium!,
            unselectedLabelColor: Colors.grey,
            onTap: (value) {
              initialIndex = value;
              _tabController.animateTo(initialIndex);
            },
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.currency_bitcoin,
                  color: AppColors.white,
                ),
                text: "Current cryptocurrencies",
              ),
              Tab(
                icon: Icon(
                  Icons.favorite,
                  color: AppColors.white,
                ),
                text: "Favourites",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            HomePage(),
            FavouritePage(),
          ],
        ),
      ),
    );
  }
}
