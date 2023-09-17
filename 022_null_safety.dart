// Null safety olmadan

bool isEmpty(String string) => string.length == 0;

// isEmpty(null);

// Using null safety:
void makeCoffee(String coffee, [String? dairy]) {
  if (dairy != null) {
    print('$coffee with $dairy');
  } else {
    print('Black $coffee');
  }
}

// Geçersiz turlerin kullanımı
// Hypothetical unsound null safety:
bad(String? maybeString) {
  // print(maybeString.length); // HATA
}

void foo1() {
  makeCoffee("coffee", "milk");
}

void foo2() {
  bad(null);
}

// Hypothetical unsound null safety:
requireStringNotNull(String definitelyString) {
  print(definitelyString.length);
}

void foo3() {
  // ignore: unused_local_variable
  String? maybeString = null; // Or not!
  // requireStringNotNull(maybeString); //! HATA : NULLABLE
}

// bool isEmptyList([Object? object]) {
//   return (object is List) ? object.isEmpty : false;
// }

bool isEmptyList(Object object) {
  if (object is! List) return false;
  return object.isEmpty;
}

void foo4() {
  print(isEmptyList([]));
  print(isEmptyList(42));
}

void foo5() {
  String? notAString = null;
  print(notAString?.length);
}

/// null safety olmadan kullanımı
///
/// void foo6() {
///  String? notAString = null;
///  print(notAString.length);
/// }
///
void foo6() {
  String? notAString = null;
  print(notAString!.length);
}

void main() => foo5();
