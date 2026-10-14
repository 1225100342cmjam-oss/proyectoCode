import 'package:flutter/material.dart';
import '../data/mock_misiones.dart';
import '../tema.dart';

class CategoryChips extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelected;

  const CategoryChips({super.key, required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final items = ['Todas', ...categories];
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final active = items[i] == selected;
          return ChoiceChip(
            label: Text(items[i]),
            selected: active,
            showCheckmark: false,
            selectedColor: AppColors.ink,
            labelStyle: TextStyle(color: active ? Colors.white : AppColors.ink),
            onSelected: (_) => onSelected(items[i]),
          );
        },
      ),
    );
  }
}
