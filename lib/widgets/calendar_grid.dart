import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CalendarGrid extends StatelessWidget {
  const CalendarGrid({super.key, this.compact = false});

  final bool compact;

  static const _weekDays = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];
  static const _days = [
    31,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    1,
    2,
    3,
    4,
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(compact ? 16 : 22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: EdgeInsets.fromLTRB(
            compact ? 10 : 14,
            compact ? 9 : 18,
            compact ? 10 : 14,
            compact ? 7 : 14,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                const Color(0xFF24322D).withValues(alpha: .68),
                const Color(0xFF4A5148).withValues(alpha: .58),
                const Color(0xFF9A846D).withValues(alpha: .48),
              ],
            ),
            borderRadius: BorderRadius.circular(compact ? 16 : 22),
            border: Border.all(
              color: Colors.white.withValues(alpha: .62),
              width: 1.25,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .2),
                blurRadius: 18,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: _weekDays
                    .map(
                      (day) => Expanded(
                        child: Center(
                          child: Text(
                            day,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: compact ? 12 : 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: compact ? 4 : 10),
              ...List.generate(5, (weekIndex) {
                final start = weekIndex * 7;
                return Row(
                  children: List.generate(7, (dayIndex) {
                    final index = start + dayIndex;
                    final day = _days[index];
                    final isOutsideMonth = index == 0 || index >= 31;
                    return Expanded(
                      child: _CalendarDay(
                        day: day,
                        isOutsideMonth: isOutsideMonth,
                        isSelected: day == 12 && !isOutsideMonth,
                        markerColor: switch (day) {
                          5 => AppColors.forestLight,
                          12 => AppColors.terracotta,
                          21 => AppColors.terracotta,
                          _ => null,
                        },
                        compact: compact,
                      ),
                    );
                  }),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _CalendarDay extends StatelessWidget {
  const _CalendarDay({
    required this.day,
    required this.isOutsideMonth,
    required this.isSelected,
    required this.markerColor,
    required this.compact,
  });

  final int day;
  final bool isOutsideMonth;
  final bool isSelected;
  final Color? markerColor;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: compact ? 29 : 43,
      child: Center(
        child: Container(
          width: compact ? 33 : 42,
          height: compact ? 27 : 39,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.forest : Colors.transparent,
            borderRadius: BorderRadius.circular(compact ? 9 : 12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .18),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                '$day',
                style: TextStyle(
                  color: isOutsideMonth
                      ? Colors.white.withValues(alpha: .35)
                      : AppColors.white,
                  fontSize: compact ? 13 : 17,
                  fontWeight: isSelected || day == 21
                      ? FontWeight.w700
                      : FontWeight.w500,
                ),
              ),
              if (markerColor != null)
                Positioned(
                  bottom: compact ? 0 : 1,
                  child: Container(
                    width: compact ? 5 : 7,
                    height: compact ? 5 : 7,
                    decoration: BoxDecoration(
                      color: markerColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
