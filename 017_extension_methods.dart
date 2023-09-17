// Kendi eklenti methodlarımızı oluşturmak için aşağıdaki sozdizimi kullanılır.
// extension <extension name>? on <type> {
//   (<member definition>)*
// }

// methodların daha efektif hale getirilebilir.
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

extension on String {
  bool get isBlank => trim().isEmpty;
}

extension MyFancyList<T> on List<T> {
  int get doubleLength => length * 2;
  List<T> operator -() => reversed.toList();
  List<List<T>> split(int at) => [sublist(0, at), sublist(at)];
}

void foo1() {
  print(int.parse('42'));
  var result = '42'.parseInt();
  print(result);
  print(result.runtimeType);
}

void foo2() {
  // String üzerindeki eklenti metodları
  String numberString = "42";
  int parsedNumber = numberString.parseInt();
  print("Parsed number: $parsedNumber");

  String doubleString = "3.14";
  double parsedDouble = doubleString.parseDouble();
  print("Parsed double: $parsedDouble");

  String emptyString = "";
  bool isBlank = emptyString.isBlank;
  print("Is empty string blank? $isBlank");

  // List üzerindeki eklenti metodları
  List<int> numbers = [1, 2, 3];
  int doubleLength = numbers.doubleLength;
  print("Double length of numbers list: $doubleLength");

  List<int> reversedNumbers = -numbers;
  print("Reversed numbers: $reversedNumbers");

  List<List<int>> splitNumbers = numbers.split(2);
  print("Split numbers: $splitNumbers");
}

void main(List<String> args) {
  foo2();
}
