import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const   Text(
            'Lets Begin',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Please Enter your credentials to proceed',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType : TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'email',
                    hintText: 'Enter email',
            
                  ),
                  onChanged:(String value){
            
                  },
                  validator:(value){
                    return value!.isEmpty ? 'Please enter email':null;
                  }
                  ),
                  const SizedBox(height: 30,),
                  TextFormField(
                    keyboardType : TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
            
                  ),
                  onChanged:(String value){
            
                  },
                  validator:(value){
                    return value!.isEmpty ? 'Please enter password':null;
                  }
                  ),
                  const SizedBox(height: 30,),
                  TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Referral Code',
                    hintText: 'Referral Code (Optional)',
            
                  ),
                  onChanged:(String value){
            
                  },
                  validator:(value){
                    return value!.isEmpty ? 'Please enter password':null;
                  }
                  )
                  
                ],
            
              ),
            ),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing...')),
            );
          }
        },
        tooltip: 'Proceed',
        child: const Icon(Icons.arrow_forward), 
      ),
    );
  }
}
 