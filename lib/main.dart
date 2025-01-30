import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motocycle Catalog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF1D1D6A), // Uzay mavisi arkaplan
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false, // Debug yazısını kaldırıyoruz
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Giriş Yap')),
      body: Center(
        // Butonu ortalamak için Center widget'ı kullandık
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CatalogPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Buton rengi beyaz
              foregroundColor: Colors.black, // Buton yazı rengi siyah
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text('Giriş', style: TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }
}

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  // List of motorcycles with additional info like fuel consumption and color options
  final List<Map<String, String>> motorcycles = [
    {
      'name': 'Yamaha R1',
      'description':
          'Yamaha R1, Yamaha\'nın en güçlü spor motosikletlerinden biridir.',
      'details':
          'Yamaha R1, 998cc motoru ve 200 beygir gücüyle yüksek hızlara ulaşabilir.',
      'fuelConsumption': 'Şehir içi: 8.5L/100km, Şehir dışı: 6.0L/100km',
      'colors': 'Mavi, Kırmızı, Siyah'
    },
    {
      'name': 'Honda CBR600RR',
      'description':
          'Honda CBR600RR, orta sınıf motosiklet kategorisinde mükemmel bir seçenektir.',
      'details':
          'Honda CBR600RR, 599cc motoru ve 115 beygir gücüyle mükemmel denge ve hız sunar.',
      'fuelConsumption': 'Şehir içi: 7.0L/100km, Şehir dışı: 5.0L/100km',
      'colors': 'Beyaz, Siyah, Mavi'
    },
    {
      'name': 'Kawasaki Ninja ZX-10R',
      'description':
          'Kawasaki Ninja ZX-10R, yarış odaklı performansı ile ünlüdür.',
      'details':
          'Ninja ZX-10R, 998cc motoru ve 204 beygir gücüyle en hızlı motosikletlerden biridir.',
      'fuelConsumption': 'Şehir içi: 9.0L/100km, Şehir dışı: 6.5L/100km',
      'colors': 'Yeşil, Siyah, Gri'
    },
    {
      'name': 'Suzuki GSX-R1000',
      'description':
          'Suzuki GSX-R1000, Suzuki\'nin en güçlü motosikletlerinden birisidir.',
      'details':
          'GSX-R1000, 999cc motoru ve 199 beygir gücü ile mükemmel hız ve kontrol sağlar.',
      'fuelConsumption': 'Şehir içi: 8.0L/100km, Şehir dışı: 6.3L/100km',
      'colors': 'Mavi, Beyaz, Siyah'
    },
    {
      'name': 'BMW S1000RR',
      'description':
          'BMW S1000RR, birinci sınıf teknolojisi ile öne çıkan bir spor motosiklettir.',
      'details':
          'BMW S1000RR, 999cc motoru ve 205 beygir gücüyle mükemmel hız ve denge sunar.',
      'fuelConsumption': 'Şehir içi: 7.5L/100km, Şehir dışı: 5.5L/100km',
      'colors': 'Beyaz, Kırmızı, Siyah'
    },
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Motocycle Catalog')),
      body: ListView.builder(
        itemCount: motorcycles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MotorDetailPage(
                    motorName: motorcycles[index]['name']!,
                    motorDescription: motorcycles[index]['description']!,
                    motorDetails: motorcycles[index]['details']!,
                    motorFuelConsumption: motorcycles[index]
                        ['fuelConsumption']!,
                    motorColors: motorcycles[index]['colors']!,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 5, // Kartın etrafında hafif gölge
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Yuvarlak köşeler
              ),
              color: selectedIndex == index ? Colors.white : Colors.transparent,
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  motorcycles[index]['name']!,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: selectedIndex == index ? Colors.black : Colors.white,
                  ),
                ),
                subtitle: Text(
                  motorcycles[index]['description']!,
                  style: TextStyle(
                    fontSize: 16,
                    color: selectedIndex == index ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MotorDetailPage extends StatelessWidget {
  final String motorName;
  final String motorDescription;
  final String motorDetails;
  final String motorFuelConsumption;
  final String motorColors;

  MotorDetailPage({
    required this.motorName,
    required this.motorDescription,
    required this.motorDetails,
    required this.motorFuelConsumption,
    required this.motorColors,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(motorName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Sayfa kaydırılabilir
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Açıklama:',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                motorDescription,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Detaylar:',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                motorDetails,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Yakıt Tüketimi:',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                motorFuelConsumption,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Renk Seçenekleri:',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                motorColors,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}