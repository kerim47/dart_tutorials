// Abstract classlar
//
abstract class Example {
  void sayCall();
}

class Example1 extends Example {
  @override
  void sayCall() {
    print('Merhaba, example1 dosyadan geliyor!');
  }
}

class Example2 extends Example {
  @override
  void sayCall() {
    print('Merhaba, example2 dosyadan geliyor!');
  }
}

void foo1() {
  var ex1 = Example1();
  ex1.sayCall();
}

// Bir abstract sınıf tanımlama
abstract class Animal {
  // Soyut metot tanımlama
  void makeSound();

  // Normal bir metot
  void sleep() {
    print('Hayvan uyuyor');
  }
}

class Dog extends Animal {
  // Abstract sınıfı genişletme ve soyut metodu uygulama
  @override
  void makeSound() {
    print('Köpek havlıyor');
  }
}

class Cat extends Animal {
  // Abstract sınıfı genişletme ve soyut metodu uygulama
  @override
  void makeSound() {
    print('Kedi miyavlıyor');
  }
}

void foo2() {
  final dog = Dog();
  final cat = Cat();

  dog.makeSound();
  cat.makeSound();
  dog.sleep();
}

abstract class Vehicle {
  void moveForward(int meters);
}

// Error: Cannot be constructed
// Vehicle myVehicle = Vehicle();

// Can be extended
class Car extends Vehicle {
  int passengers = 4;

  @override
  void moveForward(int meters) {
    print('Araç $meters metre ileri gidiyor.');
  }
}

// Can be implemented
class MockVehicle implements Vehicle {
  @override
  void moveForward(int meters) {
    // ...
  }
}

void foo3() {
  final car = Car();
  car.moveForward(100);
}

// Base

base class Vehicle2 {
  void moveForward(int meters) {
    // ...
  }
}

// Can be constructed
var myVehicle = Vehicle2();

// Can be extended
base class Car2 extends Vehicle {
  int passengers = 4;
  @override
  void moveForward(int meters) {
    // TODO: implement moveForward
  }
}

// ERROR: Cannot be implemented
// base class MockVehicle2 implements Vehicle {
//   @override
//   void moveForward() {
//     // ...
//   }
// }

// interface
interface class Vehicle3 {
  void moveForward(int meters) {
    // ...
  }
}

// Can be constructed
var myVehicle2 = Vehicle3();

// ERROR: Cannot be inherited
class Car3 extends Vehicle3 {
  int passengers = 4;
  // ...
}

// Can be implemented
class MockVehicle2 implements Vehicle {
  @override
  void moveForward(int meters) {
    // TODO: implement moveForward
  }
}

// final
// Miras almasını engeller.
final class Vehicle4 {
  void moveForward(int meters) {
    // ...
  }
}

// Can be constructed
Vehicle4 myVehicle3 = Vehicle4();

// ERROR: Cannot be inherited
// Miras almaya çalışan sınıf bir final, base veya sealed olmalıdır ki.
// Sınıflardan turetilmesin ve davranışı bozulmasın.
// class Car4 extends Vehicle4 {
//   int passengers = 4;
//   // ...
// }

class MockVehicle4 implements Vehicle {
  @override
  void moveForward(int meters) {
    // TODO: implement moveForward
  }
  // ERROR: Cannot be implemented
}

// Sealed
// Alt sınıfları sınırlandırmak amacıyla kullanırız.
sealed class Vehicle6 {}

class Car6 extends Vehicle6 {
  int passengers = 4;
  Car6(this.passengers);
}

class Bicycle extends Vehicle6 {
  int wheels = 2;
  Bicycle(this.wheels);
}

void foo4() {
  // ignore: unused_local_variable
  final car = Car6(4);
  // ignore: unused_local_variable
  final bicycle = Bicycle(2);

  // Vehicle sınıfı sealed olduğu için başka alt sınıf tanımlanamaz.
  // Örneğin, aşağıdaki kod hata verecektir:
  // class Motorcycle extends Vehicle {}
}

void main() => foo4();
