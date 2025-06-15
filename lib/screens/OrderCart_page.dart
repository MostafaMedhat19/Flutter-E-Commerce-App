import 'package:flutter/material.dart';
import '../widgets/row_cart.dart';
import 'PaypalWebviewPage.dart';

class OrderCartPage extends StatelessWidget {
  final List<Map<String, dynamic>> orders;

  const OrderCartPage({super.key, required this.orders});

  double getTotalPrice() {
    return orders.fold(0, (sum, item) {
      final price = double.tryParse(item['price'].toString()) ?? 0;
      return sum + price;
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = getTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        backgroundColor: Color(0xFFF7CA00),
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final item = orders[index];
                return RowCart(
                  id: index,
                  name: item['name'],
                  image: item['image'],
                  price: item['price'].toString(),
                  onRemove: () {}, // Not functional in stateless
                  onPayWithPayPal: null, // We'll use one PayPal button at the bottom
                );
              },
            ),
          ),
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    if (orders.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: () {}

                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Cart is empty")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF003087),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "Pay with PayPal",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
