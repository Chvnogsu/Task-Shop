import 'package:task_shop/app_properties.dart';
import 'package:task_shop/custom_background.dart';
import 'package:task_shop/models/product.dart';
import 'package:task_shop/screens/category/category_list_page.dart';
import 'package:task_shop/screens/notifications_page.dart';
import 'package:task_shop/screens/profile_page.dart';
import 'package:task_shop/screens/search_page.dart';
import 'package:task_shop/screens/shop/check_out_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/custom_bottom_bar.dart';
import 'components/product_list.dart';
import 'components/tab_view.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

List<String> timelines = ['Weekly featured','Best of June','Best of 2023',];
String selectedTimeline = 'Weekly featured';

List<Product> products = [
   Product(
                          'assets/ring_1.png',
                          'BAPE',
                          'BAPE Color Camo Shark Full Zip hoodie',
                          398.99),
                      Product(
                          'assets/shoeman_7.png',
                          'Rick Owens',
                          'Rick Owens DRKSHDW Jumbo Lace High',
                          999.99),
                      Product(
                          'assets/headphone_9.png',
                          'Rick Owens',
                          'Rick Owens DRKSHDW Jumbo Lace Low',
                          702.33),
];

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {
  late TabController tabController;
  late TabController bottomTabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    bottomTabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar = Container(
      height: kToolbarHeight + MediaQuery.of(context).padding.top,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => NotificationsPage())),
              icon: Icon(Icons.notifications)),
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: SvgPicture.asset('assets/icons/search_icon.svg'))
        ],
      ),
    );

    Widget topHeader = Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[0];
                    products = [
                      Product(
                          'assets/ring_1.png',
                          'BAPE',
                          'BAPE Color Camo Shark Full Zip hoodie',
                          398.99),
                      Product(
                          'assets/shoeman_7.png',
                          'Rick Owens',
                          'Rick Owens DRKSHDW Jumbo Lace High',
                          999.99),
                      Product(
                          'assets/headphone_9.png',
                          'Rick Owens',
                          'Rick Owens DRKSHDW Jumbo Lace Low',
                          702.33),
                    ];
                  });
                },
                child: Text(
                  timelines[0],
                  style: TextStyle(
                      fontSize: timelines[0] == selectedTimeline ? 20 : 14,
                      color: darkGrey),
                ),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[1];
                    products = [
                      Product(
                          'assets/jeans_3.png',
                          'EE',
                          'EE shorts',
                          219.99),
                      Product(
                          'assets/bag_10.png',
                          'Cactus Jack',
                          'Cacti(L)',
                          149.99),
                      Product(
                          'assets/bag_1.png',
                          'Chrome Hearts',
                          'Miami Silver Exclusive(XL)',
                          799.99),
                    ];
                  });
                },
                child: Text(timelines[1],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: timelines[1] == selectedTimeline ? 20 : 14,
                        color: darkGrey)),
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTimeline = timelines[2];
                    products = [
                      Product(
                          'assets/headphone_13.png',
                          'MSCHF Big Red Boot',
                          'Big Red Boot',
                          350.99),
                      Product(
                          'assets/jeans_4.png',
                          'Palm Angels',
                          'logo-print track pants',
                          274.99),
                      Product(
                          'assets/ring_7.png',
                          'Nike X Off-White',
                          'Dunk Low "University Red" sneakers',
                          739.99),
                    ];
                  });
                },
                child: Text(timelines[2],
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: timelines[2] == selectedTimeline ? 20 : 14,
                        color: darkGrey)),
              ),
            ),
          ],
        ));

    Widget tabBar = TabBar(
      tabs: [
        Tab(text: 'Trending'),
        Tab(text: 'Shoes'),
        Tab(text: 'Pants'),
        Tab(text: 'Shirts'),
        Tab(text: 'Shorts'),
      ],
      labelStyle: TextStyle(fontSize: 16.0),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.0,
      ),
      labelColor: darkGrey,
      unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
      isScrollable: true,
      controller: tabController,
    );

    return Scaffold(
      bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
      body: CustomPaint(
        painter: MainBackground(),
        child: TabBarView(
          controller: bottomTabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            SafeArea(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  // These are the slivers that show up in the "outer" scroll view.
                  return <Widget>[
                    SliverToBoxAdapter(
                      child: appBar,
                    ),
                    SliverToBoxAdapter(
                      child: topHeader,
                    ),
                    SliverToBoxAdapter(
                      child: ProductList(
                        products: products,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: tabBar,
                    )
                  ];
                },
                body: TabView(
                  tabController: tabController,
                ),
              ),
            ),
            CategoryListPage(),
            CheckOutPage(),
            ProfilePage()
          ],
        ),
      ),
    );
  }
}
