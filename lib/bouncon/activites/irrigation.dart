import 'package:flutter/material.dart';

class IrrigationScreen extends StatelessWidget {
  const IrrigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> irrigationData = [
      {"date": "2023-03-15", "hours": 2, "workers": 3},
      {"date": "2023-04-11", "hours": 3, "workers": 4},
      {"date": "2023-06-12", "hours": 3, "workers": 2},
      {"date": "2023-02-10", "hours": 4, "workers": 1},
      {"date": "2023-01-05", "hours": 2, "workers": 2},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Irrigation'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Expanded(flex: 3, child: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 2, child: Text('Hours', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 2, child: Text('Workers', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 2, child: SizedBox()),
              ],
            ),
          ),
          const Divider(thickness: 1.5),
          Expanded(
            child: ListView.builder(
              itemCount: irrigationData.length,
              itemBuilder: (context, index) {
                final data = irrigationData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Row(
                    children: [
                      Expanded(flex: 3, child: Text(data['date'])),
                      Expanded(flex: 2, child: Text('${data['hours']} h')),
                      Expanded(flex: 2, child: Text('${data['workers']}')),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Acción al ver detalle
                              },
                              child: const Text('View'),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Eliminar el registro
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {
                // Acción para agregar registro
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Irrigation Record'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}