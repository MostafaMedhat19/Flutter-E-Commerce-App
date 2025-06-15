import 'package:flutter/material.dart';
import 'package:mostafamedhatmostafa0522019/proviedrs/account_provider.dart';
import 'package:mostafamedhatmostafa0522019/screens/OrderCart_page.dart';
import 'package:mostafamedhatmostafa0522019/services/addtocart_service.dart';
import 'package:provider/provider.dart';
import 'detials_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Map<String, dynamic>> orders = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderCartPage(orders: orders)),
          );
        },
        backgroundColor: const Color(0xFFF7CA00),
        child: const Icon(Icons.shopping_cart_outlined),
      ),
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 1,
        centerTitle: true,
        title: Image.asset(
          'lib/Assets/amazon_logo.png',
          height: 100,
          width: 120,
        ),
        actions: const [
          SizedBox(width: 12),
          Icon(Icons.shopping_cart_outlined, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Consumer<AccountProvider>(
        builder: (context, provider, child) {
          final data = provider.dataProducts?.productsData;

          if (data == null) {
            provider.getProduct();
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final product = data[index];
                final String name = product['name'] ?? '';
                final double price = (product['price'] ?? 0).toDouble();
                final String imageUrl = product['imageUrl'] ?? '';

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailsPage(index: index)),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1.0,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.error)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(
                            name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "\$${price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              final cartItem = {
                                "name": name,
                                "price": price,
                                "image": imageUrl
                              };

                              if (!orders.contains(cartItem)) {
                                setState(() {
                                  orders.add(cartItem);
                                });

                                AddToCartService.addCart(name, price.toString());

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Added to cart")),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Already in cart")),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF7CA00),
                              foregroundColor: Colors.black,
                              minimumSize: const Size.fromHeight(40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: const Text('Add to Cart'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
