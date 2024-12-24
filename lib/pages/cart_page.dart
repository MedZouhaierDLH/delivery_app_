import 'package:flutter/material.dart';
import 'package:platterpath2/components/my_button.dart';
import 'package:platterpath2/components/my_cart_tile.dart';
import 'package:platterpath2/models/restaurant.dart';
import 'package:platterpath2/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // cart
        final userCart = restaurant.cart;

        // scaffold UI
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
              title: Text(
                "Cart",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),

            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // clear cart button
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Are you sure you want to clear the cart?"),
                      actions: [
                        // cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),

                        // yes button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            restaurant.clearCart();
                          },
                          child: const Text("Yes"),
                        ),

                      ],
                    )
                  );
                },
              ),
            ],
          ),
          body: Column(
            children: [

              // list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(child: Center(child: Text("Cart is empty .."),),)
                        :Expanded(
                          child: ListView.builder(
                            itemCount: userCart.length,
                            itemBuilder: (context, index) {
                              // get individual cart item
                              final cartItem = userCart[index];

                              // return cart tile UI
                              return MyCartTile(cartItem: cartItem);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // button to pay
              MyButton(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage())),
                  text: "Go to checkout"
              ),

              const SizedBox(height: 25,),

            ],
          ),

        );
      },
    );
  }
}
