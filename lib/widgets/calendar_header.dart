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
          Positioned.fill(
            child: Image.asset(
              'assets/images/event_red_eyes.png',
              fit: BoxFit.cover,
              alignment: Alignment.centerRight,
            ),
          ),
          Positioned.fill(
            child: ClipPath(
              clipper: const _GoldenHeaderClipper(),
              child: Image.asset(
                'assets/images/event_golden_eyes.png',
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
              ),
            ),
          ),
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
              compact ? 20 : 26,
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
