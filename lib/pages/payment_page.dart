import 'package:flutter/material.dart';
import 'package:credit_card_form/credit_card_form.dart'; // Updated import
import 'package:platterpath2/components/my_button.dart';
import 'package:platterpath2/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';

  // user wants to pay
  void userTappedPay() {
    if (cardNumber.isNotEmpty &&
        expiryDate.isNotEmpty &&
        cardHolderName.isNotEmpty &&
        cvvCode.isNotEmpty) {
      // only show dialog if form is valid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder name: $cardHolderName"),
                Text("CVV: $cvvCode")
              ],
            ),
          ),
          actions: [
            // cancel button
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                )), // Cancel action

            // yes button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryProgressPage(),
                  ),
                );
              },
              child: Text("Yes"),
            )
          ],
        ),
      );
    } else {
      // Optionally, you can show a message if the form isn't complete.
      print("Please complete the form!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Checkout",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView( // Makes the body scrollable
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Credit Card Icon (for visual interest)
            Center(
              child: Icon(
                Icons.credit_card,
                size: 100,
                color: Theme.of(context).primaryColor,
              ),
            ),

            const SizedBox(height: 20),

            // Card Form Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: CreditCardForm(
                onChanged: (CreditCardResult result) {
                  setState(() {
                    cardNumber = result.cardNumber;
                    expiryDate =
                    '${result.expirationMonth}/${result.expirationYear}';
                    cardHolderName = result.cardHolderName;
                    cvvCode = result.cvc;
                  });
                },
                theme: CreditCardLightTheme(), // Use a predefined theme
              ),
            ),

            const SizedBox(height: 30),

            // Divider (Optional Decorative Line)
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),

            const SizedBox(height: 20),

            // Custom button for payment with icon
            MyButton(
              onTap: userTappedPay,
              text: "Pay Now",
              // Payment icon
            ),

            const SizedBox(height: 20),

            // Additional decorative element (simple dotted line)
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 30),
              painter: DottedLinePainter(),
            ),

            const SizedBox(height: 25),

            // Footer section with small text or helpful icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(width: 5),
                const Text(
                  'Secure Payment',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for dotted lines
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double dashWidth = 5;
    double dashSpace = 3;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
