import 'package:dio/dio.dart';
import 'package:mostafamedhatmostafa0522019/services/account_service.dart';

class AddToCartService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://rfiddooraccess-default-rtdb.firebaseio.com/',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  static Future<void> addCart(String orderName, String orderPrice) async {
    final name = AccountServices.dataShopping['name'];
    final phone = AccountServices.dataShopping['phone'];

    if (name == null || phone == null || name.isEmpty || phone.isEmpty) {
      print("Error: Missing user information (name or phone)");
      return;
    }

    try {
      final data = {
        "name": name,
        "phone": phone,
        "order": {
          "name": orderName,
          "price": orderPrice,
        },
      };

      final response = await dio.post(
        'Users/Customer1.json',
        data: data,
      );

      if (response.statusCode == 200) {
        print("Order added successfully: ${response.data}");
      } else {
        print("Failed to add order: ${response.statusCode}");
      }
    } catch (e) {
      print("Error adding order: $e");
    }
  }
}
