import 'dart:convert';
import 'dart:io'; // dart:convert paketini içe aktarıyoruz.
import 'dart:isolate';

const String filename = './.vscode/deneme.json';

String _readFileSync() {
  final file = File(filename);
  final contents = file.readAsStringSync();
  return contents.trim();
}

// SYNC
void foo1() {
  // Read some data.
  final fileData = _readFileSync();
  final jsonData = jsonDecode(
      fileData); // jsonDecode işlevini kullanarak JSON verisini çözüyoruz.

  // Use that data.
  print('Number of JSON keys: ${jsonData.length}');
  print('Number of JSON keys: ${jsonData.keys}');
  print('Number of JSON keys: ${jsonData.values}');
  print("${jsonData["Print to console"]}");
}

// ASYNC
void foo2() async {
  // Read some data.
  final fileData = await _readFileAsync();
  final jsonData = jsonDecode(fileData);

  // Use that data.
  print('Number of JSON keys: ${jsonData.length}');
}

Future<String> _readFileAsync() async {
  final file = File(filename);
  final contents = await file.readAsString();
  return contents.trim();
}

// Aynı anda birden fazla işlemi gerçekleştirmek için Isolate kullanılır.
// Thread mantığına benzer. Ama threadlerden farklı olarak bellek alanı paylaşımı yoktur.
// Sanal makine üzerinde çalışır.
// Library : import 'dart:isolate';

Future<Map<String, dynamic>> _readAndParseJson() async {
  final fileData = await File(filename).readAsString();
  final jsonData = jsonDecode(fileData) as Map<String, dynamic>;
  return jsonData;
}

void foo3() async {
  // Read some data.
  final jsonData = await Isolate.run(_readAndParseJson);

  // Use that data.
  print('Number of JSON key: ${jsonData.length}');
}

void main() => foo3();
