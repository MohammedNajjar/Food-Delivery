import 'package:flutter/material.dart';
import 'package:monkey_app_demo/utils/helper.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/introScreen";
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int count = 0;
  final List<Map<String, String>> _pages = [
    {
      "title": "Find Food You Love",
      "desc": "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep",
      "image": "assets/images/intro1.png",
    },
    {
      "title": "Fast Delivery",
      "desc": "Fast food delivery to your home, office wherever you are",
      "image": "assets/images/intro2.png",
    },
    {
      "title": "Live Tracking",
      "desc": "Real time tracking of your food on the app once you placed the order",
      "image": "assets/images/intro3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    count = value;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(_pages[index]["image"]!),
                      const SizedBox(height: 20),
                      Text(
                        _pages[index]["title"]!,
                        style: Helper.getTheme(context).titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _pages[index]["desc"]!,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  _pages.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: count == index ? 30 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: count == index ? Colors.orange : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (count == _pages.length - 1) {
                  Navigator.of(context).pushReplacementNamed('/login');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                count == _pages.length - 1 ? "Get Started" : "Next",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
