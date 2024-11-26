import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<String> _images = [
    'assets/images/img1.webp', // Replace with actual asset paths
    'assets/images/img5.webp',
    'assets/images/img3.webp',
  ];

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      _images[index],
                      height: MediaQuery.of(context).size.height * 0.7,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _images.length,
                (index) => Container(
                  margin: const EdgeInsets.all(4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.white : Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16), // Add space between dots and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_currentIndex > 0)
                  ElevatedButton(
                    onPressed: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text('Previous'),
                  ),
                const SizedBox(width: 16), // Add space between buttons
                if (_currentIndex < _images.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text('Next'),
                  ),
                if (_currentIndex == _images.length - 1)
                  ElevatedButton(
                    onPressed: () => _navigateToHome(context),
                    child: const Text('Done'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
