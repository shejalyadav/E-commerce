import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://static.vecteezy.com/system/resources/previews/019/896/012/original/female-user-avatar-icon-in-flat-design-style-person-signs-illustration-png.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Shejal Yadav',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'shejal@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '8366483746',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Your Rank: Gold',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Our Coupons: 5',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Your Credits: \$50',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20), // Add some vertical spacing
            Divider(), // Add a line separator
             // Add some vertical spacing
            Flexible(
              child: Container(
                margin: EdgeInsets.all(20), // Add margin around the GridView
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    buildPaymentOption('Credit Card', 'assets/images/creditcard.png'),
                    buildPaymentOption('EvalyCredits', 'assets/images/evalyCredit.png'),
                    buildPaymentOption('EvalyCash', 'assets/images/evalyCash.png'),
                    buildPaymentOption('Super Coins', 'assets/images/supercoins.png'),
                    buildPaymentOption('Saved Cards', 'assets/images/savedcards.png'),
                    buildPaymentOption('Saved UPI', 'assets/images/savedupi.png'),
                    buildPaymentOption('Gift Cards', 'assets/images/giftcards.png'),
                    buildPaymentOption('Wallets/BNPL', 'assets/images/bnpl.png'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOption(String text, String imagePath) {
    return Column(
      children: [
        Image.asset(imagePath, height: 60), // Adjust image height as needed
        SizedBox(height: 5),
        Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
