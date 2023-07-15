import 'package:task_shop/app_properties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<Panel> panels = [
    Panel(
      'HOW CAN I CHANGE MY SHIPPING ADDRESS?',
      'By default, the last used shipping address will be saved into your Sample Store account. When you are checking out your order, the default shipping address will be displayed and you have the option to amend it if you need to.',
      false,
    ),
    Panel(
      'WHAT PAYMENT METHODS DO YOU ACCEPT?',
      'We accept all major credit cards (Visa, Mastercard, American Express) as well as PayPal for secure online payments.',
      false,
    ),
    Panel(
      'HOW CAN I TRACK MY ORDER?',
      'Once your order is shipped, you will receive a tracking number and a link to track your order. You can use this information to track the status and location of your package.',
      false,
    ),
    Panel(
      'WHAT IS YOUR RETURN POLICY?',
      'We have a 30-day return policy. If you are not satisfied with your purchase, you can return the item(s) within 30 days of delivery for a refund or exchange. Please refer to our Returns & Refunds page for more information.',
      false,
    ),
    // Add more panels here...
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'FAQ',
          style: TextStyle(
            color: darkGrey,
          ),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: 16.0,
                ),
                child: Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              ...panels
                  .map(
                    (panel) => ExpansionTile(
                      title: Text(
                        panel.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          color: Color(0xffFAF1E2),
                          child: Text(
                            panel.content,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class Panel {
  String title;
  String content;
  bool expanded;

  Panel(this.title, this.content, this.expanded);
}
