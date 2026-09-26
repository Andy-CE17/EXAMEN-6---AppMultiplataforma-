import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CalendarBottomNav extends StatelessWidget {
  const CalendarBottomNav({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: compact ? 68 : 94,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.cream.withValues(alpha: .98),
            Colors.white.withValues(alpha: .93),
            AppColors.cream.withValues(alpha: .98),
          ],
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(compact ? 28 : 38),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .2),
            blurRadius: 22,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          _NavItem(
            icon: Icons.calendar_month_rounded,
            label: 'Calendario',
            selected: true,
            compact: compact,
          ),
          _NavItem(
            icon: Icons.format_list_bulleted_rounded,
            label: 'Eventos',
            compact: compact,
          ),
          _NavItem(
            icon: Icons.person_outline_rounded,
            label: 'Perfil',
            compact: compact,
          ),
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
    required this.compact,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final bool compact;

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
              size: compact ? 22 : 29,
              color: selected ? AppColors.white : AppColors.mutedInk,
            ),
            SizedBox(height: compact ? 2 : 4),
            Text(
              label,
              style: TextStyle(
                color: selected ? AppColors.white : AppColors.mutedInk,
                fontSize: compact ? 10 : 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: compact ? 2 : 5),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: selected ? (compact ? 40 : 55) : 0,
              height: compact ? 2 : 3,
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
