import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RestaurantPage(),
    );
  }
}

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  List<bool> favorite = [false, false, false];

  final menu = [
    [
      "https://images.unsplash.com/photo-1546833999-b9f581a1996d",
      "Prime Steak",
      "Rp145.000",
    ],
    [
      "https://images.unsplash.com/photo-1598103442097-8b74394b95c6",
      "Grilled Chicken",
      "Rp95.000",
    ],
    [
      "https://images.unsplash.com/photo-1600891964092-4316c288032e",
      "Chicken Steak",
      "Rp110.000",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),

      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        foregroundColor: Colors.white,
        title: const Text(
          "ANOMALI RESTO",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined)),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FOTO RESTORAN
            SizedBox(
              width: double.infinity,
              height: 220,
              child: Image.network(
                "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4",
                fit: BoxFit.cover,
              ),
            ),

            // INFO RESTORAN
            Container(
              margin: const EdgeInsets.all(18),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xff1E1E1E),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "ANOMALI RESTO",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xffD6A84F)),
                      const SizedBox(width: 5),
                      const Text("4.8", style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 8),
                      Text(
                        "(1250 ulasan)",
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Steakhouse  •  Grill",
                    style: TextStyle(color: Color(0xffD6A84F)),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "📍 Jl. Kemang Raya No. 1587, Ternate",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),

            // STATISTIK
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xff1E1E1E),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Stat("📍", "2.5 km", "Jarak"),
                  Stat("🕐", "10.00-22.00", "Waktu Buka"),
                  Stat("💰", "Rp100.000", "Harga Rata-rata"),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // DESKRIPSI
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "Tentang Restoran",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                "ANOMALI RESTO menghadirkan pengalaman bersantap "
                "premium dengan pilihan steak dan hidangan grill "
                "berkualitas. Suasana elegan dan nyaman.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                "Selengkapnya",
                style: TextStyle(
                  color: Color(0xffD6A84F),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 22),

            // MENU POPULER
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "Menu Populer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // MENU HORIZONTAL
            SizedBox(
              height: 190,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                itemCount: menu.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return MenuCard(
                    image: menu[index][0],
                    name: menu[index][1],
                    price: menu[index][2],
                    favorite: favorite[index],
                    onFavorite: () {
                      setState(() {
                        favorite[index] = !favorite[index];
                      });
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 90),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xff8B5E34),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.calendar_month),
        label: const Text("Reservasi Sekarang"),
      ),
    );
  }
}

// STATISTIK
class Stat extends StatelessWidget {
  final String icon;
  final String value;
  final String title;

  const Stat(this.icon, this.value, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(icon),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

// CARD MENU
class MenuCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final bool favorite;
  final VoidCallback onFavorite;

  const MenuCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.favorite,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: const Color(0xff1E1E1E),
        child: Stack(
          children: [
            Positioned.fill(child: Image.network(image, fit: BoxFit.cover)),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(.85)],
                  ),
                ),
              ),
            ),

            // FAVORITE
            Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: onFavorite,
                  icon: Icon(
                    favorite ? Icons.favorite : Icons.favorite_border,
                    color: favorite ? Colors.red : Colors.black,
                  ),
                ),
              ),
            ),

            // NAMA + HARGA
            Positioned(
              left: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      color: Color(0xffD6A84F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
