import 'package:task_shop/app_properties.dart';
import 'package:task_shop/screens/payment/promo_item.dart';
import 'package:flutter/material.dart';
import 'package:task_shop/screens/tracking_page.dart'; // Import the TrackingPage widget

class UnpaidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget payNow = InkWell(
      onTap: () {
        // Perform secure payment processing here

        // After successful payment processing
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TrackingPage()), // Replace TrackingPage with the actual widget for the tracking page
        );
      },
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
          gradient: mainButton,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            ),
          ],
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Center(
          child: Text(
            "Pay Now",
            style: const TextStyle(
              color: Colors.white, // Updated to white color
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Unpaid',
                      style: TextStyle(
                        color: darkGrey,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CloseButton(),
                  ],
                ),
              ),
              PromoItem(),
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: shadow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text('Rick Owens DRKSHDW Jumbo Lace Low'),
                      trailing: Text('702.33'),
                    ),
                    ListTile(
                      title: Text('Tax'),
                      trailing: Text('42.13'),
                    ),
                    ListTile(
                      title: Text('Subtotal'),
                      trailing: Text('744.46'),
                    ),
                    ListTile(
                      title: Text('Promocode'),
                      trailing: Text('0.00'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        '\$ 744.46',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: payNow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
