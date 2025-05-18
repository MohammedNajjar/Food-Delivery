import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/utils/helper.dart';
import 'package:monkey_app_demo/widgets/customNavBar.dart';

class OfferScreen extends StatelessWidget {
  static const routeName = "/offerScreen";
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Latest Offers",
                        style: Helper.getTheme(context).headlineSmall,
                      ),
                      Image.asset(
                        Helper.getAssetName("cart.png", "virtual"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Find discounts, offers special meals and more!",
                      style: Helper.getTheme(context).headlineMedium?.copyWith(
                        color: AppColor.primary,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: Helper.getScreenWidth(context) * 0.4,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text("Check Offers")),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  OfferCard(
                    image: Image.asset(
                      Helper.getAssetName("breakfast.jpg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Cafe de Noires",
                  ),
                  OfferCard(
                    image: Image.asset(
                      Helper.getAssetName("western2.jpg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Isso",
                  ),
                  OfferCard(
                    image: Image.asset(
                      Helper.getAssetName("coffee3.jpg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Cafe Beans",
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(offer: true),
          ),
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 200, width: double.infinity, child: image),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  name,
                  style: Helper.getTheme(context)
                      .headlineSmall
                      ?.copyWith(color: AppColor.primary),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Image.asset(
                  Helper.getAssetName("star_filled.png", "virtual"),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "4.9",
                  style: TextStyle(
                    color: AppColor.orange,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text("(124 ratings) Cafe"),
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    ".",
                    style: TextStyle(
                        color: AppColor.orange, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(" Western Food"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
