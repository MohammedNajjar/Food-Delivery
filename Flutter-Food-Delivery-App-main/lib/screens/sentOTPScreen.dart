import 'package:flutter/material.dart';


import '../utils/helper.dart';
import './newPwScreen.dart';

class SentOTPScreen extends StatelessWidget {
  static const routeName = "/sentOTPScreen";
  const SentOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Sent OTP",
                    style: Helper.getTheme(context).titleMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "We have sent a 4-digit code to your mobile number",
                style: Helper.getTheme(context).titleSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OTPInput(),
                  OTPInput(),
                  OTPInput(),
                  OTPInput(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(NewPwScreen.routeName);
                  },
                  child: const Text("Next"),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Didn't receive the code? "),
                    Text(
                      "Click Here",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OTPInput extends StatelessWidget {
  const OTPInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          TextField(
            decoration: InputDecoration(border: InputBorder.none),
            style: Helper.getTheme(context).titleLarge,
            textAlign: TextAlign.center,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 1,
            child: Container(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
