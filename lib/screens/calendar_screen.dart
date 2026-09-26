import 'package:flutter/material.dart';

import '../models/calendar_event.dart';
import '../theme/app_colors.dart';
import '../widgets/calendar_bottom_nav.dart';
import '../widgets/calendar_grid.dart';
import '../widgets/calendar_header.dart';
import '../widgets/event_card.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  static const _events = [
    CalendarEvent(
      day: '05',
      month: 'SEP',
      time: '10:00 a. m.',
      title: 'Laboratorio Flutter',
      location: 'Aula 301',
      color: Color(0xFFC85722),
      icon: Icons.laptop_mac_rounded,
    ),
    CalendarEvent(
      day: '12',
      month: 'SEP',
      time: '2:30 p. m.',
      title: 'Exposición de proyecto',
      location: 'Aula 201',
      color: Color(0xFF13594C),
      icon: Icons.groups_2_outlined,
    ),
    CalendarEvent(
      day: '21',
      month: 'SEP',
      time: '11:59 p. m.',
      title: 'Entrega de laboratorio',
      location: 'Plataforma virtual',
      color: Color(0xFF9D7B58),
      icon: Icons.description_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/calendar_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.forestDark.withValues(alpha: .27),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 700;
              return Center(
                child: Container(
                  width: isWide ? 470 : double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: .08),
                    borderRadius: isWide
                        ? BorderRadius.circular(38)
                        : BorderRadius.zero,
                    border: isWide
                        ? Border.all(color: Colors.white.withValues(alpha: .22))
                        : null,
                    boxShadow: isWide
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: .55),
                              blurRadius: 42,
                              spreadRadius: 4,
                            ),
                          ]
                        : null,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: SafeArea(
                    top: false,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                const CalendarHeader(),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    18,
                                    8,
                                    18,
                                    24,
                                  ),
                                  child: Column(
                                    children: [
                                      const CalendarGrid(),
                                      const SizedBox(height: 20),
                                      const _EventsTitle(),
                                      const SizedBox(height: 12),
                                      ..._events.map(
                                        (event) => EventCard(event: event),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const CalendarBottomNav(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _EventsTitle extends StatelessWidget {
  const _EventsTitle();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'Eventos del mes',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: -.3,
            ),
          ),
        ),
        SizedBox(width: 12),
        Text(
          'Ver todos',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 4),
        Icon(Icons.arrow_forward_rounded, color: AppColors.white, size: 19),
      ],
    );
  }
}
