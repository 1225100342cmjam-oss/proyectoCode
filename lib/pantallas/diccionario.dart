import 'package:flutter/material.dart';
import '../data/mock_misiones.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = dictionary.entries.toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Diccionario')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: entries.length,
        itemBuilder: (_, i) => Card(
          child: ExpansionTile(
            shape: const Border(),
            title: Text(entries[i].key, style: const TextStyle(fontWeight: FontWeight.w700)),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            expandedAlignment: Alignment.centerLeft,
            children: [Text(entries[i].value)],
          ),
        ),
      ),
    );
  }
}
