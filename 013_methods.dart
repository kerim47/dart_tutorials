/* =============================================================================
#  Author:          Abdulkerim Akan - https://github.com/kerim47/
#  Email:           kerimakan77@gmail.com
#  FileName:        013_methods.dart
#  Description:     /
#  Version:         0.0.1
#  History:         
============================================================================= */

import 'dart:math';

// Ornek (instance) metodlar
class Point {
  final double x;
  final double y;

  Point(this.x, this.y);

  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void foo1() {
  var point = Point(0, 0);
  print(point.distanceTo(Point(1, 1)));
}

// Operator aşırı yuklenmesi
class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  @override
  bool operator ==(Object other) =>
      other is Vector && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);
}

void foo2() {
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  assert(v - w == Vector(0, 1));
}

// Getters and Setters
class Rectangle {
  double left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  double get right => left + width;
  set right(double value) => left = value - width;
  double get bottom => top + height;
  set bottom(double value) => top = value - height;
}

void foo3() {
  var rect = Rectangle(2, 4, 20, 15);
  assert(rect.left == 2);
  rect.right = 11;
  assert(rect.left == -9);
}

// Soyut method
abstract class Doer {
  void doSomething(); // Soyut metot.

  void doSomethingElse() {
    // Soyut metodu kullanarak işlemler yapabiliriz.
    print("Doer is doing something else.");
  }
}

class EffectiveDoer extends Doer {
  void doSomething() {
    print("EffectiveDoer is doing something.");
  }

  @override
  void doSomethingElse() {
    // Ebeveyn sınıfın metodu ezildi.
    print("EffectiveDoer is doing something else.");
  }
}

void foo4() {
  var doer = EffectiveDoer();
  doer.doSomething();
  doer.doSomethingElse();
}

void foo5() {}
void foo6() {}

void main() {
  foo4();
}
