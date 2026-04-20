class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

// ── Örnek kahve verisi ──────────────────────────────────────────────────────
final List<Product> sampleProducts = [
  const Product(
    id: '1',
    name: 'Espresso',
    description:
        'Yoğun aromalı, tam gövdeli tek shot espresso. '
        'İtalyan usulü öğütülmüş, özel harman Arabica çekirdeklerinden hazırlanır. '
        'Güne güçlü bir başlangıç için ideal seçim.',
    price: 65.0,
    imageUrl:
        'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04?w=600&q=80',
  ),
  const Product(
    id: '2',
    name: 'Cappuccino',
    description:
        'Espresso, buharla ısıtılmış süt ve kadifemsi süt köpüğünün mükemmel '
        'dengesi. Klasik İtalyan kahve kültürünün simgesi. Sabah ritüelleriniz '
        'için vazgeçilmez.',
    price: 85.0,
    imageUrl:
        'https://images.unsplash.com/photo-1534778101976-62847782c213?w=600&q=80',
  ),
  const Product(
    id: '3',
    name: 'Latte',
    description:
        'Yumuşak espresso bazı üzerine bol miktarda buharlı süt eklenerek '
        'hazırlanan, kadifemsi dokulu ve hafif içimli kahve. '
        'Günün her saatine uyar.',
    price: 90.0,
    imageUrl:
        'https://images.unsplash.com/photo-1561882468-9110e03e0f78?w=600&q=80',
  ),
  const Product(
    id: '4',
    name: 'Cold Brew',
    description:
        'Öğütülmüş kahve 12 saat boyunca soğuk suda bekletilerek hazırlanan '
        'düşük asitli, doğal tatlı ve ferahlatıcı içecek. '
        'Sıcak günlerin favorisi.',
    price: 95.0,
    imageUrl:
        'https://images.unsplash.com/photo-1544145945-f90425340c7e?w=600&q=80',
  ),
  const Product(
    id: '5',
    name: 'Flat White',
    description:
        'Çift shot ristretto üzerine az miktarda buharlı süt dökülen, '
        'yoğun kahve aromasını ön plana çıkaran Avustralya kökenli içecek. '
        'Kahve severler için biçilmiş kaftan.',
    price: 95.0,
    imageUrl:
        'https://images.unsplash.com/photo-1574914629385-46448b209339?w=600&q=80',
  ),
  const Product(
    id: '6',
    name: 'Macchiato',
    description:
        'Espresso üzerine az miktarda süt köpüğü eklenerek hazırlanan, '
        '"lekelenmiş" anlamına gelen bu içecek güçlü kahve aromasını '
        'yumuşak bir dokuyla buluşturur.',
    price: 75.0,
    imageUrl:
        'https://images.unsplash.com/photo-1485808191679-5f86510bd9d7?w=600&q=80',
  ),
  const Product(
    id: '7',
    name: 'Pour Over',
    description:
        'Elle döküm yöntemiyle tek kökenli çekirdeklerden demlenen, '
        'meyvemsi ve floral notaları ön plana çıkaran filtre kahve. '
        'Kahve tutkunlarının tercihi.',
    price: 110.0,
    imageUrl:
        'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600&q=80',
  ),
  const Product(
    id: '8',
    name: 'Mocha',
    description:
        'Espresso, yüksek kakao içerikli çikolata sosu ve buharlı sütün '
        'buluşmasından doğan zengin ve kremamsı içecek. '
        'Tatlı kahve severlere özel.',
    price: 100.0,
    imageUrl:
        'https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?w=600&q=80',
  ),
];
