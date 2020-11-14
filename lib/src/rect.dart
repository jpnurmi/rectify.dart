import 'dart:math';
import 'dart:ui';

extension Rectify on Rect {
  Rect adjust(double dx1, double dy1, double dx2, double dy2) {
    return Rect.fromLTRB(left + dx1, top + dy1, right + dx2, bottom + dy2);
  }

  bool intersects(Rect other) => !intersect(other).isEmpty;

  Rect moveBottom(double bottom) {
    return Rect.fromLTWH(left, bottom - height, width, height);
  }

  Rect moveBottomLeft(Offset bottomLeft) {
    return moveLeft(bottomLeft.dx).moveBottom(bottomLeft.dy);
  }

  Rect moveBottomRight(Offset bottomRight) {
    return moveRight(bottomRight.dx).moveBottom(bottomRight.dy);
  }

  Rect moveCenter(Offset center) {
    return Rect.fromLTWH(
      center.dx - width / 2,
      center.dy - height / 2,
      width,
      height,
    );
  }

  Rect moveLeft(double left) {
    return Rect.fromLTWH(left, top, width, height);
  }

  Rect moveRight(double right) {
    return Rect.fromLTWH(right - width, top, width, height);
  }

  Rect moveTop(double top) {
    return Rect.fromLTWH(left, top, width, height);
  }

  Rect moveTopLeft(Offset topLeft) {
    return moveLeft(topLeft.dx).moveTop(topLeft.dy);
  }

  Rect moveTopRight(Offset topRight) {
    return moveRight(topRight.dx).moveTop(topRight.dy);
  }

  Rect normalize() {
    return Rect.fromLTWH(left, top, width.abs(), height.abs());
  }

  Rect resize(Size size) {
    return Rect.fromLTWH(left, top, size.width, size.height);
  }

  Rect setBottom(double bottom) {
    return Rect.fromLTRB(left, top, right, bottom);
  }

  Rect setBottomLeft(Offset bottomLeft) {
    return Rect.fromLTRB(
      bottomLeft.dx,
      top,
      right,
      bottomLeft.dy,
    );
  }

  Rect setBottomRight(Offset bottomRight) {
    return Rect.fromLTRB(
      left,
      top,
      bottomRight.dx,
      bottomRight.dy,
    );
  }

  Rect setHeight(double height) {
    return Rect.fromLTWH(left, top, width, height);
  }

  Rect setLeft(double left) {
    return Rect.fromLTRB(left, top, right, bottom);
  }

  Rect setRight(double right) {
    return Rect.fromLTRB(left, top, right, bottom);
  }

  Rect setTop(double top) {
    return Rect.fromLTRB(left, top, right, bottom);
  }

  Rect setTopLeft(Offset topLeft) {
    return Rect.fromLTRB(
      topLeft.dx,
      topLeft.dy,
      right,
      bottom,
    );
  }

  Rect setTopRight(Offset topRight) {
    return Rect.fromLTRB(
      left,
      topRight.dy,
      topRight.dx,
      bottom,
    );
  }

  Rect setWidth(double width) {
    return Rect.fromLTWH(left, top, width, height);
  }

  Rect transpose() {
    final sz = size.flipped;
    return Rect.fromLTWH(left, top, sz.width, sz.height);
  }

  Rect unite(Rect other) {
    return Rect.fromLTRB(
      min(left, other.left),
      min(top, other.top),
      max(right, other.right),
      max(bottom, other.bottom),
    );
  }
}
