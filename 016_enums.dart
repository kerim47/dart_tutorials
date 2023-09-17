/* =============================================================================
#  Author:          Abdulkerim Akan - https://github.com/kerim47/
#  Email:           kerimakan77@gmail.com
#  FileName:        016_enums.dart
#  Description:     /
#  Version:         0.0.1
#  History:         
============================================================================= */

enum Color { red, green, blue }

void foo1() {
  Color color = Color.red;
  print('Color name is "${color.name}" and color index is "${color.index}"');

  final favoriteColor = Color.blue;
  if (favoriteColor == Color.blue) {
    print('Your favorite color is blue!');
  }
}

// Enum olarak sınıflarda bildirilebilir.
enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  bool get isTwoWheeled => this == Vehicle.bicycle;

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}

void foo2() {
  // Vehicle enumundan örnekler oluşturarak kullanım örnekleri:
  final myCar = Vehicle.car;
  final myBus = Vehicle.bus;
  final myBicycle = Vehicle.bicycle;

  // Oluşturulan örnekleri kullanma:
  print(
      'My car has "${myCar.tires}" tires and can carry "${myCar.passengers}" passengers.');
  print(
      'My bus has "${myBus.tires}" tires and can carry "${myBus.passengers}" passengers.');
  print(
      'My bicycle has "${myBicycle.tires}" tires and can carry "${myBicycle.passengers}" passenger.');

  // Diğer özelliklere erişme:
  print('Carbon footprint of my car: "${myCar.carbonFootprint}"');
  print('Is my bicycle two-wheeled? "${myBicycle.isTwoWheeled}"');

  // Enum değerlerini karşılaştırma:
  final result = myCar.compareTo(myBus);
  print('Comparison result between car and bus: "$result');
}

void foo3() {
  assert(Color.red.index == 0);
  assert(Color.green.index == 1);
  assert(Color.blue.index == 2);
}

void foo4() {
  List<Color> colors = Color.values;
  assert(colors[2] == Color.blue);
}

void foo5() {
  var aColor = Color.blue;

  switch (aColor) {
    case Color.red:
      print('Red as roses!');
    case Color.green:
      print('Green as grass!');
    default: // Without this, you see a WARNING.
      print(aColor); // 'Color.blue'
  }
}

void main(List<String> args) {
  foo5();
}
