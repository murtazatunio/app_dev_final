import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  int _currentCard = 0;
  final List<Map<String, String>> cards = [
    {
      'name': 'World',
      'number': '5413 7502 3412 2455',
      'type': 'Account card',
      'image': 'assets/cards/bankcard1.png',
    },
    {
      'name': 'Platinum',
      'number': '1234 5678 9012 3456',
      'type': 'Credit card',
      'image': 'assets/cards/bankcard2.png',
    },
    {
      'name': 'Gold',
      'number': '1234 5678 9012 3456',
      'type': 'Credit card',
      'image': 'assets/cards/bankcard3.png',
    }
  ];

  final List<Map<String, String>> activities = [
    {
      'title': 'Netflix',
      'date': '15 Dec 2024',
      'amount': ' 2415,48',
    },
    {
      'title': 'Spotify',
      'date': '14 Dec 2024',
      'amount': ' 2419,90',
    },
    {
      'title': 'Netflix',
      'date': '12 Dec 2024',
      'amount': ' 2415,48',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Chards', style: TextStyle(color: Colors.black)),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 6),
          child: CircleAvatar(
            radius: 18,
            backgroundImage:
                NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8BBD0), Color(0xFFE1BEE7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 90),
            SizedBox(
              height: 220,
              child: PageView.builder(
                itemCount: cards.length,
                controller: PageController(viewportFraction: 0.85),
                onPageChanged: (i) => setState(() => _currentCard = i),
                itemBuilder: (context, i) {
                  final card = cards[i];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(
                        horizontal: i == _currentCard ? 0 : 8,
                        vertical: i == _currentCard ? 0 : 8),
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  card['image']!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(card['name']!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      const Icon(Icons.credit_card,
                                          color: Colors.white, size: 32),
                                      const SizedBox(width: 12),
                                      Flexible(
                                        child: Text(card['number']!,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                letterSpacing: 2),
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Flexible(
                                    child: Text(card['type']!,
                                        style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 15)),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 20,
                              top: 20,
                              child: Icon(Icons.wifi,
                                  color: Colors.white, size: 28),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Last activities',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('Open all',
                      style: TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                itemCount: activities.length,
                itemBuilder: (context, i) {
                  final activity = activities[i];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star_border,
                            color: Colors.pink, size: 28),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(activity['title']!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                              const SizedBox(height: 2),
                              Text(activity['date']!,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 13)),
                            ],
                          ),
                        ),
                        Text(activity['amount']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
