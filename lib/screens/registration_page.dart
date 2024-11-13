import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mostafamedhatmostafa0522019/proviedrs/account_provider.dart';
import 'package:mostafamedhatmostafa0522019/screens/HomePage.dart';
import 'package:mostafamedhatmostafa0522019/screens/login_page.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatelessWidget {
  TextEditingController _namecontroller =TextEditingController();
  TextEditingController _phonecontroller =TextEditingController();
  TextEditingController _emailcontroller =TextEditingController();
  TextEditingController _passwordcontroller =TextEditingController();
     var  formKey =  GlobalKey<FormState>();
   RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    var providerObject = Provider.of<AccountProvider>(context ,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page' ),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [Padding(
          padding: EdgeInsets.all(15.0),
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
                    const SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller:  _namecontroller,
                      validator: (value)
                      {
                        if(value == null || value.isEmpty )
                          {
                            return 'Name is Required';
                          }
                      },
                      decoration:  InputDecoration(
                        labelText: 'Your Name',
                        suffixIcon: Icon(Icons.account_circle),

                          border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                      ),

                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller:  _phonecontroller,
                      validator: (value)
                      {
                        if(value == null || value.isEmpty )
                        {
                          return 'Phone is Required';
                        }
                      },
                      decoration:  InputDecoration(
                          labelText: 'Your Phone',
                          suffixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),

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
                          suffixIcon: Icon(Icons.email),
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
                          suffixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                          )

                      ),

                    ),
                    const SizedBox(height: 10,),
                    Center(
                      child: MaterialButton(onPressed: (){
                        if(formKey.currentState!.validate())
                          {
                             providerObject.Registration(name: _namecontroller.text, password: _passwordcontroller.text, phone: _phonecontroller.text, email: _emailcontroller.text);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()));
                          }
                      }, child: const Text('Sign Up')),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have account ?'),
                          TextButton(onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>
                                  LoginPage()
                                ));
                          }, child:const Text('Login'))
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
