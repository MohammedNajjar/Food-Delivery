import 'package:flutter/material.dart';
import 'package:monkey_app_demo/screens/forgetPwScreen.dart';
import 'package:monkey_app_demo/screens/signUpScreen.dart';
import 'package:monkey_app_demo/utils/helper.dart';
import 'package:monkey_app_demo/const/colors.dart';
import '../widgets/customTextInput.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/loginScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 30,
              ),
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: Helper.getTheme(context).headlineLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Add your details to login'),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextInput(
                    hintText: "Your email",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextInput(
                    hintText: "password",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Login"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(ForgetPwScreen.routeName);
                    },
                    child: Text("Forgot your password?"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("or"),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image.asset(
                              Helper.getAssetName("fb.png", "virtual"),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Flexible(
                            child: Text("Login with Facebook"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image.asset(
                              Helper.getAssetName("google.png", "virtual"),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Flexible(
                            child: Text("Login with Google"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignUpScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an Account? "),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: AppColor.orange,
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
        ),
      ),
    );
  }
}
