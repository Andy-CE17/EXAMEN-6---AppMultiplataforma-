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
          const Positioned.fill(child: ColoredBox(color: Color(0xFF050711))),
          Positioned.fill(
            child: Image.asset(
              'assets/images/event_red_eyes.png',
              fit: BoxFit.fill,
              alignment: Alignment.centerRight,
            ),
          ),
          Positioned.fill(
            child: ClipPath(
              clipper: const _GoldenHeaderClipper(),
              child: Image.asset(
                'assets/images/event_golden_eyes.png',
                fit: BoxFit.fill,
                alignment: Alignment.centerRight,
              ),
            ),
          ),
          const Positioned.fill(child: CustomPaint(painter: _HeaderLines())),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color(0xFF050812).withValues(alpha: .98),
                    const Color(0xFF080B19).withValues(alpha: .9),
                    const Color(0xFF130D20).withValues(alpha: .28),
                    Colors.black.withValues(alpha: .08),
                  ],
                  stops: const [0, .38, .68, 1],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              compact ? 20 : 26,
              compact ? 9 : 18,
              compact ? 24 : 26,
              compact ? 3 : 10,
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
                SizedBox(height: compact ? 6 : 34),
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
                      width: compact ? 32 : 46,
                      height: compact ? 32 : 46,
                      padding: EdgeInsets.all(compact ? 1 : 1.5),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFFFF8A1E), Color(0xFF9A3BFF)],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF111019),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person_rounded,
                          color: AppColors.white,
                          size: compact ? 22 : 30,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: compact ? 3 : 12),
                Text(
                  'Septiembre',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: compact ? 27 : 38,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -.8,
                  ),
                ),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFFFF681F),
                      Color(0xFFFF387B),
                      Color(0xFF7B3DFF),
                      Color(0xFFFFCB26),
                    ],
                  ).createShader(bounds),
                  child: Text(
                    '2026',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: compact ? 36 : 52,
                      height: 1.08,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
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

class _GoldenHeaderClipper extends CustomClipper<Path> {
  const _GoldenHeaderClipper();

  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width, size.height * .28)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * .37, size.height)
      ..lineTo(size.width * .64, size.height * .52)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _HeaderLines extends CustomPainter {
  const _HeaderLines();

  @override
  void paint(Canvas canvas, Size size) {
    final purpleGlow = Paint()
      ..color = const Color(0xFFAE35FF).withValues(alpha: .34)
      ..strokeWidth = 5
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 7);
    final purpleLine = Paint()
      ..color = const Color(0xFFC348FF)
      ..strokeWidth = 1.25;
    final orangeGlow = Paint()
      ..color = const Color(0xFFFF681F).withValues(alpha: .35)
      ..strokeWidth = 4
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    final orangeLine = Paint()
      ..color = const Color(0xFFFF7B21)
      ..strokeWidth = 1;

    final purpleStart = Offset(size.width * .36, size.height * .92);
    final purpleEnd = Offset(size.width, size.height * .28);
    canvas
      ..drawLine(purpleStart, purpleEnd, purpleGlow)
      ..drawLine(purpleStart, purpleEnd, purpleLine);

    final orangeStart = Offset(size.width * .52, 0);
    final orangeEnd = Offset(size.width * .36, size.height * .5);
    canvas
      ..drawLine(orangeStart, orangeEnd, orangeGlow)
      ..drawLine(orangeStart, orangeEnd, orangeLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
