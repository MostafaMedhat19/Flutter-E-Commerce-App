class ProductModel {
  List<dynamic>productsData ;
   ProductModel({ required this.productsData });
   factory ProductModel.formJson(Map<String,dynamic>json)
   {
     try{
       return ProductModel(productsData: json['response'] );
     }
     catch(e)
     {
        throw 'Error $e';
     }

   }

}
