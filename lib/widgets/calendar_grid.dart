import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CalendarGrid extends StatelessWidget {
  const CalendarGrid({super.key});

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
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 18, 14, 14),
          decoration: BoxDecoration(
            color: const Color(0xFF29342F).withValues(alpha: .57),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: Colors.white.withValues(alpha: .5),
              width: 1.2,
            ),
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
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 10),
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
  });

  final int day;
  final bool isOutsideMonth;
  final bool isSelected;
  final Color? markerColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: Center(
        child: Container(
          width: 42,
          height: 39,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.forest : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
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
                  fontSize: 17,
                  fontWeight: isSelected || day == 21
                      ? FontWeight.w700
                      : FontWeight.w500,
                ),
              ),
              if (markerColor != null)
                Positioned(
                  bottom: 1,
                  child: Container(
                    width: 7,
                    height: 7,
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
