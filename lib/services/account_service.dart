import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mostafamedhatmostafa0522019/models/account_model.dart';

import '../models/product_model.dart';

class AccountServices {
  static Dio dio = Dio();
  static Future<ProductModel>getProductdata()async
  {
     try
         {

           Response response = await dio.get('https://student.valuxapps.com/api/home');
            if(response.statusCode ==200) {
              return ProductModel.formJson(response.data);
            }
            else
              {
                throw Exception(response.statusCode);
              }

         }
         catch(e)
    {
      throw 'error $e';
    }
  }
  static Future<void>registrationData(  {required  name  , required password , required phone ,required email })async
  {
     await dio.post('https://student.valuxapps.com/api/register', data: {'name':name , 'password': password ,
     'phone': phone , 'email': email});
  }
  static Future<void>loginData({required  email  , required password })async
  {
    await dio.post('https://student.valuxapps.com/api/login' ,data:{'email':email , 'password': password } );

  }

}
