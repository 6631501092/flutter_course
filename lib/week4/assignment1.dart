import 'package:flutter/material.dart';

class Assignment1 extends StatefulWidget {
  const Assignment1({super.key});

  @override
  State<Assignment1> createState() => _InputDemoState();
}

class _InputDemoState extends State<Assignment1> {
  //variables
  String message = '';
  // Controllers for username and password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //function
  void _login() {
    setState(() {
      if (_usernameController.text == "admin" &&
          _passwordController.text == "1234") {
        message = "Welcome admin";
      } else {
        message = "Wrong username or password";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text("Login", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Username
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // Password
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            // Centered small button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: _login,
                child: const Text("Login", style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            // Result message
            Center(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  color: message == "Welcome admin" ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}