var _nobleGases = {
  2: 'Helium',
  10: 'Neon',
  18: 'Argon',
  36: 'Krypton',
  54: 'Xenon',
  86: 'Radon',
};

bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

// Daha kısa bir şekilde ifade edilebilir.

bool isNoble_(int atomicNumber) => _nobleGases[atomicNumber] != null;

void foo1() {
  var atomicNumber = 10; // Neon'un atom numarası
  if (isNoble(atomicNumber)) {
    print('Element soy gazdır.');
  } else {
    print('Element soy gaz değildir.');
  }
}

// Adlandırılmış parametreler :  Genellikle bu kullanım tavsiye edilir.
// Çünkü bazı durumlarda fonksiyonların hangi sırayla parametre ne aldığı tam olarak bilinmebilir.
// Adlandırılmış fonksiyonlar ile daha net ve açıklayıcı olur.

void enableFlags({bool? bold, bool? hidden}) {
  // 'bold' parametresi true olarak ayarlandıysa, kalın yazdır.
  if (bold == true) {
    print('Metin kalın.');
  }

  // 'hidden' parametresi true olarak ayarlandıysa, gizli olarak işaretle.
  if (hidden == true) {
    print('Metin gizli.');
  }
}

void foo2() {
  enableFlags(bold: true, hidden: false);
  enableFlags(hidden: true); // bold : null
  enableFlags(); // Paremetre yok varsayılan değer null bold: null, hidden:null
  // Scrollbar sınıfının örneğini oluştururken 'content' parametresini vermek zorunludur.
  final myScrollbar = Scrollbar(content: 'Scrollable Content');

  print(myScrollbar.content); // Çıktı: Scrollable Content
}

class Scrollbar {
  final String content;

  Scrollbar({required this.content});
}

void foo3() {
  repeat(
      times: 20,
      action: () {
        print('Hello, world!');
      });
}

void repeat({required int times, required void Function() action}) {
  for (var i = 0; i < times; i++) {
    action();
  }
}

// istege bağlı parametreler [] arasında tanımlanır nullabla
String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

void foo4() {
  assert(say('Bob', 'Howdy') == 'Bob says Howdy');
  assert(say('Bob', 'Howdy', 'smoke signal') ==
      'Bob says Howdy with a smoke signal');
}

// istege bağlı parametrelerde varsayılan değer atanabilir.
// Fonksiyon tanımlanırken kullanılabilir veya fonksiyon içinde varName = varName ?? "varsayılanDeger"; kullanılabilir
String say2(String from, String msg, [String device = 'carrier pigeon']) {
  var result = '$from says $msg with a $device';
  return result;
}

void foo5() {
  assert(say2('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');
}

void argument(List<String> arguments) {
  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');
}

void printElement(int element) {
  print(element);
}

// butun elemanları gezerek işlevlere geçirilebilir.
void foo6() {
  var list = [1, 2, 3];
  // Pass printElement as a parameter.
  list.forEach(printElement);
}

void foo7() {
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == '!!! HELLO !!!');
}

// Anonim işlev
//  ([[Type] param1[, …]]) {
//   codeBlock;
// };

void foo8() {
  const list = ['apples', 'bananas', 'oranges'];
  list
    ..map((item) => item.toUpperCase())
    ..forEach((item) => print('$item: ${item.length}'));
  // list.map((item) {
  //   return item.toUpperCase();
  // }).forEach((item) {
  //   print('$item: ${item.length}');
  // });

  // ..map((item) => item.toUpperCase());
  // ..forEach((item) => print('$item: ${item.length}'));
}

// Jeneratorler tembel bir şekilde bir değerler dizisi üretilmesi gerektiğinde kullanılır.
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}

Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}

Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}

void foo9() {
  final numbers = naturalsTo(5); // 0'dan 4'e kadar olan sayılar
  for (final number in numbers) {
    print(number);
  }
}

void foo10() async {
  await for (final number in asynchronousNaturalsTo(5)) {
    print(number);
  }
}

void foo11() {
  final numbers = naturalsDownFrom(5); // 5'ten 1'e kadar olan sayılar
  for (final number in numbers) {
    print(number);
  }
}

void main(List<String> args) {
  // argument(args);
  foo11();
}
