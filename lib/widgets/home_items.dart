
import 'package:flutter/material.dart';
import 'package:mostafamedhatmostafa0522019/proviedrs/account_provider.dart';
import 'package:mostafamedhatmostafa0522019/screens/detials_page.dart';
import 'package:provider/provider.dart';

class HomeItems extends StatelessWidget {
  final index;
  const HomeItems({
    super.key, required this.index,
    });

  @override
  Widget build(BuildContext context) {
    var providerObject = Provider.of<AccountProvider>(context,listen: false);

    return Card(

      shadowColor: Colors.black,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){


            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> DetailsPage(index: index,)));


          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network( providerObject.dataProducts?.productsData[index]['image']),

                      Text(providerObject.dataProducts?.productsData[index]['name'], style:const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10,),
                      Text('${providerObject.dataProducts?.productsData[index]['price']}', style:const TextStyle(
                  
                        color: Colors.grey,
                      ),
                        textAlign: TextAlign.center,
                      ),
                  
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
