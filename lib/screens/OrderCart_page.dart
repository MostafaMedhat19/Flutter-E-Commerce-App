import 'package:flutter/material.dart';
import '../widgets/row_cart.dart';
import 'PaypalWebviewPage.dart'; // <--- import the widget

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
                  orders: orders, onRemove: () {  },
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
                // 👇 Use the new reusable PayPal button
                PaypalPaymentButton(
                  orders: orders,
                  totalPrice: totalPrice,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
