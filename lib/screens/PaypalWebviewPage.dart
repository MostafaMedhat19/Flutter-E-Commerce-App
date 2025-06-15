import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class PaypalPaymentButton extends StatelessWidget {
  final List<Map<String, dynamic>> orders;
  final double totalPrice;

  const PaypalPaymentButton({
    super.key,
    required this.orders,
    required this.totalPrice,
  });

  List<Map<String, dynamic>> buildPaypalItems() {
    return orders.map((item) {
      return {
        "name": item['name'],
        "quantity": 1,
        "price": item['price'].toString(),
        "currency": "USD",
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (orders.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaypalCheckoutView(
                sandboxMode: true,
                clientId: "xxxx",
                secretKey: "xxx",
                transactions: [
                  {
                    "amount": {
                      "total": totalPrice.toStringAsFixed(2),
                      "currency": "USD",
                      "details": {
                        "subtotal": totalPrice.toStringAsFixed(2),
                        "shipping": '0',
                        "shipping_discount": 0
                      }
                    },
                    "description": "Order payment",
                    "item_list": {
                      "items": buildPaypalItems(),
                    }
                  }
                ],
                note: "Thank you for your order.",
                onSuccess: (Map params) async {
                  log("onSuccess: $params");
                  Navigator.pop(context);
                },
                onError: (error) {
                  log("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  log("Payment cancelled");
                  Navigator.pop(context);
                },
              ),
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
    );
  }
}
