import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? role = 'Producer'; // Valor inicial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              const Icon(Icons.agriculture, size: 64, color: Colors.green),
              const SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: 'Register to ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'AgroControl',
                      style: TextStyle(color: Color(0xFF2FB95D)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _buildTextField('Full Name'),
              _buildTextField('Email'),
              _buildTextField('Password', obscure: true),
              _buildTextField('Confirm Password', obscure: true),
              _buildTextField('City'),
              _buildTextField('Country'),
              _buildTextField('Phone'),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text('Producer'),
                      value: 'Producer',
                      groupValue: role,
                      activeColor: Colors.green,
                      onChanged: (value) => setState(() => role = value),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text('Distributor'),
                      value: 'Distributor',
                      groupValue: role,
                      activeColor: Colors.green,
                      onChanged: (value) => setState(() => role = value),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Sign Up', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Color(0xFF7D7D7D)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Color(0xFF2FB95D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          prefixIcon: Icon(_iconForLabel(label)),
        ),
      ),
    );
  }

  IconData _iconForLabel(String label) {
    switch (label) {
      case 'Email':
        return Icons.email_outlined;
      case 'Password':
      case 'Confirm Password':
        return Icons.lock_outline;
      case 'Phone':
        return Icons.phone;
      case 'Full Name':
        return Icons.person_outline;
      case 'City':
        return Icons.location_city;
      case 'Country':
        return Icons.public;
      default:
        return Icons.edit;
    }
  }
}
