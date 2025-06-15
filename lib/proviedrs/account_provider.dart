import 'package:flutter/material.dart';
import 'package:mostafamedhatmostafa0522019/models/account_model.dart';
import 'package:mostafamedhatmostafa0522019/models/product_model.dart';
import 'package:mostafamedhatmostafa0522019/services/account_service.dart';

class AccountProvider extends ChangeNotifier
{
  AccountModel? modl;
  bool? status ;
  ProductModel? dataProducts ;
  Future<void>Registration( {required  name  , required password , required phone ,required email })async
  {
    modl=  await AccountServices.registrationData(name: name, password: password, phone: phone, email: email);
    status = modl?.status;
    notifyListeners();
  }




  Future<void> Login({required email, required password}) async {
    try {
      modl = await AccountServices.loginData(email: email, password: password);
      status = modl?.status;
      notifyListeners();
    } catch (e) {
      print("Login Error: $e");
      rethrow;
    }
  }


  Future<void>getProduct()async
  {
    dataProducts= await AccountServices.getProductdata();
    notifyListeners();
  }
}
