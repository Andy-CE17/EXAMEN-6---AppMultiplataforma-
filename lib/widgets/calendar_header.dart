import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: compact ? 184 : 300,
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
            padding: EdgeInsets.fromLTRB(
              compact ? 20 : 26,
              compact ? 12 : 18,
              compact ? 20 : 26,
              compact ? 6 : 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '9:41',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: compact ? 14 : 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.signal_cellular_alt_rounded,
                      size: compact ? 14 : 18,
                      color: Colors.white.withValues(alpha: .9),
                    ),
                    SizedBox(width: compact ? 6 : 8),
                    Icon(
                      Icons.wifi_rounded,
                      size: compact ? 14 : 18,
                      color: Colors.white.withValues(alpha: .9),
                    ),
                    SizedBox(width: compact ? 6 : 8),
                    Icon(
                      Icons.battery_full_rounded,
                      size: compact ? 16 : 20,
                      color: Colors.white.withValues(alpha: .9),
                    ),
                  ],
                ),
                SizedBox(height: compact ? 10 : 34),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.menu_rounded,
                      size: compact ? 27 : 34,
                      color: AppColors.white,
                    ),
                    const Spacer(),
                    Container(
                      width: compact ? 34 : 46,
                      height: compact ? 34 : 46,
                      decoration: BoxDecoration(
                        color: AppColors.cream,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Icon(
                        Icons.person_rounded,
                        color: AppColors.forest,
                        size: compact ? 22 : 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: compact ? 5 : 12),
                Text(
                  'Septiembre',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: compact ? 28 : 38,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -.8,
                  ),
                ),
                Text(
                  '2026',
                  style: TextStyle(
                    color: AppColors.terracotta,
                    fontSize: compact ? 38 : 52,
                    height: 1.08,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: compact ? 4 : 10),
                Text(
                  'Tus planes, un paso más cerca',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: .75),
                    fontSize: compact ? 13 : 17,
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
