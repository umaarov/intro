import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: const IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
              buildPage(
                image: 'assets/burger.png',
                title: 'Hamma birgina ilovada.',
                subtitle:
                    'Birgina ilova orqali barcha servislaridan bir vaqtni o\'zida foydalaning!',
              ),
              buildPage(
                image: 'assets/living_room.png',
                title: 'Vaqtingizni va naqdingizni tejang!',
                subtitle:
                    'Ortiqcha ovvoragarchiliklarsiz ishingizni tez va oson bitiring!',
              ),
              buildPage(
                image: 'assets/lake.png',
                title:
                    'O\'z xizmatingiz evaziga qo\'shimcha daromadga ega bo\'ling!',
                subtitle:
                    'Asosiy ishingizdan ajralmasdan turib qo\'shimcha daromadga ega chiqing. \n\nBosh vaqtingizda qo\'shimcha \ndaromadga ega bo\'ling!',
              ),
            ],
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 60,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            if (_currentPage < 2) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              'Keyingisi',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPage(
      {required String image,
      required String title,
      required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Stack(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: 500,
              width: double.infinity,
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    dotHeight: 8.0,
                    dotWidth: 8.0,
                    spacing: 4.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
