import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/route_utils.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Image.asset(
          "assets/images/logo.png",
          width: 120,
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Privacy Help",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      backgroundColor: Colors.black87,
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/images/O2.png",
                        width: 300,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Watch on \nany device",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "Stream on your any devices",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/images/O3.png",
                        width: 300,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Download and go",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "Save your data , watch offline on a plane, train or submarine",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/images/O1.png",
                        width: 300,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "No pesky contracts",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Join today , cancel anytime",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CarouselSlider(
                          items: [
                            ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset("assets/images/P1.jpg")),
                            ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset("assets/images/P2.jpg")),
                            ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset("assets/images/P3.jpg")),
                            ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset("assets/images/P4.jpg")),
                          ],
                          options: CarouselOptions(
                            aspectRatio: 2 / 1.7,
                            autoPlay: true,
                            enlargeCenterPage: true,
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "How do I watch ?",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Members that subscribe to Netflix can watch here in the app",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(MyRoutes.loginPage);
                },
                child: Container(
                  height: 50,
                  width: 500,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: CupertinoColors.destructiveRed,
                  ),
                  child: const Text(
                    "SIGN IN",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
