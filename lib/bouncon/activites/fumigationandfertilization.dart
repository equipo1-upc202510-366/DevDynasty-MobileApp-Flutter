import 'package:flutter/material.dart';

class FumigationandfertilizationScreen extends StatelessWidget {
  const FumigationandfertilizationScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> activityList = [
      {"date": "2023-03-15", "hours": 2, "type": "Fumigation"},
      {"date": "2023-04-11", "hours": 3, "type": "Fumigation"},
      {"date": "2023-06-12", "hours": 3, "type": "Fumigation"},
      {"date": "2023-02-10", "hours": 4, "type": "Fertilization"},
      {"date": "2023-01-05", "hours": 2, "type": "Fertilization"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fumigation & Fertilization'),
        backgroundColor: Colors.green.shade800,
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
                Expanded(flex: 3, child: Text('Type', style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 2, child: SizedBox()), // Acciones
              ],
            ),
          ),
          const Divider(thickness: 1.5),
          Expanded(
            child: ListView.builder(
              itemCount: activityList.length,
              itemBuilder: (context, index) {
                final item = activityList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Row(
                    children: [
                      Expanded(flex: 3, child: Text(item['date'])),
                      Expanded(flex: 2, child: Text('${item['hours']} h')),
                      Expanded(
                        flex: 3,
                        child: Text(
                          item['type'],
                          style: TextStyle(
                            color: item['type'] == 'Fumigation' ? Colors.redAccent : Colors.teal,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Acción para ver detalles
                              },
                              child: const Text('View'),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Acción para eliminar
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
                // Acción para agregar nueva actividad
              },
              icon: const Icon(Icons.add),
              label: const Text('Add New Activity'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}