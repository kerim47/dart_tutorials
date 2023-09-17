void foo1() {
  (int, int) record = (1, 2);
  switch (record) {
    // case (var a, var b) && (var b, var c): print("records"); // hata verir aynı değişken ismi birden fazla tanimlandi.
    // ignore: unused_local_variable
    case (var a, var b) && (var c, var d):
      print("records");
  }
}

enum Color { red, yellow, blue, green }

void foo2() {
  Color color = Color.green;
  bool isPrimary;

  switch (color) {
    case Color.red || Color.yellow || Color.blue:
    // ignore: unreachable_switch_case
    case Color.yellow:
    // ignore: unreachable_switch_case
    case Color.blue:
      isPrimary = true;
      break;
    default:
      isPrimary = false;
  }

  print(
      isPrimary); // Eğer renk kırmızı, sarı veya mavi ise true; aksi takdirde false.
}

String asciiCharType(int char) {
  const space = 32;
  const zero = 48;
  const nine = 57;
  const uppercaseA = 65;
  const uppercaseZ = 90;
  const lowercaseA = 97;
  const lowercaseZ = 122;

  return switch (char) {
    < space => 'control',
    == space => 'space',
    > space && < zero => 'punctuation',
    >= zero && <= nine => 'digit',
    >= uppercaseA && <= uppercaseZ => 'uppercase letter',
    >= lowercaseA && <= lowercaseZ => 'lowercase letter',
    _ => 'unknown'
  };
}

void foo3() {
  print(asciiCharType(32)); // Çıktı: space
  print(asciiCharType(65)); // Çıktı: uppercase letter
  print(asciiCharType(97)); // Çıktı: lowercase letter
  print(asciiCharType(33)); // Çıktı: punctuation
  print(asciiCharType(64)); // Çıktı: unknown
}

void foo4() {
  String? maybeString = 'nullable with base type String';
  switch (maybeString) {
    // ignore: unused_local_variable
    case var a:
      print("print()");
    // 's' has type non-nullable String here.
  }
}

void foo5() {
  List<String?> row = ['user', null];
  switch (row) {
    // ignore: unused_local_variable
    case ['user', var name]:
      print("null assert example");
    // case ['user', var name!]: print("null assert example"); // null assert hatasi verir. name not a null olarak tanimlandi
  }

  (int?, int?) position = (2, 3);

  var (x!, y!) = position;
  print("$x");
  print("$y");
}

void foo6() {
  (int?, int?) record = (1, 2);
  switch (record) {
    // 'var a' and 'var b' are variable patterns that bind to 1 and 2, respectively.
    case (var a, var b):
      print("(var a, var b) : ($a, $b)");
      break;
    // 'a' and 'b' are in scope in the case body.
  }
}

void foo7() {
  // Dinlenme elemanı olarak çevrilebilir.
  //Ornek oluşturduğumuz zamanlarda kullanmak faydalı olur.
  // var [a, b, ..., c, d] = [1, 2, 3, 4, 5, 6, 7];
  var [a, b, ...rest, c, d] = [1, 2, 3, 4, 5, 6, 7];
  print('$a $b $c $d');
  // Prints "1 2 6 7".
  print('$a $b $rest $c $d');
  // Prints "1 2 [3, 4, 5] 6 7".
}

void foo8() {
  // Kayıtlar kullanılarak kendi tiplerini tanımlanabilir.
  var (myString: foo, myNumber: bar) = (myString: 'string', myNumber: 1);
  print("$foo");
  print("$bar");
}

class MyRecord {
  final int untyped;
  final String typed;

  MyRecord(this.untyped, this.typed);
}

void foo10() {
  // Record pattern with variable subpatterns:
  // record1 = {'a': 'Abdulkerim', 'b': 100}; // Değişiklik: record bir harita (map) olarak tanımlanır.

  // var (untypedVar: untyped, typedVar: int typed) = record1; // Değişiklik: Değişken isimleri değiştirildi.
  // var (:untypedVar, :int typed) = record1; // Değişiklik: Değişken ismi değiştirildi.

  // switch (record1) {
  //   case ({'a': var untyped, 'b': int typed}): // Değişiklik: Desenler harita (map) yapısına uygun hale getirildi.
  //     print('untyped: $untyped, typed: $typed');
  //     break;
  //   case ({'a': :var untyped, 'b': :int typed}): // Değişiklik: Desenler harita (map) yapısına uygun hale getirildi.
  //     print('untyped: $untyped, typed: $typed');
  //     break;
  // }

  // Record pattern with null-check and null-assert subpatterns:
  // var record2 = {'a': 'Abdulkerim', 'b': 100}; // Değişiklik: record bir harita (map) olarak tanımlanır.
  // switch (record2) {
  //   case ({'a': var checked, 'b': var asserted}): // Değişiklik: Değişken isimleri değiştirildi.
  //     print('checked: $checked, asserted: $asserted');
  //     break;
  //   case ({'a': :var checked, 'b': :var asserted}): // Değişiklik: Değişken isimleri değiştirildi.
  //     print('checked: $checked, asserted: $asserted');
  //     break;
  // }
  //
  // // Record pattern with cast subpattern:
  // var record3 = {'a': 'Abdulkerim', 'b': 100}; // Değişiklik: record bir harita (map) olarak tanımlanır.
  // var (untypedAsInt: untyped as int, typedAsString: typed as String) = record3; // Değişiklik: Değişken isimleri değiştirildi.
  // var (:untypedAsInt as int, :typedAsString as String) = record3; // Değişiklik: Değişken isimleri değiştirildi.
}

void foo11() {
  // joker karakterler kullanılarak istenilen değerler alinabilir.
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var [..., _, a] = list;
  var [_, b, ...] = list;
  var [c, ..., _] = list;
  print("$a");
  print("$b");
  print("$c");
}

void main() {
  foo11();
}
