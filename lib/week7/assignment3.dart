import 'package:flutter/material.dart';

enum CoffeeType {
  latte,
  americano,
  cappuccino;

  String get name => switch (this) {
    latte => 'Latte',
    americano => 'Americano',
    cappuccino => 'Cappuccino',
  };

  int get basePrice => switch (this) {
    latte => 35,
    americano => 30,
    cappuccino => 40,
  };

  String get imageUrl => switch (this) {
    latte => 'assets/images/latte.jpg',
    americano => 'assets/images/americano.jpg',
    cappuccino => 'assets/images/cappuccino.jpg',
  };
}

class Assignment3W7 extends StatefulWidget {
  const Assignment3W7({super.key});

  @override
  State<Assignment3W7> createState() => _Assignment3W7State();
}

class _Assignment3W7State extends State<Assignment3W7> {
  bool _isCold = false; // false = Hot, true = Cold
  double _sugarLevel = 2; // 0=none, 1=less, 2=normal
  CoffeeType _selectedCoffee = CoffeeType.latte; // Default: Latte
  String _thankYouMessage = ''; // Message shown after order confirmation
  final int _coldTax = 5; // Extra charge for cold drinks

  String sugarText(double value) {
    if (value == 0) return 'no sugar';
    if (value == 1) return 'less sugar';
    return 'normal sugar';
  }

  void toggleSwitch(bool? status) {
    setState(() {
      _isCold = status!;
      // Clear the thank you message when options change
      _thankYouMessage = '';
    });
  }

  // Calculate the total price based on coffee type and temperature
  int calculateTotalPrice(CoffeeType coffee, bool isCold) {
    return coffee.basePrice + (isCold ? _coldTax : 0);
  }

  void makeOrder() {
    // Clear any previous thank you message when starting a new order process
    setState(() {
      _thankYouMessage = '';
    });

    final int basePrice = _selectedCoffee.basePrice;
    final int totalPrice = calculateTotalPrice(_selectedCoffee, _isCold);
    final String tempType = _isCold ? 'Cold' : 'Hot';
    final String sugar = sugarText(_sugarLevel);
    final String coffeeName = _selectedCoffee.name;
    final String assetPath = _selectedCoffee.imageUrl;

    final String priceDetail = totalPrice == basePrice
        ? '$basePrice Baht'
        : '$totalPrice Baht';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text('Your Order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                child: Image.asset(
                  assetPath,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.local_cafe,
                      size: 100,
                      color: Colors.brown,
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '$tempType $coffeeName with $sugar.',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Price = $priceDetail',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _thankYouMessage = 'Thank you for your order!';
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'MFU Coffee Shop',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Your order',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // 1. Coffee Selection (Radio Buttons)
            const Text(
              'Coffee',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ...CoffeeType.values.map((coffee) {
              return RadioListTile<CoffeeType>(
                // Title shows base price
                title: Text('${coffee.name} ${coffee.basePrice} Baht'),
                value: coffee,
                groupValue: _selectedCoffee,
                onChanged: (CoffeeType? value) {
                  setState(() {
                    _selectedCoffee = value!;
                    _thankYouMessage = '';
                  });
                },
                activeColor: Colors.deepPurple,
                contentPadding: EdgeInsets.zero,
              );
            }),

            // 2. Hot / Cold Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Type',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text('Hot'),
                    Switch(value: _isCold, onChanged: toggleSwitch),
                    const Text('Cold (+5)'),
                  ],
                ),
              ],
            ),

            // 3. Sugar Slider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sugar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text('     None', style: TextStyle(fontSize: 16)),
                Expanded(
                  child: Slider(
                    value: _sugarLevel,
                    min: 0,
                    max: 2,
                    divisions: 2,
                    label: sugarText(_sugarLevel),
                    activeColor: Colors.deepPurple,
                    onChanged: (double value) {
                      setState(() {
                        _sugarLevel = value;
                        _thankYouMessage = '';
                      });
                    },
                  ),
                ),
                const Text('Normal', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 30),

            // 4. ORDER Button
            Center(
              child: ElevatedButton(
                onPressed: makeOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: const Text('ORDER', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),

            // 5. Thank You Message
            if (_thankYouMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  _thankYouMessage,
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
