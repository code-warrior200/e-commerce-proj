// cart_item_screen.dart
import 'package:ecommerce_app/Screens/CheckoutScreen.dart';
import 'package:flutter/material.dart';

class CartItemScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final void Function(int index) onDeleteItem;

  const CartItemScreen({required this.cartItems, required this.onDeleteItem});

  @override
  _CartItemScreenState createState() => _CartItemScreenState();
}

class _CartItemScreenState extends State<CartItemScreen> {
  late List<Map<String, dynamic>> _cartItems;

  @override
  void initState() {
    super.initState();
    _cartItems = List.from(widget.cartItems); // Create a copy of the cartItems list
  }

  void _handleDelete(int index) {
    setState(() {
      widget.onDeleteItem(index); // Call the delete function from the parent
      _cartItems.removeAt(index); // Remove item from the local list
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = _cartItems.fold(
      0,
      (sum, item) => sum + item['price'] * (item['quantity'] ?? 1),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: _cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      final item = _cartItems[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.redAccent),
                            onPressed: () {
                              _handleDelete(index);  // Call the local delete function
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Total: \$${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(
                            cartItems: _cartItems,
                          ),
                        ),
                      );
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
                      'Checkout',
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
    );
  }
}
