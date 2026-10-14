import 'package:flutter/material.dart';
import '../servicios/progress_store.dart';
import '../tema.dart';
import 'inicio.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _start();
  }

  Future<void> _start() async {
    // Carga el progreso y espera 3 segundos como mínimo.
    await Future.wait([
      ProgressStore.instance.load(),
      Future.delayed(const Duration(seconds: 3)),
    ]);
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const HomeScreen(),
        transitionsBuilder: (_, a, __, child) => FadeTransition(opacity: a, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ink,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.6, end: 1),
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeOutBack,
              builder: (_, v, child) => Transform.scale(scale: v, child: child),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset('assets/images/logo.png', width: 160, height: 160),
              ),
            ),
            const SizedBox(height: 24),
            const Text('CodeQuest',
                style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            const Text('Aprende programación resolviendo misterios',
                style: TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 40),
            const CircularProgressIndicator(color: AppColors.lens),
          ],
        ),
      ),
    );
  }
}
