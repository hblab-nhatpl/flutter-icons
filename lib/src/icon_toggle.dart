import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Widget _defaultTransitionBuilder(Widget child, Animation<double> animation) => ScaleTransition(
      scale: animation,
      child: child,
    );

class IconToggle extends StatefulWidget {
  const IconToggle({
    super.key,
    this.unselectedIconData = Icons.radio_button_unchecked,
    this.selectedIconData = Icons.radio_button_checked,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.value = false,
    this.onChanged,
    this.transitionBuilder = _defaultTransitionBuilder,
    this.duration = const Duration(milliseconds: 100),
    this.reverseDuration,
  });

  final IconData selectedIconData;
  final IconData unselectedIconData;
  final Color activeColor;
  final Color inactiveColor;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  final Duration duration;
  final Duration? reverseDuration;

  @override
  State<IconToggle> createState() => _IconToggleState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<IconData>('selectedIconData', selectedIconData))
      ..add(DiagnosticsProperty<IconData>('unselectedIconData', unselectedIconData))
      ..add(ColorProperty('activeColor', activeColor))
      ..add(ColorProperty('inactiveColor', inactiveColor))
      ..add(DiagnosticsProperty<bool>('value', value))
      ..add(ObjectFlagProperty<ValueChanged<bool>?>.has('onChanged', onChanged))
      ..add(ObjectFlagProperty<AnimatedSwitcherTransitionBuilder>.has('transitionBuilder', transitionBuilder))
      ..add(DiagnosticsProperty<Duration>('duration', duration))
      ..add(DiagnosticsProperty<Duration?>('reverseDuration', reverseDuration));
  }
}

class _IconToggleState extends State<IconToggle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _position;
  bool _cancel = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 100), reverseDuration: const Duration(milliseconds: 50));
    _position = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _position.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed && widget.onChanged != null && !_cancel) {
        widget.onChanged!(widget.value);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (TapDownDetails event) async {
          _cancel = false;
          await _controller.forward();
        },
        onTapUp: (TapUpDetails event) async {
          await _controller.reverse();
        },
        onTapCancel: () async {
          _cancel = true;
          await _controller.reverse();
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: _IconToggleable<double>(
            listenable: _position,
            activeColor: widget.activeColor,
            inactiveColor: widget.inactiveColor,
            child: AnimatedSwitcher(
              duration: widget.duration,
              reverseDuration: widget.reverseDuration,
              transitionBuilder: widget.transitionBuilder,
              child: Icon(
                widget.value ? widget.selectedIconData : widget.unselectedIconData,
                color: widget.value ? widget.activeColor : widget.inactiveColor,
                size: 22,
                key: ValueKey<bool>(widget.value),
              ),
            ),
          ),
        ),
      );
}

class _IconToggleable<T> extends AnimatedWidget {
  const _IconToggleable({
    required Animation<T> listenable,
    this.activeColor,
    this.inactiveColor,
    this.child,
  }) : super(listenable: listenable);
  final Color? activeColor;
  final Color? inactiveColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _IconPainter(
          position: listenable as Animation<double>,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        ),
        child: child,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('activeColor', activeColor))
      ..add(ColorProperty('inactiveColor', inactiveColor));
  }
}

class _IconPainter extends CustomPainter {
  _IconPainter({
    @required this.position,
    this.activeColor,
    this.inactiveColor,
  });

  final Animation<double>? position;
  final Color? activeColor;
  final Color? inactiveColor;

  double get _value => position != null ? position!.value : 0;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color.lerp(inactiveColor, activeColor, _value)!.withValues(alpha: math.min(_value, 0.15))
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20 * _value, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
