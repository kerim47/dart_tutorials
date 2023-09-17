Future<void> main() async {
  print("Program başladı.");
  print("${await foo3()}");
  print("Program tamamlandı.");
}

Future<void> checkVersion() async {
  String? version;

  try {
    version = await lookUpVersion();
  } catch (e) {
    // React to inability to look up the version
    print("${e}");
  }

  print("Sürüm kontrol edildi: ${version ?? 'N/A'}");
}

// Future<int> lookUpVersion() async {
//   await Future.delayed(
//       Duration(seconds: 2)); // Simüle edilen bir bekleme süresi
//   throw Exception("Abdulkerim ");
//   // return 1;
// }

Future<String> lookUpVersion2() async => '1.0.0';

// Create a asynchronous code hard examples
Future<String> foo3() {
  // Imagine that this function is fetching user info from another service or database
  return Future.delayed(Duration(seconds: 2), () => 'Large Latte');
}

String lookUpVersion() => '1.0.0';
