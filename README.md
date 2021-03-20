# Rectify

[![pub](https://img.shields.io/pub/v/rectify.svg)](https://pub.dev/packages/rectify)
[![license: MIT](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)
![build](https://github.com/jpnurmi/dart_rectify/workflows/build/badge.svg)
[![codecov](https://codecov.io/gh/jpnurmi/dart_rectify/branch/master/graph/badge.svg)](https://codecov.io/gh/jpnurmi/dart_rectify)

Dart extension methods to make the [Rect](https://api.flutter.dev/flutter/dart-ui/Rect-class.html)
class pleasant and convenient to work with.

| Method | Description |
|---|---|
| `adjust` | Adjust by `dx1`, `dy1`, `dx2` and `dy2`. |
| `intersects` | Whether two rectangles intersect. |
| `moveBottom` | Moves along the bottom edge. |
| `moveBottomLeft` | Moves along the bottom left corner. |
| `moveBottomRight` | Moves along the bottom right corner. |
| `moveCenter` | Moves along the center. |
| `moveLeft` | Moves along the left edge. |
| `moveRight` | Moves along the right edge. |
| `moveTop` | Moves along the top edge. |
| `moveTopLeft` | Moves along the top left corner. |
| `moveTopRight` | Moves along the top right corner. |
| `normalize` | Ensures non-negative width and height. |
| `setBottom` | Sets the bottom edge. |
| `setBottomLeft` | Sets the bottom left corner. |
| `setBottomRight` | Sets the bottom right corner. |
| `setHeight` | Sets the height. |
| `setLeft` | Sets the left edge. |
| `setRight` | Sets the right edge. |
| `setTop` | Sets the top edge. |
| `setTopLeft` | Sets the top left corner. |
| `setTopRight` | Sets the top right corner. |
| `setWidth` | Sets the width. |
| `normalize` | Exchanges width and height. |
| `unite` | Bounding rectangle of two rectangles. |

## Usage

To use this package, add `rectify` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/)
and import the package:

```dart
import 'package:rectify/rectify.dart';
```

All above methods are extension methods and work on any object of type `Rect`.
