import 'package:flutter/material.dart';

class Exercise5w6 extends StatelessWidget {
  const Exercise5w6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: const Text(
          'Cooking Recipes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Papaya Salad',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                // Left column
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple.shade200),
                    ),
                    child: const Text(
                      'Lorem ipsum dolor sit amet consectetur adipiscing elit. '
                      'Soluta ducimus in modi illo ad ipsa non officiis. '
                      'Ea placeat necessitatibus in aliquid ullam quasi porro vel '
                      'dolores, dignissimos quisquam aspernatur.',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Right column
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Image.asset('assets/images/salad.jpg', fit: BoxFit.cover),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star, color: Colors.amber),
                          Icon(Icons.star_border, color: Colors.amber),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text('3128 reviews'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          _InfoItem(
                            icon: Icons.access_time,
                            label: 'PREP:',
                            value: '5 mins',
                          ),
                          _InfoItem(
                            icon: Icons.timer,
                            label: 'COOK:',
                            value: '10 mins',
                          ),
                          _InfoItem(
                            icon: Icons.restaurant,
                            label: 'FEEDS:',
                            value: '1-3',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.purple),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}
