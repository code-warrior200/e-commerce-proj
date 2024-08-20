// checkout_screen.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CheckoutScreen({required this.cartItems});

  void _showPaymentOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Payment Method'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.account_balance),
                title: Text('Bank Transfer'),
                onTap: () {
                  Navigator.pop(context);
                  _handlePayment('Bank Transfer');
                },
              ),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Card Payment'),
                onTap: () {
                  Navigator.pop(context);
                  _handlePayment('Card Payment');
                },
              ),
              ListTile(
                leading: Icon(Icons.phone_android),
                title: Text('USSD Payment'),
                onTap: () {
                  Navigator.pop(context);
                  _handlePayment('USSD Payment');
                },
              ),
              ListTile(
                leading: Icon(Icons.phone_iphone),
                title: Text('Mobile Money'),
                onTap: () {
                  Navigator.pop(context);
                  _handlePayment('Mobile Money');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _handlePayment(String paymentMethod) {
    // Implement payment processing logic here
    if (kDebugMode) {
      print('Selected Payment Method: $paymentMethod');
    }
    // Navigate to payment processing screen or show confirmation
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(
      0,
      (sum, item) => sum + item['price'] * (item['quantity'] ?? 1),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(
                        item['image'],
                        fit: BoxFit.cover,
                        width: 50,
                      ),
                      title: Text(item['title']),
                      subtitle: Text(
                        '\$${item['price']} x ${item['quantity'] ?? 1}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showPaymentOptionsDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blueAccent,
                  elevation: 8,
                  shadowColor: Colors.blueAccent.withOpacity(0.5),
                ),
                child: Text(
                  'Complete Purchase',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
