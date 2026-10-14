import 'package:flutter/material.dart';
import '../data/mock_misiones.dart';
import '../servicios/tienda_progreso.dart';
import '../widgets/categoria.dart';
import '../widgets/tarjeta_mision.dart';
import 'detalles.dart';
import 'diccionario.dart';
import 'perfil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _category = 'Todas';
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = missions.where((m) {
      final okCat = _category == 'Todas' || m.category == _category;
      final okQuery = m.title.toLowerCase().contains(_query.toLowerCase());
      return okCat && okQuery;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CodeQuest', style: TextStyle(fontWeight: FontWeight.w700)),
        actions: [
          IconButton(
            tooltip: 'Diccionario',
            icon: const Icon(Icons.menu_book_outlined),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const DictionaryScreen())),
          ),
          IconButton(
            tooltip: 'Perfil',
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const ProfileScreen())),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: TextField(
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                hintText: 'Buscar misión',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          CategoryChips(selected: _category, onSelected: (c) => setState(() => _category = c)),
          const SizedBox(height: 12),
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('No hay misiones. Prueba otra búsqueda o categoría.'))
                : ListenableBuilder(
                    listenable: ProgressStore.instance,
                    builder: (_, __) => GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: filtered.length,
                      itemBuilder: (_, i) => MissionCard(
                        mission: filtered[i],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailScreen(mission: filtered[i])),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
