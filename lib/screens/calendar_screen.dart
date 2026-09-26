import 'package:flutter/foundation.dart';
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
      color: Color(0xFFD74B1F),
      icon: Icons.laptop_mac_rounded,
      backgroundImage: 'assets/images/event_red_eyes.png',
    ),
    CalendarEvent(
      day: '12',
      month: 'SEP',
      time: '2:30 p. m.',
      title: 'Exposición de proyecto',
      location: 'Aula 201',
      color: Color(0xFF6D2CB3),
      icon: Icons.groups_2_outlined,
      backgroundImage: 'assets/images/event_purple_eyes.png',
    ),
    CalendarEvent(
      day: '21',
      month: 'SEP',
      time: '11:59 p. m.',
      title: 'Entrega de laboratorio',
      location: 'Plataforma virtual',
      color: Color(0xFFB57C18),
      icon: Icons.description_outlined,
      backgroundImage: 'assets/images/event_golden_eyes.png',
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
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF070914).withValues(alpha: .62),
                Colors.black.withValues(alpha: .3),
                const Color(0xFF2B1704).withValues(alpha: .42),
              ],
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final showPhoneFrame = kIsWeb
                  ? constraints.maxWidth >= 420 && constraints.maxHeight >= 500
                  : constraints.maxWidth >= 560 && constraints.maxHeight >= 650;
              if (!showPhoneFrame) {
                return const _CalendarContent(events: _events);
              }

              final phoneHeight = (constraints.maxHeight - 28)
                  .clamp(460, 880)
                  .toDouble();
              final widthFromHeight = phoneHeight * .54;
              final maximumWidth = (constraints.maxWidth - 64)
                  .clamp(350, 460)
                  .toDouble();
              final phoneWidth = widthFromHeight < maximumWidth
                  ? widthFromHeight
                  : maximumWidth;

              return Center(
                child: _PhoneFrame(
                  width: phoneWidth,
                  height: phoneHeight,
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: SizedBox(
                      width: 376,
                      height: 720,
                      child: _CalendarContent(events: _events, compact: true),
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

class _PhoneFrame extends StatelessWidget {
  const _PhoneFrame({
    required this.width,
    required this.height,
    required this.child,
  });

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(left: -4, top: 130, child: _SideButton(height: 58)),
            Positioned(left: -4, top: 206, child: _SideButton(height: 82)),
            Positioned(right: -4, top: 180, child: _SideButton(height: 104)),
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF747875),
                      Color(0xFF070807),
                      Color(0xFF303330),
                      Color(0xFF020302),
                    ],
                    stops: [0, .13, .6, 1],
                  ),
                  borderRadius: BorderRadius.circular(54),
                  border: Border.all(
                    color: const Color(0xFFB0B3AD),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .75),
                      blurRadius: 46,
                      spreadRadius: 8,
                      offset: const Offset(0, 18),
                    ),
                    BoxShadow(
                      color: Colors.white.withValues(alpha: .16),
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: const Offset(-2, -2),
                    ),
                  ],
                ),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    border: Border.all(
                      color: Colors.black.withValues(alpha: .9),
                      width: 2,
                    ),
                  ),
                  child: child,
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 142,
                  height: 29,
                  decoration: BoxDecoration(
                    color: const Color(0xFF020303),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .5),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: const Alignment(.62, 0),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: const Color(0xFF102923),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF234E44)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SideButton extends StatelessWidget {
  const _SideButton({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF111311),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF555955), width: .7),
      ),
    );
  }
}

class _CalendarContent extends StatelessWidget {
  const _CalendarContent({required this.events, this.compact = false});

  final List<CalendarEvent> events;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Column(
        children: [
          const CalendarHeader(compact: true),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 6, 14, 7),
              child: Column(
                children: [
                  const CalendarGrid(compact: true),
                  const SizedBox(height: 7),
                  const _EventsTitle(compact: true),
                  const SizedBox(height: 5),
                  ...events.map(
                    (event) => EventCard(event: event, compact: true),
                  ),
                ],
              ),
            ),
          ),
          const CalendarBottomNav(compact: true),
        ],
      );
    }

    return SafeArea(
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
                    padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
                    child: Column(
                      children: [
                        const CalendarGrid(),
                        const SizedBox(height: 20),
                        const _EventsTitle(),
                        const SizedBox(height: 12),
                        ...events.map((event) => EventCard(event: event)),
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
    );
  }
}

class _EventsTitle extends StatelessWidget {
  const _EventsTitle({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Eventos del mes',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.white,
              fontSize: compact ? 16 : 20,
              fontWeight: FontWeight.w700,
              letterSpacing: -.3,
            ),
          ),
        ),
        SizedBox(width: compact ? 8 : 12),
        Text(
          'Ver todos',
          style: TextStyle(
            color: const Color(0xFFFF681F),
            fontSize: compact ? 11 : 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 4),
        Icon(
          Icons.arrow_forward_rounded,
          color: const Color(0xFFFF681F),
          size: compact ? 15 : 19,
        ),
      ],
    );
  }
}
