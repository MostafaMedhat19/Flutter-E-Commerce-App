import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mostafamedhatmostafa0522019/proviedrs/account_provider.dart';
import 'HomePage.dart';
import 'login_page.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final providerObject = Provider.of<AccountProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'lib/Assets/amazon_logo.png', // Make sure this asset exists
                height: 120,
                width: 180,
              ),
              const SizedBox(height: 10),

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Create account",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),

                        TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: 'Your Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                          (value == null || value.isEmpty) ? 'Name is required' : null,
                        ),
                        const SizedBox(height: 12),

                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                          (value == null || value.isEmpty) ? 'Phone is required' : null,
                        ),
                        const SizedBox(height: 12),

                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                          (value == null || value.isEmpty) ? 'Email is required' : null,
                        ),
                        const SizedBox(height: 12),

                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) =>
                          (value == null || value.isEmpty) ? 'Password is required' : null,
                        ),
                        const SizedBox(height: 24),

                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              providerObject.Registration(
                                name: _nameController.text,
                                password: _passwordController.text,
                                phone: _phoneController.text,
                                email: _emailController.text,
                              );
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (_) =>  Homepage()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF7CA00), // Amazon yellow
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                          child: const Text('Sign Up'),
                        ),
                        const SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => LoginPage()));
                              },
                              child: const Text('Login'),
                            )
                          ],
                        ),
                      ],
                    ),
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
