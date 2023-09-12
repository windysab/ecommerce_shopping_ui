import 'package:ecommerce_shopping_ui/presentation/auth/login_screen.dart';
import 'package:ecommerce_shopping_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int currentPage = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // Setelah widget selesai dibuat, mulai perpindahan otomatis
    startAutoScroll();
  }

  void startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      if (currentPage < 2) {
        currentPage++;
        introKey.currentState?.animateScroll(currentPage);
      } else {
        // Setelah mencapai halaman terakhir, berhenti perpindahan otomatis
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    // Pastikan untuk membatalkan timer ketika widget dihapus
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 19.0,
      ),
      bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.all(24.0),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Menggunakan Profesional atau Freelancer",
          body: "Lorem ipsum dolor sit amet. Sed quam sit elit rhoncus.",
          image: Image.asset(
            "assets/images/splash1.png",
            width: 180.0,
            height: 180.0,
            fit: BoxFit.fill,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Tempat di Mana Pekerjaan Menemukan Anda",
          body: "Lorem ipsum dolor sit amet. Sed quam sit elit rhoncus.",
          image: Image.asset(
            "assets/images/splash2.png",
            width: 180.0,
            height: 180.0,
            fit: BoxFit.fill,
          ),
        ),
        PageViewModel(
          title: "Mari Memulai Karier Anda Bersama Kami!",
          body: "Lorem ipsum dolor sit amet. Sed quam sit elit rhoncus.",
          image: Image.asset(
            "assets/images/splash3.png",
            width: 180.0,
            height: 180.0,
            fit: BoxFit.fill,
          ),
          decoration: pageDecoration,
          // footer: ElevatedButton(
          //   onPressed: () {
          //     // Pindah ke halaman selanjutnya
          //     Navigator.pushNamed(context, '/login');
          //   },
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.deepPurple,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(8.0),
          //     ),
          //   ),
          //   child: const Text(
          //     "Mulai",
          //     style: TextStyle(
          //       fontWeight: FontWeight.w600,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ),
      ],
      onDone: () {
        // Pindah ke halaman selanjutnya
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      onSkip: () {
        // Tangani aksi ketika dilewati
      },
      showSkipButton: false,
      showDoneButton: true,
      showBackButton: true,
      back: const Text("Kembali"),
      next: const Text("Selanjutnya"),
      done: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 16.0),
        // padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.deepPurple,
          ),
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeColor: Colors.deepPurple,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
