import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mostafamedhatmostafa0522019/proviedrs/account_provider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  final index ;
   const DetailsPage(
       {
         super.key, required this.index,

       });

  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<AccountProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details'), centerTitle:  true,),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.network(obj.dataProducts?.productsData[index]['image']),
              ),
              Text(obj.dataProducts?.productsData[index]['name'] ,
                style:
                const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ) ,
                textAlign: TextAlign.center,),
              Text(
                obj.dataProducts?.productsData[index]['description'],
                style:const TextStyle(
                  color: Colors.grey
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
