// Author      : Abdulkerim Akan
// Email       : kerimakan77@gmail.com
// File Name   : 007_records.dart
// Created on  : 2023-09-11
// Description : This file contains records information.

// Records : kayıtlar birden fazla değişkeni bir arada tutan toplu türdür.

import 'dart:math' as math;

var record = ('first', a: 2, b: true, 'last');
void foo1() {
  // Record type annotation in a variable declaration:
  (String, int) record;

  // Initialize it with a record expression:
  record = ('A string', 123);
  Type a = record.runtimeType;
  print("$a");
  print(record);
}

void foo2() {
  (num, Object, num) myRecord = (1, "Kururu", 28);
  var (number as int, name as String, age as int) = myRecord;
  print(number);
  print(name);
  print(age);
}

void foo3() {
  // Record type annotation in a variable declaration:
  ({int a, bool b}) record1;
  (int a, bool b) record2;
  (int a, int b) record3;

  // Initialize it with a record expression:
  record1 = (a: 123, b: true);
  record2 = (123, true);
  record3 = (123, 456);

  print(record1 == record2);
  print("$record1");
  print("$record2");
  print(swap(record3));
}

(int, int) swap((int, int) record) {
  // var (a int, b as int) = record;
  var (a, b) = record;
  return (b, a);
}

void foo4() {
  // ({int a, int b}) recordAB = (a: 1, b: 2);
  // ({int x, int y}) recordXY = (x: 3, y: 4);

  // Compile error! These records don't have the same type.
  // recordAB = recordXY;

  (int a, int b) recordAB = (1, 2);
  (int x, int y) recordXY = (3, 4);

  recordAB = recordXY; // OK.
  print("${recordAB.$1}");
}

void foo5() {
  var record = ('first', a: 2, b: true, 'last');

  print(record.$1); // Prints 'first'
  print(record.a); // Prints 2
  print(record.b); // Prints true
  print(record.$2); // Prints 'last'
}

void foo6() {
  (num, Object) pair = (42, 'a');

  var first = pair.$1; // Static type `num`, runtime type `int`.
  var second = pair.$2; // Static type `Object`, runtime type `String`.
  print("$first $second");
}

void foo7() {
  (int x, int y, int z) point = (1, 2, 3);
  (int r, int g, int b) color = (1, 2, 3);

  print(point == color); // Prints 'true'.
}

void foo8() {
  ({int x, int y, int z}) point = (x: 1, y: 2, z: 3);
  ({int r, int g, int b}) color = (r: 1, g: 2, b: 3);

  print(point == color); // Prints 'false'. Lint: Equals on unrelated types.
}

// Returns multiple values in a record:
(String, int, String) userInfo(Map<String, dynamic> json) {
  return (json['name'] as String, json['age'] as int, json['color'] as String);
}

void foo9() {
  final json = <String, dynamic>{
    'name': 'Dash',
    'age': 10,
    'color': 'blue',
  };

  // Destructures using a record pattern:
  var (name, age, color) = userInfo(json);
  print("$name");
  print("$age");
  print("$color");

  /* Equivalent to:
    var info = userInfo(json);
    var name = info.$1;
    var age  = info.$2;
  */
}

void foo10() {
  var json = {
    'user': ['Lily', 13]
  };
  // var {'user': [name, age]} = json;

  if ( //json is Map<String, Object?> &&
      json.length == 1 && json.containsKey('user')) {
    var user = json['user'];
    if (user is List<Object> &&
        user.length == 2 &&
        user[0] is String &&
        user[1] is int) {
      var name = user[0] as String;
      var age = user[1] as int;
      print('User $name is $age years old.');
    }
  }
  if (json case {'user': [String name, int age]}) {
    print('User $name is $age years old.');
  }
}

void main(List<String> args) {
  foo1();
  foo2();
  foo3();
  foo4();
  foo5();
  foo6();
  foo7();
  foo8();
  foo9();
  foo10();
}

sealed class Shape {}

class Square implements Shape {
  final double length;
  Square(this.length);
}

class Circle implements Shape {
  final double radius;
  Circle(this.radius);
}

double calculateArea(Shape shape) => switch (shape) {
      Square(length: var l) => l * l,
      Circle(radius: var r) => math.pi * r * r
    };
