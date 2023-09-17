import 'dart:math' as math;

void foo1() {
  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }
  print(message);
}

String join(List<String> list, [String separator = ""]) {
  StringBuffer buffer = StringBuffer();
  buffer.writeAll(list, separator);
  return buffer.toString();
}

String join2(Iterable<String> iterable, [String separator = ""]) {
  return iterable.join(separator);
}

void foo2() {
  List<String> fruits = ['apple', 'banana', 'orange'];
  String result = join(fruits, ', '); // Kullanım örneği
  print(result); // Çıktı: "apple, banana, orange"
}

void foo3() {
  List<String> fruits = ['apple', 'banana', 'orange'];
  String result = join2(fruits, ', '); // Kullanım örneği
  print(result); // Çıktı: "apple, banana, orange"
}

void TimeElapsed(Function func) {
  var startTime = DateTime.now();
  func();
  var endTime = DateTime.now();
  print(endTime.difference(startTime).inMicroseconds);
}

void foo4() {
  TimeElapsed(foo2);
  TimeElapsed(foo3);
}

void foo5() {
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print("Sira no $i"));
  }

  for (var func in callbacks) {
    func();
  }
}

class Candidate {
  final String name;
  final int yearsExperience;

  Candidate(this.name, this.yearsExperience);

  void interview() {
    print('$name is being interviewed.');
  }
}

void foo6() {
  Iterable<Candidate> candidates = [
    Candidate('Alice', 5),
    Candidate('Bob', 7),
    Candidate('Charlie', 3),
  ];

  for (final candidate in candidates) {
    candidate.interview();
  }

  // Using pattern matching in for-in loop to process values
  for (final Candidate(:name, :yearsExperience) in candidates) {
    print('$name has $yearsExperience of experience.');
  }
}

void foo7() {
  var collection = [1, 2, 3];
  collection.forEach(print); // 1 2 3
}

bool isDone() {
  bool key = false;
  return key;
}

void doSomething() {
  print("Doing something...");
}

void foo8() {
  while (!isDone()) {
    doSomething();
  }
}

void printLine() {
  print('This is a line.');
}

bool atEndOfPage() {
  return false;
}

void foo9() {
  do {
    printLine();
  } while (!atEndOfPage());
}

bool shutDownRequested() {
  return false;
}

void processIncomingRequests() {
  print('Processing incoming requests...');
}

void foo() {
  while (true) {
    if (shutDownRequested()) break;
    processIncomingRequests();
  }
}

void bar() {
  List<Candidate> candidates = [
    Candidate('Alice', 5),
    Candidate('Bob', 7),
    Candidate('Charlie', 3),
  ];

  for (int i = 0; i < candidates.length; i++) {
    var candidate = candidates[i];
    if (candidate.yearsExperience < 5) {
      continue;
    }
    candidate.interview();
  }
}

void baz() {
  List<Candidate> candidates = [
    Candidate('Alice', 5),
    Candidate('Bob', 7),
    Candidate('Charlie', 3),
  ];

  candidates.where((c) => c.yearsExperience >= 5).forEach((c) => c.interview());
}

void foo10() {
  bar();
}

class Point {
  final int x;
  final int y;
  Point(this.x, this.y);
}

void foo11() {
  Point pair = Point(10, 20);
  if (pair case [int x, int y]) {
    print('Was coordinate array $x,$y');
  } else {
    throw FormatException('Invalid coordinates.');
  }
}

// Switch expression
void foo12() {
  var dayOfWeek = 'Monday';
  var dayNumber = switch (dayOfWeek) {
    'Monday' => 1,
    'Tuesday' => 2,
    'Wednesday' => 3,
    'Thursday' => 4,
    'Friday' => 5,
    'Saturday' => 6,
    'Sunday' => 7,
    _ => 10, //Default value
  };
  print(dayNumber);
  var x = 42;
  print(switch (x) {
    42 => 'The Answer',
    _ => 'Not the answer',
  }); // Çıktı: The Answer

  print(switch (x) {
    10 => 'x is 10',
    20 => 'x is 20',
    _ => 'x is neither 10 nor 20',
  });
  print(getSwitch(x));
}

String getSwitch(var result) {
  return switch (result) {
    42 => 'The Answer',
    _ => 'Not the answer',
  };
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

// Switch ifadeleri fonkisyon parametresi olarak kullanma
double calculateArea(Shape shape) => switch (shape) {
      Square(length: var l) => l * l,
      Circle(radius: var r) => math.pi * r * r
    };

void foo13() {
  final shape = Square(5.0); // Bir şekil oluştur
  final area = calculateArea(shape);
  print('Alan: $area'); // Alanı yazdır
}

void foo14() {
  (int? a, int b) pair = (30, 40);
  switch (pair) {
    case (int a, int b) when a > b:
      print('First element greater');
    case (int a, int b):
      print('First ($a) element not greater. Greater is $b');
  }
}

// Hata firlatma
void foo15() {
  throw FormatException("Invalid Format.");
  // throw "Custom exception";
}

// Özel bir istisna sınıfı tanımlıyoruz
class OutOfLlamasException implements Exception {
  final String message;

  OutOfLlamasException(this.message);

  @override
  String toString() => message;
}

// Breed more llamas fonksiyonu, OutOfLlamasException fırlatabilir
void breedMoreLlamas() {
  // Llama yetiştirme işlemleri...
  // Eğer tüm llamaslar tükenirse istisna fırlatıyoruz
  throw OutOfLlamasException("We are out of llamas!");
}

void buyMoreLlamas() {
  print("Llama alım işlemleri yapiliyor...");
}

// Hata yakalama
void foo16() {
  try {
    foo15();
  } catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
  }
  try {
    breedMoreLlamas();
  } on OutOfLlamasException catch (e) {
    // Özel bir istisna
    print('We ran out of llamas: $e');
    buyMoreLlamas();
  } on Exception catch (e) {
    // Diğer tüm istisnalar
    print('Unknown exception: $e');
  } catch (e) {
    // Belirtilmemiş tür, tüm istisnaları işler
    print('Something really unknown: $e');
  }
}

void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // Hata
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
    // Hatayı bir nevi tekrar fırlatır.
    rethrow; // Allow callers to see the exception.
  }
}

void foo17() {
  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }
}

void cleanLlamaStalls() {
  print("Stall temizleme işlemleri...");
}

void foo18() {
  try {
    breedMoreLlamas();
  } catch (e) {
    print('Error: $e'); // Hata işleme
  } finally {
    cleanLlamaStalls(); // Temizlik işlemi
  }
}

void main() {
  foo18();
}
