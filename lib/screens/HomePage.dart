import 'package:flutter/material.dart';
import 'package:mostafamedhatmostafa0522019/proviedrs/account_provider.dart';
import 'package:mostafamedhatmostafa0522019/widgets/home_items.dart';
import 'package:provider/provider.dart';

import 'detials_page.dart';

class Homepage extends StatelessWidget {
 
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page' ),
        centerTitle: true,
      ),
      body: Consumer<AccountProvider>(
        builder: ( context,  value,  child) {

            var dataValue = value.dataProducts?.productsData;

           if(dataValue == null  )
             {
               value.getProduct();
               return const Center(
                 child: CircularProgressIndicator(),
               );
             }
           else
             {



               return GridView.builder(
                   gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       mainAxisSpacing: 20,
                       crossAxisSpacing: 50,
                   ),
                 itemBuilder: (context,index)=> HomeItems(index: index,)

               );
             }
        },),
    );
  }
}
