import 'package:flutter/material.dart';
import '../models/product.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  int _cartCount = 0;
  bool _addedToCart = false;
  late AnimationController _buttonController;
  late Animation<double> _buttonScaleAnim;

  @override
  void initState() {
    super.initState();
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 160),
    );
    _buttonScaleAnim = Tween<double>(begin: 1.0, end: 0.93).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  Future<void> _onAddToCart() async {
    await _buttonController.forward();
    await _buttonController.reverse();
    setState(() {
      _cartCount++;
      _addedToCart = true;
    });
    // Kısa süre sonra "eklendi" durumunu sıfırla
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _addedToCart = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: Stack(
        children: [
          // ── Görsel (üst yarı) ───────────────────────────────────────────
          SizedBox(
            height: screenHeight * 0.48,
            width: double.infinity,
            child: Hero(
              tag: 'product-image-${product.id}',
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (ctx, child, progress) {
                  if (progress == null) return child;
                  return Container(
                    color: const Color(0xFFF0EBE3),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFD4A373),
                      ),
                    ),
                  );
                },
                errorBuilder: (ctx, err, st) => Container(
                  color: const Color(0xFFF0EBE3),
                  child: const Icon(Icons.coffee_rounded,
                      size: 80, color: Color(0xFFD4A373)),
                ),
              ),
            ),
          ),

          // Görsel üzeri gradient
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.48,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xFFFAF9F6),
                    Colors.transparent,
                    Colors.black.withOpacity(0.15),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),

          // ── Geri Butonu ────────────────────────────────────────────────
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 18,
                  color: Color(0xFF3C2A21),
                ),
              ),
            ),
          ),

          // ── Sepet Sayacı ───────────────────────────────────────────────
          if (_cartCount > 0)
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF3C2A21),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.shopping_bag_outlined,
                        size: 14, color: Color(0xFFD4A373)),
                    const SizedBox(width: 5),
                    Text(
                      '$_cartCount',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // ── İçerik Kartı ───────────────────────────────────────────────
          Positioned(
            top: screenHeight * 0.42,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFAF9F6),
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Başlık + Fiyat
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              fontFamily: 'Lora',
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF3C2A21),
                              height: 1.15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD4A373).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            '₺${product.price.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF3C2A21),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Karamel çizgi
                    Container(
                      width: 48,
                      height: 3,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD4A373),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Etiket
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3C2A21).withOpacity(0.07),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'SICAK İÇECEK',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.4,
                          color: Color(0xFF3C2A21),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Açıklama
                    const Text(
                      'Hakkında',
                      style: TextStyle(
                        fontFamily: 'Lora',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF3C2A21),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        height: 1.65,
                        color: const Color(0xFF3C2A21).withOpacity(0.72),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Özellik Chipler
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: const [
                        _FeatureChip(icon: Icons.local_fire_department_rounded, label: 'Sıcak'),
                        _FeatureChip(icon: Icons.eco_rounded, label: 'Arabica'),
                        _FeatureChip(icon: Icons.star_rounded, label: 'Özel Harman'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Sepete Ekle Butonu ─────────────────────────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  24, 16, 24, MediaQuery.of(context).padding.bottom + 16),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF9F6),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3C2A21).withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: ScaleTransition(
                scale: _buttonScaleAnim,
                child: GestureDetector(
                  onTap: _onAddToCart,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 56,
                    decoration: BoxDecoration(
                      color: _addedToCart
                          ? const Color(0xFF4A7C59)
                          : const Color(0xFF3C2A21),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF3C2A21).withOpacity(0.3),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _addedToCart
                                ? Icons.check_circle_outline_rounded
                                : Icons.shopping_bag_outlined,
                            color: const Color(0xFFD4A373),
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _addedToCart
                                ? 'Sepete Eklendi!'
                                : 'Sepete Ekle  •  ₺${product.price.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Yardımcı Widget ──────────────────────────────────────────────────────────
class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeatureChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFD4A373).withOpacity(0.4),
          width: 1.2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: const Color(0xFFD4A373)),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3C2A21),
            ),
          ),
        ],
      ),
    );
  }
}
