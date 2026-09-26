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
            const Color(0xFF160B1D).withValues(alpha: .97),
            const Color(0xFF080A10).withValues(alpha: .98),
            const Color(0xFF27200B).withValues(alpha: .95),
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
        border: Border.all(
          color: const Color(0xFFFF9A18).withValues(alpha: .78),
          width: 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipPath(
              clipper: const _SelectedSectionClipper(),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF351020).withValues(alpha: .82),
                      const Color(0xFF170B18).withValues(alpha: .86),
                      const Color(0xFF090A0F).withValues(alpha: .96),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Positioned.fill(
            child: CustomPaint(painter: _SelectedSectionBorder()),
          ),
          Row(
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
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: compact ? 22 : 29,
              color: selected
                  ? const Color(0xFFFF681F)
                  : Colors.white.withValues(alpha: .62),
            ),
            SizedBox(height: compact ? 2 : 4),
            Text(
              label,
              style: TextStyle(
                color: selected
                    ? const Color(0xFFFF7A24)
                    : Colors.white.withValues(alpha: .7),
                fontSize: compact ? 10 : 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: compact ? 2 : 5),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: selected ? (compact ? 50 : 62) : 0,
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

class _SelectedSectionClipper extends CustomClipper<Path> {
  const _SelectedSectionClipper();

  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * .31, 0)
      ..cubicTo(
        size.width * .37,
        0,
        size.width * .37,
        size.height * .73,
        size.width * .47,
        size.height,
      )
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _SelectedSectionBorder extends CustomPainter {
  const _SelectedSectionBorder();

  Path _curve(Size size) {
    return Path()
      ..moveTo(size.width * .31, 0)
      ..cubicTo(
        size.width * .37,
        0,
        size.width * .37,
        size.height * .73,
        size.width * .47,
        size.height,
      );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final curve = _curve(size);
    final glow = Paint()
      ..color = const Color(0xFFFF681F).withValues(alpha: .48)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 7);
    final line = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFFFFA11F), Color(0xFFFF541F)],
      ).createShader(Offset.zero & size)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;

    canvas
      ..drawPath(curve, glow)
      ..drawPath(curve, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
