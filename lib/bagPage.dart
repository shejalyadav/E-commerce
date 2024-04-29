import 'package:ecommerce/detailPage.dart';
import 'package:flutter/material.dart';

class BagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], 
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              height: 30,
              width: 200,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Icon(Icons.account_circle),
              iconSize: 32,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GridView.count(
          shrinkWrap: true, // This will allow the grid view to scroll within the SingleChildScrollView
          physics: NeverScrollableScrollPhysics(), // This will disable the scroll behavior of the grid view
          crossAxisCount: 2,
          childAspectRatio: 4/6, // width/height
          children: [
            _buildGridItem(context, 'assets/images/bag1.webp', 'Shop Corporate & Casual Backpacks at Upto 74% OFF on Nasher Miles','2150.00'),
            _buildGridItem(context, 'assets/images/bag2.png', 'Loupin 18 inch Backpack - Black','1899.0'),
            _buildGridItem(context, 'assets/images/bag3.jpg', 'Buy Laptop Backpack for Women Computer','4664'),
            _buildGridItem(context, 'assets/images/bag4.jpg', ' Lightweight with compartment Waterproof Daypack','2499'),
            _buildGridItem(context, 'assets/images/bag5.webp', 'Unicorn Backpack for Children - School Bag for Student, School and Col','2199'),
            _buildGridItem(context, 'assets/images/bag6.webp', 'Mini Backpack Girls Small Backpack ' , '6499'),
            _buildGridItem(context, 'assets/images/bag7.jpg', 'Leather Backpacks, Travel Backpacks & Laptop Backpacks','7300'),
            _buildGridItem(context, 'assets/images/bag8.jpg', ' Women Mini Backpack Shoulder Bag PU Leather Backpack','3875'),
          ],
        ),
      ),
    );
  }

Widget _buildGridItem(BuildContext context, String imagePath, String text, String price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage()),
        );
      },
      child: Container(
       
        margin: EdgeInsets.all(16.0),
         padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 2),
            Text(
              text,
              maxLines: 3, 
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 1.5),
            Text(
              'Price: $price',
              style: TextStyle(fontSize: 18 , color: Color.fromARGB(255, 40, 196, 239)),
            ),
          ],
        ),
      ),
    );
  }
}

