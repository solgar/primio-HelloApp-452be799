import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HelloApp',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeIn;
  late final Animation<Offset> _slideUp;

  late final AnimationController _spinController;
  late final Animation<double> _spin;

  late final AnimationController _textSpinController;
  late final Animation<double> _textSpin;

  late final AnimationController _welcomeSpinController;
  late final Animation<double> _welcomeSpin;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slideUp = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();

    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _spin = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(parent: _spinController, curve: Curves.decelerate),
    );

    _textSpinController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _textSpin = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(parent: _textSpinController, curve: Curves.decelerate),
    );

    _welcomeSpinController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _welcomeSpin = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(parent: _welcomeSpinController, curve: Curves.decelerate),
    );
  }

  void _onIconTap() {
    if (_spinController.isAnimating) return;
    _spinController.forward(from: 0);
  }

  void _onTextTap() {
    if (_textSpinController.isAnimating) return;
    _textSpinController.forward(from: 0);
  }

  void _onWelcomeTap() {
    if (_welcomeSpinController.isAnimating) return;
    _welcomeSpinController.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    _spinController.dispose();
    _textSpinController.dispose();
    _welcomeSpinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: _slideUp,
          child: FadeTransition(
            opacity: _fadeIn,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: _onIconTap,
                  child: RotationTransition(
                    turns: _spin,
                    child: Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: colors.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.waving_hand_rounded,
                        size: 48,
                        color: colors.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: _onTextTap,
                  child: RotationTransition(
                    turns: _textSpin,
                    child: Text(
                      'Hello, World!',
                      style: text.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colors.onSurface,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: _onWelcomeTap,
                  child: RotationTransition(
                    turns: _welcomeSpin,
                    child: Text(
                      'Welcome to HelloApp',
                      style: text.bodyLarge?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}