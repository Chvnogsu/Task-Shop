import 'package:task_shop/app_properties.dart';
import 'package:task_shop/screens/faq_page.dart';
import 'package:task_shop/screens/payment/payment_page.dart';
import 'package:task_shop/screens/settings/settings_page.dart';
import 'package:task_shop/screens/tracking_page.dart';
import 'package:task_shop/screens/wallet/wallet_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isBlueBackground = false;

  void showPhoneNumberDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Help & Support'),
          content: GestureDetector(
            onTap: () {},
            child: Text(
              '1800-123-4567',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isBlueBackground ? Colors.blue : Colors.white,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Switch(
                      value: isBlueBackground,
                      onChanged: (value) {
                        setState(() {
                          isBlueBackground = value;
                        });
                      },
                      activeColor: Colors.blue,
                      inactiveTrackColor: Colors.grey[300],
                      inactiveThumbColor: Colors.white,
                    ),
                  ],
                ),
                CircleAvatar(
                  maxRadius: 48,
                  backgroundImage: AssetImage('assets/avatar.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Chanda Kalombo',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: transparent,
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  height: 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/icons/wallet.png'),
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => WalletPage())),
                            ),
                            Text(
                              'Wallet',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/icons/truck.png'),
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => TrackingPage())),
                            ),
                            Text(
                              'Shipped',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/icons/card.png'),
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => PaymentPage())),
                            ),
                            Text(
                              'Payment',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/icons/contact_us.png'),
                              onPressed: () => showPhoneNumberDialog(context),
                            ),
                            Text(
                              'Support',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Settings'),
                  subtitle: Text('Privacy and logout'),
                  leading: Image.asset(
                    'assets/icons/settings_icon.png',
                    fit: BoxFit.scaleDown,
                    width: 30,
                    height: 30,
                  ),
                  trailing: Icon(Icons.chevron_right, color: Colors.black),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => SettingsPage())),
                ),
                Divider(),
                ListTile(
                  title: Text('Help & Support'),
                  subtitle: Text('Help center and legal support'),
                  leading: Image.asset('assets/icons/support.png'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ),
                  onTap: () => showPhoneNumberDialog(context),
                ),
                Divider(),
                ListTile(
                  title: Text('FAQ'),
                  subtitle: Text('Questions and Answer'),
                  leading: Image.asset('assets/icons/faq.png'),
                  trailing: Icon(Icons.chevron_right, color: Colors.black),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => FaqPage())),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
