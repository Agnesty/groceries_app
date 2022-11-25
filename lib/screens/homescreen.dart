import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app_with_firebase/model/card_model.dart';
import 'package:grocery_shop_app_with_firebase/screens/cartscreen.dart';
import 'package:grocery_shop_app_with_firebase/widget/groceryItem.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Agnesty Shop',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(
              Icons.person,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 255, 117, 19),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartScreen();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
      
            // welcome caption
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Selamat datang,'),
            ),
      
            const SizedBox(height: 4),
      
            // mengajak order
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Yuk, order! Masih Fresh...",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade700,
                ),
              ),
            ),
      
            const SizedBox(height: 24),
      
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(color: Colors.black54),
            ),
      
            const SizedBox(height: 24),
      
            // categories -> horizontal listview
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Makanan",
                style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
      
            // recent orders -> show last 3
            Flexible(
              fit: FlexFit.loose,
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(12),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.shopItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.2,
                    ),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () =>
                            Provider.of<CartModel>(context, listen: false)
                                .addItemToCart(index),
                      );
                    },
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
