import 'package:auto_route/auto_route.dart';
import 'package:boneconsulting/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:boneconsulting/core/theme/app_font.dart';

// This creates a smoother curve more similar to your image
class SmoothCurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Top rounded corners
    path.moveTo(20, 0);
    path.lineTo(size.width - 20, 0);
    path.arcToPoint(
      Offset(size.width, 20),
      radius: const Radius.circular(20),
    );

    // Right side
    path.lineTo(size.width, size.height - 80);

    // Create the curved bottom using cubic bezier for smoother curve
    path.cubicTo(
      size.width, size.height - 40, // Control point 1
      size.width * 0.8, size.height - 20, // Control point 2
      size.width * 0.5, size.height - 20, // End point (center bottom)
    );

    path.cubicTo(
      size.width * 0.2, size.height - 20, // Control point 1
      0, size.height - 40, // Control point 2
      0, size.height - 80, // End point (left side)
    );

    // Left side and top corner
    path.lineTo(0, 20);
    path.arcToPoint(
      const Offset(20, 0),
      radius: const Radius.circular(20),
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

@RoutePage()
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      imagePath: 'assets/image/onboarding-1.jpg',
      title: 'Welcome to B One Apps!',
      description:
          'Your all-in-one digital workspace—built to streamline operations, enhance collaboration, and drive results.',
    ),
    OnboardingPage(
      imagePath: 'assets/image/onboarding-2.jpg',
      title: 'Clock In, Stay Synced',
      description:
          'Clock in, request leave, check schedules—all without the paperwork. HR stuff? Handled.',
    ),
    OnboardingPage(
      imagePath: 'assets/image/onboarding-3.jpg',
      title: 'Deliver with Clarity & Control',
      description:
          'Plan, execute, and monitor projects in real time. Keep stakeholders aligned and progress transparent.',
    ),
    OnboardingPage(
      imagePath: 'assets/image/onboarding-4.jpg',
      title: 'Launch Your Workflow',
      description:
          'You\'re all set to dive in. Log in now and take full control of your workday with B One.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _getStarted() {
    // Navigate to main app or login screen
    AutoRouter.of(context).push(const LoginRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            Column(
              children: [
                // Page content
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          children: [
                            // Image with black overlay fills available height
                            Expanded(
                              child: ClipPath(
                                clipper: SmoothCurvedBottomClipper(),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              _pages[index].imagePath),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.black.withValues(alpha: 0.2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Title
                            Text(
                              _pages[index].title,
                              style: styleHeader1.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 16),

                            // Description
                            Text(
                              _pages[index].description,
                              style: styleParagraph1.copyWith(
                                fontSize: 14,
                                color: Colors.black54,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 40),

                            // Page indicator
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                _pages.length,
                                (dotIndex) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  height: 5,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: dotIndex == _currentPage
                                        ? AppColor.primary
                                        : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Bottom buttons
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      // Main action button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _currentPage == _pages.length - 1
                              ? _getStarted
                              : _nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            _currentPage == _pages.length - 1
                                ? 'Get Started'
                                : 'Next',
                            style: styleParagraph1.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Previous button
                      ...(_currentPage > 0
                          ? [
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: TextButton(
                                  onPressed: _previousPage,
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: const BorderSide(
                                        color: AppColor.primary,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Previous',
                                    style: styleParagraph1.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          : [
                              const SizedBox(height: 50), // Maintain spacing
                            ]),
                    ],
                  ),
                ),
              ],
            ),

            // Floating Skip button at top right
            Positioned(
              top: 16,
              right: 16,
              child: TextButton(
                onPressed: _getStarted,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Skip',
                  style: styleParagraph1.copyWith(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage {
  final String imagePath;
  final String title;
  final String description;

  OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}
