import 'package:flutter/material.dart';

class RegisterTheNumber extends StatefulWidget {
  const RegisterTheNumber({super.key});

  @override
  State<RegisterTheNumber> createState() => _RegisterTheNumberState();
}

class _RegisterTheNumberState extends State<RegisterTheNumber> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Glad To See You!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please provide your phone number',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "+91", 
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Enter phone number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Send Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
