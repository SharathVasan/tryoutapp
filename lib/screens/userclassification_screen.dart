import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';
import 'package:tryout/notifiers/darkthemeprovider.dart';
import 'package:provider/provider.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:tryout/screens/smarty_onboarding_screen.dart';
import 'package:tryout/screens/techie_onboarding_screen.dart';

class UserclassificationScreen extends StatefulWidget {
  const UserclassificationScreen({Key? key}) : super(key: key);

  @override
  _UserclassificationScreenState createState() =>
      _UserclassificationScreenState();
}

class _UserclassificationScreenState extends State<UserclassificationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool cirAn = false;

  @override
  void initState() {
    super.initState();
//    upcomingEventBloc.loadScreenScreen();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
      // reverseCurve: Curves.easeInOut
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return cirAn
        ? CircularRevealAnimation(
            centerOffset: Offset(height / 2, width / 3.5),
            animation: animation,
            child: homeBody(
              themeProvider,
            ),
          )
        : homeBody(themeProvider);
  }

  Widget homeBody(DarkThemeProvider themeProvider) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor:
            themeProvider.darkTheme ? HexColor("#000000") : HexColor("#ffffff"),
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  themeProvider.darkTheme
                      ? Image.asset(
                          'assets/images/halowhite.png',
                          width: width * 0.2,
                        )
                      : Image.asset(
                          'assets/images/haloblack.png',
                          width: width * 0.2,
                        ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        cirAn = true;
                      });
                      themeProvider.darkTheme = !themeProvider.darkTheme;

                      if (animationController.status ==
                              AnimationStatus.forward ||
                          animationController.status ==
                              AnimationStatus.completed) {
                        animationController.reset();
                        animationController.forward();
                      } else {
                        animationController.forward();
                      }
                    },
                    child: themeProvider.darkTheme
                        ? Image.asset(
                            'assets/images/bulboff.png',
                            width: width * 0.1,
                          )
                        : Image.asset(
                            'assets/images/bulbon.png',
                            width: width * 0.1,
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                'What describes you \nthe best!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Karla',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TechieOnboardingScreen()),
                  );
                },
                child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: themeProvider.darkTheme
                                ? Colors.white
                                : Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "Techie Tarun",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Karla',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "(Age: 24yrs - 35yrs)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Karla',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Hero(
                          tag: "techie",
                          child: Image.asset(
                            'assets/images/techie.png',
                            width: width * 0.25,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SmartyOnboardingScreen()),
                  );
                },
                child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: themeProvider.darkTheme
                                ? Colors.white
                                : Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "Smarty Sweetha",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Karla',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "(Age: 36yrs - 45yrs)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Karla',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        Hero(
                          tag: "smarty",
                          child: Image.asset(
                            'assets/images/smarty.png',
                            width: width * 0.25,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: themeProvider.darkTheme
                              ? Colors.white
                              : Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Text(
                            "Reliable Raj",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Karla',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "(Age: 46yrs - 60yrs)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Karla',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      Image.asset(
                        'assets/images/raj.png',
                        width: width * 0.25,
                      ),
                    ],
                  )),
            )
          ]),
        ));
  }
}
