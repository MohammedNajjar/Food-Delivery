import 'package:flutter/material.dart';
import 'package:monkey_app_demo/screens/changeAddressScreen.dart';

import './screens/spashScreen.dart';
import './screens/landingScreen.dart';
import './screens/loginScreen.dart';
import './screens/signUpScreen.dart';
import './screens/forgetPwScreen.dart';
import './screens/sentOTPScreen.dart';
import './screens/newPwScreen.dart';
import './screens/introScreen.dart';
import './screens/homeScreen.dart';
import './screens/menuScreen.dart';
import './screens/moreScreen.dart';
import './screens/offerScreen.dart';
import './screens/profileScreen.dart';
import './screens/dessertScreen.dart';
import './screens/individualItem.dart';
import './screens/paymentScreen.dart';
import './screens/notificationScreen.dart';
import './screens/aboutScreen.dart';
import './screens/inboxScreen.dart';
import './screens/myOrderScreen.dart';
import './screens/checkoutScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        LandingScreen.routeName: (context) => const LandingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        ForgetPwScreen.routeName: (context) => ForgetPwScreen(),
        SentOTPScreen.routeName: (context) => SentOTPScreen(),
        NewPwScreen.routeName: (context) => NewPwScreen(),
        IntroScreen.routeName: (context) => const IntroScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
        OfferScreen.routeName: (context) => OfferScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        MoreScreen.routeName: (context) => MoreScreen(),
        DessertScreen.routeName: (context) => DessertScreen(),
        IndividualItem.routeName: (context) => IndividualItem(),
        PaymentScreen.routeName: (context) => PaymentScreen(),
        NotificationScreen.routeName: (context) => NotificationScreen(),
        AboutScreen.routeName: (context) => AboutScreen(),
        InboxScreen.routeName: (context) => InboxScreen(),
        MyOrderScreen.routeName: (context) => MyOrderScreen(),
        CheckoutScreen.routeName: (context) => CheckoutScreen(),
        ChangeAddressScreen.routeName: (context) => ChangeAddressScreen(),
      },
    );
  }
}
