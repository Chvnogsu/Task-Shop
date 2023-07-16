import 'package:task_shop/models/category.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';
import 'recommended_list.dart';

class TabView extends StatelessWidget {
  List<Category> categories = [
    Category(
      Colors.grey, // Change the color here to grey
      Color(0xffF68D7F),
      'Women Clothes',
      'assets/shoeman_7.png',
    ),
    Category(
      Colors.grey, // Change the color here to grey
      Colors.grey, // Change the color here to grey
      'Men Clothes',
      'assets/headphone_9.png',
    ),
    Category(
      Color(0xff00E9DA),
      Color(0xff5189EA),
      'Fashion',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffAF2D68),
      Color(0xff632376),
      'Home',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xff36E892),
      Color(0xff33B2B9),
      'Beauty',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Appliances',
      'assets/jeans_5.png',
    ),
  ];

  final TabController tabController;

  TabView({
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height / 9);
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: tabController,
      children: <Widget>[
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8.0),
                height: MediaQuery.of(context).size.height / 9,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (_, index) => CategoryCard(
                    category: categories[index],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Flexible(child: RecommendedList()),
            ],
          ),
        ),
        Column(children: <Widget>[
          SizedBox(height: 16.0),
          Flexible(child: RecommendedList())
        ]),
        Column(children: <Widget>[
          SizedBox(height: 16.0),
          Flexible(child: RecommendedList())
        ]),
        Column(children: <Widget>[
          SizedBox(height: 16.0),
          Flexible(child: RecommendedList())
        ]),
        Column(children: <Widget>[
          SizedBox(height: 16.0),
          Flexible(child: RecommendedList())
        ]),
      ],
    );
  }
}
