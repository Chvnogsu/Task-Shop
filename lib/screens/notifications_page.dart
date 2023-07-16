import 'package:flutter/material.dart';
import 'package:task_shop/app_properties.dart';
import 'package:task_shop/screens/rating/rating_page.dart';
import 'package:task_shop/screens/tracking_page.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Notifications',
          style: TextStyle(
            color: darkGrey,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: darkGrey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            // Request amount
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/avatar.jpg'),
                        maxRadius: 24,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Juan Arce',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: ' Requested for '),
                              TextSpan(
                                text: '\$45.25',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 14,
                            color: Colors.blue[700],
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'Pay',
                            style: TextStyle(color: Colors.blue[700]),
                          ),
                        ],
                      ),
                      SizedBox(width: 16.0),
                      Row(
                        children: [
                          Icon(
                            Icons.cancel,
                            size: 14,
                            color: Color(0xffF94D4D),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'Decline',
                            style: TextStyle(color: Color(0xffF94D4D)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Send amount
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/avatar.jpg'),
                        maxRadius: 24,
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Naomi King',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: ' Sent You '),
                              TextSpan(
                                text: '\$135.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 14,
                            color: Colors.blue[700],
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'Accept',
                            style: TextStyle(color: Colors.blue[700]),
                          ),
                        ],
                      ),
                      SizedBox(width: 16.0),
                      Row(
                        children: [
                          Icon(
                            Icons.cancel,
                            size: 14,
                            color: Color(0xffF94D4D),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'Decline',
                            style: TextStyle(color: Color(0xffF94D4D)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Share your feedback.
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => RatingPage()),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 110,
                            width: 110,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 5.0,
                                  bottom: -10.0,
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Transform.scale(
                                      scale: 1.2,
                                      child: Image.asset(
                                        'assets/bottom_yellow.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 8.0,
                                  left: 10.0,
                                  child: SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: Image.asset('assets/jeans_3.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EE Shorts',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Your package has been delivered. Thanks for shopping!',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: darkGrey,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Share your feedback',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Track the product.
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => TrackingPage()),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 110,
                            width: 110,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 5.0,
                                  bottom: -10.0,
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Transform.scale(
                                      scale: 1.2,
                                      child: Image.asset(
                                        'assets/bottom_yellow.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 8.0,
                                  left: 10.0,
                                  child: SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: Image.asset(
                                      'assets/headphone_9.png',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rick Owens DRKSHDW Jumbo Lace Low',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Your package has been dispatched. You can keep track of your product.',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: darkGrey,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Track the product',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
