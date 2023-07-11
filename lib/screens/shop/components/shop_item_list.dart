import 'package:task_shop/app_properties.dart';
import 'package:task_shop/models/product.dart';
import 'package:task_shop/screens/product/components/color_list.dart';
import 'package:task_shop/screens/product/components/shop_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopItemList extends StatefulWidget {
  final Product product;
  final VoidCallback onRemove;

  ShopItemList(this.product, {required this.onRemove});

  @override
  _ShopItemListState createState() => _ShopItemListState();
}

class _ShopItemListState extends State<ShopItemList> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 130,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0, 0.8),
            child: Container(
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: shadow,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 12.0, right: 12.0),
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.product.name,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: darkGrey,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 160,
                            padding: const EdgeInsets.only(
                              left: 32.0,
                              top: 8.0,
                              bottom: 8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ColorOption(Colors.red),
                                Text(
                                  '\$${widget.product.price}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: darkGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CupertinoPicker(
                    itemExtent: 32.0,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        quantity = index + 1;
                      });
                    },
                    children: List<Widget>.generate(10, (index) {
                      return Center(
                        child: Text((index + 1).toString()),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 5,
            child: ShopProductDisplay(
              widget.product,
              onPressed: widget.onRemove,
            ),
          ),
        ],
      ),
    );
  }
}
