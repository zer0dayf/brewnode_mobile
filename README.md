# ☕ BrewNode - Mobil Kahve Kataloğu

BrewNode, modern ve minimalist bir kahve dükkanı estetiğiyle tasarlanmış, kullanıcı dostu bir mobil kahve kataloğu uygulamasıdır. Kahveseverlerin özel harmanları, sıcak/soğuk içecekleri ve detaylı ürün içeriklerini estetik bir arayüzde keşfetmelerini sağlar.

## ✨ Özellikler

- **Zarif Karşılama Ekranı**: Kullanıcıyı premium bir kahve dükkanı atmosferine sokan açılış ekranı.
- **Dinamik Kahve Kataloğu**: `GridView` yapısıyla listelenen ürünlerin hızlı ve akıcı görünümü.
- **Detaylı İnceleme**: `Hero` animasyonları ile desteklenen, ürün özellikleri, fiyat ve etkileşimli "Sepete Ekle" deneyimi sunan detay sayfası.
- **Özel Renk Paleti**: Krem (Arka plan), Espresso (Metinler) ve Karamel (Vurgular) renklerinin uyumu.
- **Özel Tipografi**: Okunabilirlik ve şıklık için `Lora` ve `Inter` font kombinasyonları.

---

## 🛠️ Teknik Detaylar

- **Framework**: Flutter
- **Dil**: Dart
- **Kullanılan Flutter Sürümü**: `3.29.3`
- **Mimari Yaklaşım**: Stateless ve Stateful widget ayrımı, temiz klasör yapısı (models, screens, widgets).

---

## 🚀 Çalıştırma Adımları

Projeyi kendi bilgisayarınızda çalıştırmak için aşağıdaki adımları izleyebilirsiniz:

### 1. Gereksinimler
- Bilgisayarınızda [Flutter SDK](https://docs.flutter.dev/get-started/install)'nın (v3.29.3 veya üstü) kurulu olduğundan emin olun.
- Bir Android emülatör, iOS simülatör veya Web tarayıcısı (Chrome) hazır olmalıdır.

### 2. Projeyi Klonlayın
```bash
git clone https://github.com/zer0dayf/brewnode_mobile.git
cd brewnode_mobile
```

### 3. Bağımlılıkları Yükleyin
Projedeki paketleri ve font gibi statik dosyaları çekmek için:
```bash
flutter pub get
```

### 4. Uygulamayı Başlatın
Uygulamayı açık olan bir emülatörde veya tarayıcıda çalıştırmak için:
```bash
flutter run
```
> **Not:** Spesifik bir cihazda (örneğin sadece Chrome'da) çalıştırmak isterseniz `flutter run -d chrome` komutunu kullanabilirsiniz.

---
*BrewNode - İyi kahve, iyi kodla demlenir.* 🍂
