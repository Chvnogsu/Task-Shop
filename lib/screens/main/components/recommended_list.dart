import 'package:task_shop/app_properties.dart';
import 'package:task_shop/models/product.dart';
import 'package:task_shop/screens/product/product_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class RecommendedList extends StatelessWidget {
  List<Product> products = [
    Product('assets/bag_1.png', 'Chrome Hearts', 'Miami Silver Exclusive(XL)', 799.99),
    Product('assets/cap_5.png', 'New Era', 'Retro On-Field Atlanta Braves Home 59Fifty Fitted Hat ', 10),
    Product('assets/jeans_1.png', 'AMIRI', 'AMIRI x Playboy Denim(30)', 599.99),
    Product('assets/womanshoe_3.png', 'Balenciaga', 'BB Phantom(38)', 599.99),
    Product('assets/bag_10.png', 'Cactus Jack', 'Cacti(L)', 149.99),
    Product('assets/jeans_3.png', 'EE', 'EE Shorts', 219.99),
    Product('assets/ring_1.png', 'BAPE', 'BAPE Color Camo Shark Full Zip Hoodie', 398.99),
    Product('assets/shoeman_7.png', 'Rick Owens', 'Rick Owens DRKSHDW Jumbo Lace High', 999.99),
    Product('assets/headphone_9.png', 'Rick Owens', 'Rick Owens DRKSHDW Jumbo Lace Low', 702.33),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                  width: 4,
                  color: black45,
                ),
              ),
              Center(
                  child: Text(
                'Recommended',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            child: MasonryGridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) => new ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProductPage(product: products[index]))),
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                            colors: [
                              Colors.grey.withOpacity(0.3),
                              Colors.grey.withOpacity(0.7),
                            ],
                            center: Alignment(0, 0),
                            radius: 0.6,
                            focal: Alignment(0, 0),
                            focalRadius: 0.1),
                      ),
                      child: Hero(
                          tag: products[index].image,
                          child: Image.asset(products[index].image))),
                ),
              ),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ),
      ],
    );
  }
}
