import 'package:task_shop/app_properties.dart';
import 'package:task_shop/models/product.dart';
import 'package:task_shop/screens/product/components/product_card.dart';
import 'package:flutter/material.dart';

class MoreProducts extends StatelessWidget {
  final List<Product> products = [
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 24.0, bottom: 8.0),
          child: Text(
            'More products',
            style: TextStyle(color: Colors.white, shadows: shadow),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          height: 250,
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) {
              return Padding(
                ///calculates the left and right margins
                ///to be even with the screen margin
                  padding: index == 0
                      ? EdgeInsets.only(left: 24.0, right: 8.0)
                      : index == 4
                      ? EdgeInsets.only(right: 24.0, left: 8.0)
                      : EdgeInsets.symmetric(horizontal: 8.0),
                  child: ProductCard(products[index]));
            },
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
