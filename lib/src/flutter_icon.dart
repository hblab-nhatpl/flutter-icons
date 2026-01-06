import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Creates an Icon Widget that works for non-material Icons, such as the
/// Font Awesome Icons.
///
/// The default `Icon` Widget from the Material package assumes all Icons are
/// square in size and wraps all Icons in a square SizedBox Widget. Icons from
/// the FontAwesome package are often wider than they are tall, which causes
/// alignment and cutoff issues.
///
/// This Widget does not wrap the icons in a fixed square box, which allows the
/// icons to render based on their size.
///
/// This is basically a copy of flutter's original `Icon` widget, but with the
/// `SizedBox` and `Center` widgets removed.
///
/// Original source code:
/// https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/widgets/icon.dart
class FlutterIcon extends FaIcon {
  /// Creates an icon.
  const FlutterIcon(
    super.icon, {
    super.key,
    super.size,
    super.fill,
    super.weight,
    super.grade,
    super.opticalSize,
    super.color,
    super.shadows,
    super.semanticLabel,
    super.textDirection,
    super.applyTextScaling,
    super.blendMode,
    super.fontWeight,
  })  : assert(fill == null || (0.0 <= fill && fill <= 1.0), 'fill must be null or between 0.0 and 1.0 (inclusive)'),
        assert(weight == null || (0.0 < weight), 'weight must be null or greater than 0.0'),
        assert(opticalSize == null || (0.0 < opticalSize), 'opticalSize must be null or greater than 0.0');
}
