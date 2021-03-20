import 'package:flutter_test/flutter_test.dart';
import 'package:rectify/rectify.dart';

void main() {
  test('adjust', () {
    expect(
      Rect.fromLTRB(1, 2, 3, 4).adjust(1, 2, 3, 4),
      equals(Rect.fromLTRB(2, 4, 6, 8)),
    );
  });

  test('intersects', () {
    expect(
      Rect.fromLTRB(1, 2, 3, 4).intersects(Rect.fromLTRB(2, 3, 4, 5)),
      isTrue,
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).intersects(Rect.fromLTRB(5, 6, 7, 8)),
      isFalse,
    );
  });

  test('move', () {
    expect(
      Rect.fromLTRB(1, 2, 3, 4).moveBottom(5),
      equals(Rect.fromLTRB(1, 3, 3, 5)),
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).moveLeft(5),
      equals(Rect.fromLTRB(5, 2, 7, 4)),
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).moveRight(5),
      equals(Rect.fromLTRB(3, 2, 5, 4)),
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).moveTop(5),
      equals(Rect.fromLTRB(1, 5, 3, 7)),
    );

    expect(
      Rect.fromLTRB(1, 2, 3, 4).moveBottomLeft(Offset(5, 6)),
      equals(Rect.fromLTRB(5, 4, 7, 6)),
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).moveBottomRight(Offset(5, 6)),
      equals(Rect.fromLTRB(3, 4, 5, 6)),
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).moveCenter(Offset(5, 6)),
      equals(Rect.fromLTRB(4, 5, 6, 7)),
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).moveTopLeft(Offset(5, 6)),
      equals(Rect.fromLTRB(5, 6, 7, 8)),
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).moveTopRight(Offset(5, 6)),
      equals(Rect.fromLTRB(3, 6, 5, 8)),
    );
  });

  test('normalize', () {
    expect(
      Rect.fromLTWH(1, 2, -3, -4).normalize(),
      equals(Rect.fromLTWH(1, 2, 3, 4)),
    );
  });

  test('set', () {
    expect(
      Rect.fromLTRB(1, 2, 3, 4).setBottom(5),
      equals(Rect.fromLTRB(1, 2, 3, 5)),
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).setLeft(5),
      equals(Rect.fromLTRB(5, 2, 3, 4)),
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).setRight(5),
      equals(Rect.fromLTRB(1, 2, 5, 4)),
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).setTop(5),
      equals(Rect.fromLTRB(1, 5, 3, 4)),
    );

    expect(
      Rect.fromLTRB(1, 2, 3, 4).setBottomLeft(Offset(5, 6)),
      equals(Rect.fromLTRB(5, 2, 3, 6)),
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).setBottomRight(Offset(5, 6)),
      equals(Rect.fromLTRB(1, 2, 5, 6)),
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).setTopLeft(Offset(5, 6)),
      equals(Rect.fromLTRB(5, 6, 3, 4)),
    );
    expect(
      Rect.fromLTRB(1, 2, 3, 4).setTopRight(Offset(5, 6)),
      equals(Rect.fromLTRB(1, 6, 5, 4)),
    );

    expect(
      Rect.fromLTWH(1, 2, 3, 4).setSize(Size(5, 6)),
      equals(Rect.fromLTWH(1, 2, 5, 6)),
    );
    expect(
      Rect.fromLTWH(1, 2, 3, 4).setWidth(5),
      equals(Rect.fromLTWH(1, 2, 5, 4)),
    );
    expect(
      Rect.fromLTWH(1, 2, 3, 4).setHeight(5),
      equals(Rect.fromLTWH(1, 2, 3, 5)),
    );
  });

  test('transpose', () {
    expect(
      Rect.fromLTWH(1, 2, 3, 4).transpose(),
      equals(Rect.fromLTWH(1, 2, 4, 3)),
    );
  });

  test('unite', () {
    expect(
      Rect.fromLTRB(1, 2, 3, 4).unite(Rect.fromLTRB(5, 6, 7, 8)),
      equals(Rect.fromLTRB(1, 2, 7, 8)),
    );
  });
}
