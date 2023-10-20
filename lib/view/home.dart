import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:project/controller/product_controller.dart';
import 'package:project/view/login.dart';
import 'package:project/view/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: camel_case_types
class pro extends StatefulWidget {
  const pro({Key? key}) : super(key: key);

  @override
  State<pro> createState() => _proState();
}

// ignore: camel_case_types
class _proState extends State<pro> {
  int activeIndex = 0;
  final controller = CarouselController();
  final productcontroller = Get.put(ProductController());
  // ignore: non_constant_identifier_names
  final AssetImage = [
    'assets/Dell.jpg',
    'assets/Acer.jpg',
    'assets/Mac.jpg',
    'assets/Samsung.jpg',
    'assets/Prestigio.jpg',
    'assets/Surface.jpg',
  ];

  @override
  void initState() {
    productcontroller.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 40, 35),
      /*backgroundColor: Colors.white,*/
      body: Column(
        children: [
          Flexible(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: const Icon(Icons.arrow_circle_left),
                      tooltip: 'LOGOUT',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const chris()));
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.clear();
                                  },
                                  child: const Text("YES")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("NO")),
                            ],
                            title: const Text(
                              "ARE YOU SURE TO LOGOUT?",
                              style: TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        );
                      },
                      color: Colors.white),
                  const Text(
                    "TECHIES",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                      icon: const Icon(Icons.person),
                      tooltip: 'USER ACCOUNT',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => chat()));
                                  },
                                  child: const Text("YES")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("NO")),
                            ],
                            title: const Text(
                              "USER ACCOUNT SETTINGS",
                              style: TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(20.0),
                            content:
                                const Text("WANT TO UPDATE OR DELETE ACCOUNT?"),
                          ),
                        );
                      },
                      color: Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: CarouselSlider.builder(
                carouselController: controller,
                itemCount: AssetImage.length,
                itemBuilder: (context, index, realIndex) {
                  final Image = AssetImage[index];
                  return buildImage(Image, index);
                },
                options: CarouselOptions(
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    enlargeCenterPage: true,
                    height: 220,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    viewportFraction: 0.3,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index))),
          ),
          const SizedBox(height: 15),
          buildIndicator(),
          const SizedBox(height: 15),
          Flexible(
            flex: 8,
            child: ListView(shrinkWrap: true, children: [
              const SizedBox(height: 15),
              Container(
                  width: 150,
                  height: 155,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                          width: 250,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/Dell.jpg',
                              fit: BoxFit.cover,
                            ),
                          )),
                      Expanded(
                        // flex: 4,
                        child: Container(
                          height: 205,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'DELL',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "16GB RAM | 256GB SSD | WINDOWS 11 | i5 PROCESSOR",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const Text(
                                "PRICE: RS.45,000",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 5),
                              ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.shopping_cart),
                                  label: const Text('ADD TO CART')),
                            ],
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 15),
              Container(
                  width: 150,
                  height: 155,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                          width: 250,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/Acer.jpg',
                              fit: BoxFit.cover,
                            ),
                          )),
                      Expanded(
                          // flex: 4,
                          child: Container(
                        height: 205,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'ACER',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "8GB RAM | 512GB SSD | WINDOWS 12 | i5 PROCESSOR",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              "PRICE: RS.50,000",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.shopping_cart),
                                label: const Text('ADD TO CART')),
                          ],
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ))
                    ],
                  )),
              const SizedBox(height: 15),
              Container(
                  width: 150,
                  height: 155,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                          width: 250,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/Mac.jpg',
                              fit: BoxFit.cover,
                            ),
                          )),
                      Expanded(
                          // flex: 4,
                          child: Container(
                        height: 205,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'APPLE MACBOOK PRO',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "8GB RAM | i5 PROCESSOR | 256GB RAM",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              "PRICE: RS.65,000",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.shopping_cart),
                                label: const Text('ADD TO CART')),
                          ],
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ))
                    ],
                  )),
              const SizedBox(height: 15),
              Container(
                  width: 150,
                  height: 155,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                          width: 250,
                          // height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/Samsung.jpg',
                              fit: BoxFit.cover,
                            ),
                          )),
                      Expanded(
                          // flex: 4,
                          child: Container(
                        height: 205,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'SAMSUNG',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "16GB RAM | 256GB SSD | i3 PROCESSOR | WINDOWS 11",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              "PRICE: RS.40,000",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.shopping_cart),
                                label: const Text('ADD TO CART')),
                          ],
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ))
                    ],
                  )),
              const SizedBox(height: 15),
              Container(
                  width: 150,
                  height: 155,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                          width: 250,
                          // height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/Prestigio.jpg',
                              fit: BoxFit.cover,
                            ),
                          )),
                      Expanded(
                          // flex: 4,
                          child: Container(
                        height: 205,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'PRESTIGIO',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "512GB SSD | 8GB RAM | i7 PROCESSOR | GRAPHIC CARD 4GB",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              "PRICE: RS.65,000",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.shopping_cart),
                                label: const Text('ADD TO CART')),
                          ],
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ))
                    ],
                  )),
              const SizedBox(height: 15),
              Container(
                  width: 150,
                  height: 155,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                          width: 250,
                          // height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/Surface.jpg',
                              fit: BoxFit.cover,
                            ),
                          )),
                      Expanded(
                          // flex: 4,
                          child: Container(
                        height: 205,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'SURFACE',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "i7 PROCESSOR | 16GB RAM | 256GB SSD | WINDOWS 12 | 12TH GEN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              "PRICE: RS.55,000",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.shopping_cart),
                                label: const Text('ADD TO CART')),
                          ],
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ))
                    ],
                  )),
            ]),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
            dotWidth: 15, activeDotColor: Colors.blue),
        activeIndex: activeIndex,
        count: AssetImage.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String AssetImage, int index) => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Image.network(AssetImage, fit: BoxFit.cover));
