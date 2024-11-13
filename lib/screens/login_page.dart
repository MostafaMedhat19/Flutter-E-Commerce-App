import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mostafamedhatmostafa0522019/proviedrs/account_provider.dart';

import 'package:provider/provider.dart';

import 'HomePage.dart';

class LoginPage extends StatelessWidget {

  TextEditingController _emailcontroller =TextEditingController();
  TextEditingController _passwordcontroller =TextEditingController();
  var  formKey =  GlobalKey<FormState>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var providerObject = Provider.of<AccountProvider>(context ,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPage' ),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: [Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(Icons.settings),
        )],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const   CircleAvatar(
                        backgroundImage: AssetImage('lib/Assets/Work-fatigue.jpg' ),
                      ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller:  _emailcontroller,
                      validator: (value)
                      {
                        if(value == null || value.isEmpty )
                        {
                          return 'Email is Required';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Your Email',
                          suffixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),

                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller:  _passwordcontroller,
                      validator: (value)
                      {
                        if(value == null || value.isEmpty )
                        {
                          return 'Password is Required';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Your Password',
                          suffixIcon: const Icon(Icons.password),
                          border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                      ),

                    ),
                    const SizedBox(height: 10,),
                    Center(
                      child: Consumer<AccountProvider>(
                        builder: (BuildContext context, value, Widget? child)
                        => MaterialButton(onPressed: (){
                          if(formKey.currentState!.validate() && value.status == true)
                          {
                             value.Login(email: _emailcontroller.text, password: _passwordcontroller.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const Homepage()));



                          }
                        }, child: const Text('Login')),

                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Do not have an account?', textAlign: TextAlign.center,),
                          Consumer<AccountProvider>(
                            builder: (BuildContext context, value, Widget? child) => TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child:const Text('Register')),

                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
