import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mostafamedhatmostafa0522019/models/account_model.dart';

import '../models/product_model.dart';

class AccountServices {
  static Map<String,dynamic> dataShopping ={ "name" : "", "phone":""};
  static Dio dio = Dio();
  static Future<ProductModel>getProductdata()async
  {
     try
         {

           Response response = await dio.get('https://elsewedyteam.runasp.net/api/Product/GetProducts');
            if(response.statusCode ==200) {
              return ProductModel.formJson(response.data);
            }
            else
              {
                throw Exception(response.statusCode.toString());
              }

         }
         catch(e)
    {
      throw 'error $e';
    }
  }
  static Future<AccountModel>registrationData(  {required  name  , required password , required phone ,required email })async
  {
    try
    {
      Response response = await dio.post('https://elsewedyteam.runasp.net/api/Register/AddUser',
          data:{'Email' : email , 'Password' : password , 'Name' :name , 'Phone': phone} );

      print("Service : ${response.data['status'].toString()}");
      print("Service : ${response.data['message'].toString()}");
      if(response.statusCode !=200)
        {
           print(response.statusCode.toString());
        }
       dataShopping['phone'] = phone;
       dataShopping['name'] = name ;
      return  AccountModel.fromJson(response.data);

    }
    catch(ex)
    {
      print(ex);
      throw Exception('Something went wrong');

    }
  }

  static Future<AccountModel>loginData({required  email  , required password })async
  {
    try
    {
      Response response = await dio.post('https://elsewedyteam.runasp.net/api/Login/CheckUser',
          data:{'Email' : email , 'Password' : password} );


      print("Service : ${response.data['status'].toString()}");
      print("Service : ${response.data['message'].toString()}");
      return  AccountModel.fromJson(response.data);


    }
    catch(ex)
    {
      print(ex);
      throw Exception('Something went wrong');

    }

  }

}
