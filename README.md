# Rectify

[![pub](https://img.shields.io/pub/v/rectify.svg)](https://pub.dev/packages/rectify)
[![license: MIT](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)
![build](https://github.com/jpnurmi/dart_rectify/workflows/build/badge.svg)
[![codecov](https://codecov.io/gh/jpnurmi/dart_rectify/branch/main/graph/badge.svg)](https://codecov.io/gh/jpnurmi/dart_rectify)

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

All above methods are extension methods and work on any object of type `Rect`.

## Usage

To use this package, add `rectify` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/)

```dart
import 'package:rectify/rectify.dart';

void main() {
  const ltrb1234 = Rect.fromLTRB(1, 2, 3, 4);
  const ltrb2345 = Rect.fromLTRB(2, 3, 4, 5);
  const ltrb5678 = Rect.fromLTRB(5, 6, 7, 8);
  const ltwh1234 = Rect.fromLTWH(1, 2, 3, 4);

  // adjust
  print(ltrb1234.adjust(1, 2, 3, 4)); // Rect.fromLTRB(2, 4, 6, 8)

  // intersection
  print(ltrb1234.intersects(ltrb2345)); // true
  print(ltrb1234.intersects(ltrb5678)); // false

  // move edge
  print(ltrb1234.moveLeft(5)); // Rect.fromLTRB(5, 2, 7, 4)
  print(ltrb1234.moveTop(5)); // Rect.fromLTRB(1, 5, 3, 7)
  print(ltrb1234.moveRight(5)); // Rect.fromLTRB(3, 2, 5, 4)
  print(ltrb1234.moveBottom(5)); // Rect.fromLTRB(1, 3, 3, 5)

  // move corner
  print(ltrb1234.moveTopLeft(Offset(5, 6))); // Rect.fromLTRB(5, 6, 7, 8)
  print(ltrb1234.moveTopRight(Offset(5, 6))); // Rect.fromLTRB(3, 6, 5, 8)
  print(ltrb1234.moveBottomLeft(Offset(5, 6))); // Rect.fromLTRB(5, 4, 7, 6)
  print(ltrb1234.moveBottomRight(Offset(5, 6))); // Rect.fromLTRB(3, 4, 5, 6)

  // move center
  print(ltrb1234.moveCenter(Offset(5, 6))); // Rect.fromLTRB(4, 5, 6, 7)

  // normalize
  print(Rect.fromLTWH(1, 2, -3, -4).normalize()); // Rect.fromLTWH(1, 2, 3, 4)

  // set edge
  print(ltrb1234.setBottom(5)); // Rect.fromLTRB(1, 2, 3, 5)
  print(ltrb1234.setLeft(5)); // Rect.fromLTRB(5, 2, 3, 4)
  print(ltrb1234.setRight(5)); // Rect.fromLTRB(1, 2, 5, 4)
  print(ltrb1234.setTop(5)); // Rect.fromLTRB(1, 5, 3, 4)

  // set corner
  print(ltrb1234.setTopLeft(Offset(5, 6))); // Rect.fromLTRB(5, 6, 3, 4)
  print(ltrb1234.setTopRight(Offset(5, 6))); // Rect.fromLTRB(1, 6, 5, 4)
  print(ltrb1234.setBottomLeft(Offset(5, 6))); // Rect.fromLTRB(5, 2, 3, 6)
  print(ltrb1234.setBottomRight(Offset(5, 6))); // Rect.fromLTRB(1, 2, 5, 6)

  // size
  print(ltwh1234.setSize(Size(5, 6))); // Rect.fromLTWH(1, 2, 5, 6))
  print(ltwh1234.setWidth(5)); // Rect.fromLTWH(1, 2, 5, 4))
  print(ltwh1234.setHeight(5)); // Rect.fromLTWH(1, 2, 3, 5))

  // transpose
  print(ltwh1234.transpose()); //Rect.fromLTWH(1, 2, 4, 3))

  // unite
  print(ltrb1234.unite(ltrb5678)); // Rect.fromLTRB(1, 2, 7, 8)
}
```
