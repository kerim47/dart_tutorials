const double xOrigin = 0;
const double yOrigin = 0;

// NOTE: Kurucular miras alınamaz.
// Kurucuların miras alınmadığını unutmayın,
// bu da bir üst sınıfın adlandırılmış yapıcısı bir alt sınıf tarafından devralınmaz.

class Point {
  double x = 0;
  double y = 0;

  // Normal kullanım
  // Point(double x, double y) {
  //   this.x = x;
  //   this.y = y;
  // }

  // Formal parametrelerin kullanılması
  Point(this.x, this.y);

  // Birden fazla kurucu oluşturmak için
  // Named constructor
  Point.origin()
      : x = xOrigin,
        y = yOrigin;
  Point.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
  }
}

class Person {
  String? firstName;

  Person() {}

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson().
  Employee.fromJson(super.data) : super.fromJson() {
    print('in Employee');
  }
}

void foo1() {
  var point = Point(12.0, 25.0);
  print("${point.x} ${point.y}");
}

// Super parametreleri manuel girmek yerine Named constructor kullanılır.

class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y);
  Vector2d.named({required this.x, required this.y});
}

class Vector3d extends Vector2d {
  final double z;

  // Forward the x and y parameters to the default super constructor like:
  // Vector3d(final double x, final double y, this.z) : super(x, y);
  Vector3d(super.x, super.y, this.z);
  Vector3d.yzPlane({required super.y, required this.z}) : super.named(x: 0);
}

void foo2() {
  var employee = Employee.fromJson({});
  print(employee);
  // Prints:
  // in Person
  // in Employee
  // Instance of 'Employee'
  // Örnek bir JSON nesnesi
}

void foo3() {
  Map<String, double> json = {'x': 10.0, 'y': 20.0};

  // JSON nesnesini Point sınıfına dönüştürme
  Point pointFromJson = Point.fromJson(json);

  // Elde edilen Point nesnesini yazdırma
  print(pointFromJson);
}

// Sınıf hiç değişmeyen nesneler uretecekse const ctor kullanılır.
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(-1, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}

void foo4() {
  var point = ImmutablePoint(1, 2);
  print("${point.x} ${point.y}");
}

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

void foo5() {
  var logger = Logger('UI');
  logger.log('Button clicked');

  var logMap = {'name': 'UI'};
  // ignore: unused_local_variable
  var loggerJson = Logger.fromJson(logMap);
}

void main() {
  foo5();
}
