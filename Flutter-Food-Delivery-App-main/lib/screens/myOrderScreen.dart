import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/screens/checkoutScreen.dart';
import 'package:monkey_app_demo/utils/helper.dart';
import 'package:monkey_app_demo/widgets/customNavBar.dart';

class MyOrderScreen extends StatelessWidget {
  static const routeName = "/myOrderScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "My Order",
                        style: Helper.getTheme(context).titleLarge,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Image.asset(
                              Helper.getAssetName("hamburger.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "King Burgers",
                              style: Helper.getTheme(context).displayLarge,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  Helper.getAssetName(
                                    "star_filled.png",
                                    "virtual",
                                  ),
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
                                Text(" (124 ratings)"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Burger"),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    ".",
                                    style: TextStyle(
                                      color: AppColor.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text("Western Food"),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 15,
                                  child: Image.asset(
                                    Helper.getAssetName(
                                      "loc.png",
                                      "virtual",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("No 03, 4th Lane, Newyork")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  color: AppColor.placeholderBg,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        BurgerCard(
                          name: "Beef Burger",
                          price: "16",
                        ),
                        BurgerCard(
                          name: "Classic Burger",
                          price: "14",
                        ),
                        BurgerCard(
                          name: "Cheese Chicken Burger",
                          price: "17",
                        ),
                        BurgerCard(
                          name: "Chicken Legs Basket",
                          price: "15",
                        ),
                        BurgerCard(
                          name: "French Fries Large",
                          price: "6",
                          isLast: true,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColor.placeholder.withOpacity(0.25),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Delivery Instruction",
                                style: Helper.getTheme(context).displayLarge,
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: AppColor.orange,
                                    ),
                                    Text(
                                      "Add Notes",
                                      style: TextStyle(
                                        color: AppColor.orange,
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Sub Total",
                              style: Helper.getTheme(context).displayLarge,
                            ),
                          ),
                          Text(
                            "\$68",
                            style: Helper.getTheme(context).displayLarge!.copyWith(
                                  color: AppColor.orange,
                                ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Delivery Cost",
                              style: Helper.getTheme(context).displayLarge,
                            ),
                          ),
                          Text(
                            "\$2",
                            style: Helper.getTheme(context).displayLarge!.copyWith(
                                  color: AppColor.orange,
                                ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: AppColor.placeholder.withOpacity(0.25),
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Total",
                              style: Helper.getTheme(context).displayLarge,
                            ),
                          ),
                          Text(
                            "\$70",
                            style: Helper.getTheme(context).displayLarge!.copyWith(
                                  color: AppColor.orange,
                                  fontSize: 22,
                                ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(CheckoutScreen.routeName);
                          },
                          child: Text("Checkout"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(),
          ),
        ],
      ),
    );
  }
}

class BurgerCard extends StatelessWidget {
  final String name;
  final String price;
  final bool isLast;

  const BurgerCard({
    Key? key,
    required this.name,
    required this.price,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: isLast
              ? BorderSide.none
              : BorderSide(
                  color: AppColor.placeholder.withOpacity(0.25),
                ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "${name} x1",
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            "\$$price",
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
    );
  }
}
