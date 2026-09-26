import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            width: MediaQuery.sizeOf(context).width.clamp(280, 390) * .82,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF123E36), AppColors.forestDark],
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(94),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(26, 18, 26, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      '9:41',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.signal_cellular_alt_rounded,
                      size: 18,
                      color: Colors.white.withValues(alpha: .9),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.wifi_rounded,
                      size: 18,
                      color: Colors.white.withValues(alpha: .9),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.battery_full_rounded,
                      size: 20,
                      color: Colors.white.withValues(alpha: .9),
                    ),
                  ],
                ),
                const SizedBox(height: 34),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.menu_rounded,
                      size: 34,
                      color: AppColors.white,
                    ),
                    const Spacer(),
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: AppColors.cream,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        color: AppColors.forest,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Septiembre',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 38,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -.8,
                  ),
                ),
                const Text(
                  '2026',
                  style: TextStyle(
                    color: AppColors.terracotta,
                    fontSize: 52,
                    height: 1.08,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Tus planes, un paso más cerca',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: .75),
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
