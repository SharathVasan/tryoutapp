import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:tryout/screens/userclassification_screen.dart';
import 'package:tryout/screens/userclassslider_screeen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (8)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: HexColor("#ffffff"),
      body: Center(
        child: Lottie.asset(
          'assets/lottie/eyesplash.json',
          controller: _controller,
          height: height * 1,
          width: width * 0.6,
          animate: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward()
                  .whenComplete(() => Navigator.of(context).push(FadePageRoute(
                        builder: (context) => const UserclasssliderScreeen(),
                      )));
          },
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const UserclassificationScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 2.0);
      const end = Offset.zero;
      const curve = Curves.bounceIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class FadePageRoute<T> extends MaterialPageRoute<T> {
  FadePageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(
          builder: builder,
          settings: settings,
        );

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1200);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.name == "/auth") {
      return child;
    }

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
