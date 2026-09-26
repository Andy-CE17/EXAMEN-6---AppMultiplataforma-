import 'package:flutter/material.dart';

import '../models/calendar_event.dart';
import '../theme/app_colors.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event, this.compact = false});

  final CalendarEvent event;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: compact ? 70 : 104,
      margin: EdgeInsets.only(bottom: compact ? 6 : 12),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/calendar_background.png'),
          fit: BoxFit.cover,
          alignment: switch (event.day) {
            '05' => Alignment.topRight,
            '12' => Alignment.centerRight,
            _ => Alignment.bottomRight,
          },
        ),
        borderRadius: BorderRadius.circular(compact ? 14 : 18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .22),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.cream.withValues(alpha: .98),
                    AppColors.cream.withValues(alpha: .88),
                    Colors.white.withValues(alpha: .34),
                    AppColors.cream.withValues(alpha: .42),
                  ],
                  stops: const [0, .38, .7, 1],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Row(
              children: [
                Container(width: compact ? 4 : 5, color: event.color),
                Container(
                  width: compact ? 66 : 88,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [event.color.withValues(alpha: .96), event.color],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        event.day,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: compact ? 23 : 31,
                          height: 1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: compact ? 2 : 4),
                      Text(
                        event.month,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: compact ? 11 : 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: compact ? 9 : 14),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _DetailLine(
                        icon: Icons.schedule_rounded,
                        label: event.time,
                        color: event.color,
                        compact: compact,
                      ),
                      SizedBox(height: compact ? 3 : 5),
                      Text(
                        event.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.ink,
                          fontSize: compact ? 13 : 16,
                          height: 1.1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: compact ? 3 : 6),
                      _DetailLine(
                        icon: Icons.location_on_rounded,
                        label: event.location,
                        color: event.color,
                        compact: compact,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: compact ? 48 : 64,
                  height: compact ? 50 : 70,
                  margin: EdgeInsets.only(right: compact ? 8 : 12),
                  decoration: BoxDecoration(
                    color: AppColors.cream.withValues(alpha: .82),
                    borderRadius: BorderRadius.circular(compact ? 12 : 16),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: .45),
                    ),
                  ),
                  child: Icon(
                    event.icon,
                    size: compact ? 24 : 33,
                    color: event.color,
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

class _DetailLine extends StatelessWidget {
  const _DetailLine({
    required this.icon,
    required this.label,
    required this.color,
    required this.compact,
  });

  final IconData icon;
  final String label;
  final Color color;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: compact ? 14 : 18, color: color),
        SizedBox(width: compact ? 4 : 6),
        Expanded(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.mutedInk,
              fontSize: compact ? 11 : 14,
              height: 1,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
