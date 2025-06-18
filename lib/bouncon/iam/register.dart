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
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Capa oscura para legibilidad
          Container(color: Colors.black.withOpacity(0.3)),

          // Formulario
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text(
                    'Create an Account',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField('Full Name'),
                  _buildTextField('Email'),
                  _buildTextField('Password', obscure: true),
                  _buildTextField('Confirm Password', obscure: true),
                  _buildTextField('City'),
                  _buildTextField('Country'),
                  _buildTextField('Phone'),

                  const SizedBox(height: 10),
                  // Selector de rol
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          title: const Text('Agricultural Producer', style: TextStyle(color: Colors.white)),
                          value: 'Producer',
                          groupValue: role,
                          onChanged: (value) => setState(() => role = value),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          title: const Text('Distributor', style: TextStyle(color: Colors.white)),
                          value: 'Distributor',
                          groupValue: role,
                          onChanged: (value) => setState(() => role = value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Validaciones o navegación futura
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                    ),
                    child: const Text('SIGN UP'),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Volver al login
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: 'Log In',
                            style: TextStyle(
                              color: Colors.lightGreenAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        obscureText: obscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
        ),
      ),
    );
  }
}