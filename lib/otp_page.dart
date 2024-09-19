import 'dart:async';
import 'package:flutter/material.dart';
import 'package:machinetest/homepage.dart';

class OTPpage extends StatefulWidget {
  const OTPpage({super.key});

  @override
  State<OTPpage> createState() => _OTPpageState();
}

class _OTPpageState extends State<OTPpage> {
  bool invalidOtp = false;
  int resendTime = 60;
  late Timer countdownTimer;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        countdownTimer.cancel();
      }
    });
  }

  stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/', 
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'OTP Verification',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'We have sent a unique OTP number to your mobile 9011470243',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myInputBox(context, txt1),
                    myInputBox(context, txt2),
                    myInputBox(context, txt3),
                    myInputBox(context, txt4),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  invalidOtp ? 'Invalid OTP' : "",
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
                const SizedBox(
                  height: 40,
                ),
                resendTime == 0
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            invalidOtp = false;
                            resendTime = 60;
                            startTimer();
                          });
                        },
                        child: const Text(
                          'Send again',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : Text(
                        'Resend in $resendTime seconds',
                        style: const TextStyle(color: Colors.grey),
                      ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final otp =
                        txt1.text + txt2.text + txt3.text + txt4.text;
                    if (otp == '2005') {
                      stopTimer();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(title: '',),
                        ),
                      );
                    } else {
                      setState(() {
                        invalidOtp = true;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Verify'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget myInputBox(BuildContext context, TextEditingController controller) {
  return Container(
    height: 70,
    width: 60,
    decoration: BoxDecoration(
      border: Border.all(width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: TextField(
      controller: controller,
      textAlign: TextAlign.center,
      maxLength: 1,
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 42),
      decoration: const InputDecoration(
        counterText: "",
      ),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}
