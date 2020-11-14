import 'dart:math';
import 'dart:ui';

extension Rectify on Rect {
  /// Returns a new rectangle with `dx1`, `dy1`, `dx2` and `dy2` added
  /// respectively to the existing coordinates of this rectangle.
  Rect adjust(double dx1, double dy1, double dx2, double dy2) {
    return Rect.fromLTRB(left + dx1, top + dy1, right + dx2, bottom + dy2);
  }

  /// Returns `true` if this rectangle intersects with the given rectangle
  /// (i.e. there is a non-empty area of overlap between them), otherwise
  /// returns `false`.
  ///
  /// The intersection rectangle can be retrieved using `Rect.intersect()`.
  bool intersects(Rect other) => !intersect(other).isEmpty;

  /// Moves the rectangle vertically, leaving the rectangle's bottom edge at
  /// the given `y` coordinate. The rectangle's size is unchanged.
  Rect moveBottom(double bottom) {
    return Rect.fromLTWH(left, bottom - height, width, height);
  }

  /// Moves the rectangle, leaving the bottom-left corner at the given position.
  /// The rectangle's size is unchanged.
  Rect moveBottomLeft(Offset bottomLeft) {
    return moveLeft(bottomLeft.dx).moveBottom(bottomLeft.dy);
  }

  /// Moves the rectangle, leaving the bottom-right corner at the given
  /// position. The rectangle's size is unchanged.
  Rect moveBottomRight(Offset bottomRight) {
    return moveRight(bottomRight.dx).moveBottom(bottomRight.dy);
  }

  /// Moves the rectangle, leaving the center point at the given position. The
  /// rectangle's size is unchanged.
  Rect moveCenter(Offset center) {
    return Rect.fromLTWH(
      center.dx - width / 2,
      center.dy - height / 2,
      width,
      height,
    );
  }

  /// Moves the rectangle horizontally, leaving the rectangle's left edge at the
  /// given position. The rectangle's size is unchanged.
  Rect moveLeft(double left) {
    return Rect.fromLTWH(left, top, width, height);
  }

  /// Moves the rectangle horizontally, leaving the rectangle's right edge at
  /// the given position. The rectangle's size is unchanged.
  Rect moveRight(double right) {
    return Rect.fromLTWH(right - width, top, width, height);
  }

  /// Moves the rectangle vertically, leaving the rectangle's top line at the
  /// given position. The rectangle's size is unchanged.
  Rect moveTop(double top) {
    return Rect.fromLTWH(left, top, width, height);
  }

  /// Moves the rectangle, leaving the top-left corner at the given position.
  /// The rectangle's size is unchanged.
  Rect moveTopLeft(Offset topLeft) {
    return moveLeft(topLeft.dx).moveTop(topLeft.dy);
  }

  /// Moves the rectangle, leaving the top-right corner at the given position.
  /// The rectangle's size is unchanged.
  Rect moveTopRight(Offset topRight) {
    return moveRight(topRight.dx).moveTop(topRight.dy);
  }

  /// Returns a normalized rectangle; i.e., a rectangle that has a non-negative
  /// width and height.
  ///
  /// If [Rect.width] < 0 the function swaps the left and right corners.
  /// If [Rect.height] < 0 the function swaps the top and bottom corners.
  Rect normalize() {
    return Rect.fromLTWH(left, top, width.abs(), height.abs());
  }

  /// Sets the bottom edge of the rectangle to the given position. May change
  /// the height, but will never change the top edge of the rectangle.
  Rect setBottom(double bottom) {
    return Rect.fromLTRB(left, top, right, bottom);
  }

  /// Set the bottom-left corner of the rectangle to the given position. May
  /// change the size, but will never change the top-right corner of the
  /// rectangle.
  Rect setBottomLeft(Offset bottomLeft) {
    return Rect.fromLTRB(
      bottomLeft.dx,
      top,
      right,
      bottomLeft.dy,
    );
  }

  /// Set the bottom-right corner of the rectangle to the given position. May
  /// change the size, but will never change the top-left corner of the
  /// rectangle.
  Rect setBottomRight(Offset bottomRight) {
    return Rect.fromLTRB(
      left,
      top,
      bottomRight.dx,
      bottomRight.dy,
    );
  }

  /// Sets the height of the rectangle to the given height. The bottom edge is
  /// changed, but not the top one.
  Rect setHeight(double height) {
    return Rect.fromLTWH(left, top, width, height);
  }

  /// Sets the left edge of the rectangle to the given position. May change the
  /// width, but will never change the right edge of the rectangle.
  Rect setLeft(double left) {
    return Rect.fromLTRB(left, top, right, bottom);
  }

  /// Sets the right edge of the rectangle to the given x coordinate. May change
  /// the width, but will never change the left edge of the rectangle.
  Rect setRight(double right) {
    return Rect.fromLTRB(left, top, right, bottom);
  }

  /// Sets the size of the rectangle to the given size. The top-left corner is
  /// not moved.
  Rect setSize(Size size) {
    return Rect.fromLTWH(left, top, size.width, size.height);
  }

  /// Sets the top edge of the rectangle to the given position. May change the
  /// height, but will never change the bottom edge of the rectangle.
  Rect setTop(double top) {
    return Rect.fromLTRB(left, top, right, bottom);
  }

  /// Set the top-left corner of the rectangle to the given position. May change
  /// the size, but will never change the bottom-right corner of the rectangle.
  Rect setTopLeft(Offset topLeft) {
    return Rect.fromLTRB(
      topLeft.dx,
      topLeft.dy,
      right,
      bottom,
    );
  }

  /// Set the top-right corner of the rectangle to the given position. May
  /// change the size, but will never change the bottom-left corner of the
  /// rectangle.
  Rect setTopRight(Offset topRight) {
    return Rect.fromLTRB(
      left,
      topRight.dy,
      topRight.dx,
      bottom,
    );
  }

  /// Sets the width of the rectangle to the given width. The right edge is
  /// changed, but not the left one.
  Rect setWidth(double width) {
    return Rect.fromLTWH(left, top, width, height);
  }

  /// Returns a new rectangle that has its width and height exchanged.
  Rect transpose() {
    final sz = size.flipped;
    return Rect.fromLTWH(left, top, sz.width, sz.height);
  }

  /// Returns the bounding rectangle of this rectangle and the given rectangle.
  Rect unite(Rect other) {
    return Rect.fromLTRB(
      min(left, other.left),
      min(top, other.top),
      max(right, other.right),
      max(bottom, other.bottom),
    );
  }
}
