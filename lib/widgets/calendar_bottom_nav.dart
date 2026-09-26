import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CalendarBottomNav extends StatelessWidget {
  const CalendarBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      decoration: BoxDecoration(
        color: AppColors.cream.withValues(alpha: .96),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(38)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .2),
            blurRadius: 22,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: const Row(
        children: [
          _NavItem(
            icon: Icons.calendar_month_rounded,
            label: 'Calendario',
            selected: true,
          ),
          _NavItem(icon: Icons.format_list_bulleted_rounded, label: 'Eventos'),
          _NavItem(icon: Icons.person_outline_rounded, label: 'Perfil'),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        decoration: selected
            ? const BoxDecoration(
                color: AppColors.forest,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(58),
                  bottomRight: Radius.circular(58),
                  topLeft: Radius.circular(38),
                ),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 29,
              color: selected ? AppColors.white : AppColors.mutedInk,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: selected ? AppColors.white : AppColors.mutedInk,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: selected ? 55 : 0,
              height: 3,
              decoration: BoxDecoration(
                color: AppColors.terracotta,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
