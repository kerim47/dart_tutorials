/* =============================================================================
#  Author:          Abdulkerim Akan - https://github.com/kerim47/
#  Email:           kerimakan77@gmail.com
#  FileName:        014_extends.dart
#  Description:     /
#  Version:         0.0.1
#  History:         
============================================================================= */

class Television {
  void _illuminateDisplay() {
    print("Ekranı aydınlatma işlemini burada gerçekleştirin.");
  }

  void _activateIrSensor() {
    print("Kızılötesi sensörü etkinleştirme işlemini burada gerçekleştirin.");
  }

  void turnOn() {
    _illuminateDisplay();
    _activateIrSensor();
  }
  // Diğer televizyon işlemleri buraya eklenebilir.
}

class SmartTelevision extends Television {
  void _bootNetworkInterface() {
    print("// Ağ arabirimini başlatma işlemini burada gerçekleştirin.");
  }

  void _initializeMemory() {
    print("// Belleği başlatma işlemini burada gerçekleştirin.");
  }

  void _upgradeApps() {
    print("// Uygulamaları güncelleme işlemini burada gerçekleştirin.");
  }

  @override
  void turnOn() {
    super.turnOn(); // Üst sınıfın turnOn metodunu çağır.
    _bootNetworkInterface();
    _initializeMemory();
    _upgradeApps();
  }
  // Akıllı televizyon için diğer işlemler buraya eklenebilir.
}

void foo1() {
  // Basit bir televizyon oluşturun
  Television basicTv = Television();
  print("Basic TV is turned on:");
  basicTv.turnOn();
  print("\n");

  // Akıllı bir televizyon oluşturun
  SmartTelevision smartTv = SmartTelevision();
  print("Smart TV is turned on:");
  smartTv.turnOn();
}

// Fonksiyon ezme
class Television2 {
  // ···
  set contrast(int value) {}
}

class SmartTelevision2 extends Television2 {
  @override
  set contrast(num value) {}
}

// Olmayan bir yontem çağrıldığı zaman otomatik olarak tanımlanan noSuchMethod metodunu çağırır.
class Person {
  @override //overring noSuchMethod
  noSuchMethod(Invocation invocation) =>
      'Got the ${invocation.memberName} with arguments ${invocation.positionalArguments}';
}

// class Person {
//   missing(int age, String name);
//
//   @override //overriding noSuchMethod
//   noSuchMethod(Invocation invocation) =>
//       'Got the ${invocation.memberName} with arguments ${invocation.positionalArguments}';
// }

void foo2() {
  dynamic person =
      new Person(); // person is declared dynamic hence staifies the first point
  print(person.missing(
      20, 'shubham')); //We are calling an unimplemented method called 'missing'
}

void main() {
  foo2();
}
