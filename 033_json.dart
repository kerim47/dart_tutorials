import 'dart:convert';
import 'dart:io';

var jsonString = '''
  [
    {"score": 40},
    {"score": 80}
  ]
''';
// Json Decode
void foo1() {
  var scores = jsonDecode(jsonString);
  print("${scores.runtimeType}"); // List<dynamic>
  assert(scores is List);

  if (scores case [List a]) {
    print("result is : $a");
  }
  var firstScore = scores[0];
  assert(firstScore is Map);
  assert(firstScore['score'] == 40);
}

// Json Encode
void foo2() {
  var scores = [
    {'score': 40},
    {'score': 80},
    {'score': 100, 'overtime': true, 'special_guest': null}
  ];

  var jsonText = jsonEncode(scores);
  assert(jsonText ==
      '[{"score":40},{"score":80},'
          '{"score":100,"overtime":true,'
          '"special_guest":null}]');
}

// UTF-8 Encode And Decode
void foo3() {
  List<int> utf8Bytes = [
    0xc3,
    0x8e,
    0xc3,
    0xb1,
    0xc5,
    0xa3,
    0xc3,
    0xa9,
    0x72,
    0xc3,
    0xb1,
    0xc3,
    0xa5,
    0xc5,
    0xa3,
    0xc3,
    0xae,
    0xc3,
    0xb6,
    0xc3,
    0xb1,
    0xc3,
    0xa5,
    0xc4,
    0xbc,
    0xc3,
    0xae,
    0xc5,
    0xbe,
    0xc3,
    0xa5,
    0xc5,
    0xa3,
    0xc3,
    0xae,
    0xe1,
    0xbb,
    0x9d,
    0xc3,
    0xb1
  ];

  var funnyWord = utf8.decode(utf8Bytes);

  assert(funnyWord == 'Îñţérñåţîöñåļîžåţîờñ');
}

void foo4() {
  List<int> lst = [
    0xc3,
    0x8e,
  ];
  String decodedText = utf8.decode(lst);

  print(decodedText); // Çıktı: ı
}

void foo5() async {
  // Bu kısmı inputStream adlı bir giriş akışı ile doldurmalısınız.
  // Örneğin, bir dosyadan okuma yapmak için File sınıfını kullanabilirsiniz:
  final file = File('module_ex.dart');
  final inputStream = file.openRead();

  var lines = utf8.decoder.bind(inputStream).transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
    }
    print('Dosya artık kapandı');
  } catch (e) {
    print(e);
  }
}

void foo6() {
  String name = "Abdulkerim Akan";
  List<int> encodedName = utf8.encode(name);

  print(encodedName);
}

void foo7() {
  List<int> utf8Bytes = [
    0xc3,
    0x8e,
    0xc3,
    0xb1,
    0xc5,
    0xa3,
    0xc3,
    0xa9,
    0x72,
    0xc3,
    0xb1,
    0xc3,
    0xa5,
    0xc5,
    0xa3,
    0xc3,
    0xae,
    0xc3,
    0xb6,
    0xc3,
    0xb1,
    0xc3,
    0xa5,
    0xc4,
    0xbc,
    0xc3,
    0xae,
    0xc5,
    0xbe,
    0xc3,
    0xa5,
    0xc5,
    0xa3,
    0xc3,
    0xae,
    0xe1,
    0xbb,
    0x9d,
    0xc3,
    0xb1
  ];
  List<int> encoded = utf8.encode('Îñţérñåţîöñåļîžåţîờñ');

  assert(encoded.length == utf8Bytes.length);
  for (int i = 0; i < encoded.length; i++) {
    assert(encoded[i] == utf8Bytes[i]);
  }
}

void main() => foo7();
