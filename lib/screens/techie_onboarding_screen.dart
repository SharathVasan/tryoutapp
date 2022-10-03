import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tryout/notifiers/darkthemeprovider.dart';
import 'package:provider/provider.dart';

class TechieOnboardingScreen extends StatefulWidget {
  const TechieOnboardingScreen({Key? key}) : super(key: key);

  @override
  _TechieOnboardingScreenState createState() => _TechieOnboardingScreenState();
}

class _TechieOnboardingScreenState extends State<TechieOnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor:
            themeProvider.darkTheme ? HexColor("#000000") : HexColor("#ffffff"),
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                Container(
                  color: HexColor("#ffffff"),
                  child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Positioned(
                          top: 120,
                          left: width / 5,
                          child: Hero(
                            tag: "techie",
                            child: Image.asset(
                              'assets/images/techie.png',
                              width: width * 0.3,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 260,
                          left: 20,
                          child: Text(
                            'Onboarding screens for\n techie starts',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontFamily: 'Karla',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ]),
                ),
                Container(),
                Container(),
              ],
            ),
            Container(
                alignment: const Alignment(0, 0.75),
                child: SmoothPageIndicator(controller: _controller, count: 3))
          ],
        ));
  }
}
