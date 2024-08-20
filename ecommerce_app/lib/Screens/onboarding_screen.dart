import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  Color _backgroundColor = Colors.blueAccent;
  int _currentIndex = 0;

  final List<Color> _backgroundColors = [
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent,
    Colors.blueAccent,
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    setState(() {
      _currentIndex = _pageController.page!.round();
      _backgroundColor = _backgroundColors[_currentIndex];
    });
  }

  void _onNext() {
    if (_currentIndex < _backgroundColors.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void _onPrevious() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onSkip() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildPage(
                color: _backgroundColors[0],
                title: "Welcome to Shoppivese",
                description: "Discover amazing features.",
                icon: Icons.shop,
              ),
              _buildPage(
                color: _backgroundColors[1],
                title: "Safe & Secured",
                description: "Safe and encripted transactions",
                icon: Icons.lock,
              ),
              _buildPage(
                color: _backgroundColors[2],
                title: "Fast delivery",
                description: "Fast and reliable.",
                icon: Icons.rocket,
              ),
              _buildPage(
                color: _backgroundColors[3],
                title: "Get Started",
                description: "Let's get you set up!",
                icon: Icons.check_circle,
                isLastPage: true,
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: _currentIndex > 0
                ? ElevatedButton(
                    onPressed: _onPrevious,
                    child: Text("Previous"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: _backgroundColor, backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: _onNext,
              child: Text(_currentIndex == _backgroundColors.length - 1 ? "Done" : "Next"),
              style: ElevatedButton.styleFrom(
                foregroundColor: _backgroundColor, backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: _currentIndex < _backgroundColors.length - 1
                ? TextButton(
                    onPressed: _onSkip,
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required Color color,
    required String title,
    required String description,
    required IconData icon,
    bool isLastPage = false,
  }) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: Colors.white),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          if (isLastPage) SizedBox(height: 40),
        ],
      ),
    );
  }
}
