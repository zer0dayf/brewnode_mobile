import 'package:flutter/material.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: const Color(0xFF3C2A21), // Espresso arka plan
      body: Stack(
        children: [
          // ── Arka Plan Görseli ───────────────────────────────────────────
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1497935586351-b67a49e012bf?w=800&q=80',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.4),
              colorBlendMode: BlendMode.darken,
              errorBuilder: (context, error, stackTrace) => const SizedBox(),
            ),
          ),
          
          // ── İçerik ──────────────────────────────────────────────────────
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'BrewNode',
                    style: TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFAF9F6),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'En iyi çekirdeklerden, özenle demlenmiş kahve deneyimine hoş geldiniz.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFE5E5E5),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.08),
                  
                  // ── Menü Butonu ─────────────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return FadeTransition(opacity: animation, child: child);
                            },
                            transitionDuration: const Duration(milliseconds: 400),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD4A373), // Karamel Vurgu
                        foregroundColor: const Color(0xFF3C2A21), // Espresso yazı
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Kahveler (Menü)',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
