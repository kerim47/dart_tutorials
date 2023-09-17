/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'package:ex_package/ex_package.dart';

export 'src/ex_package_base.dart';

// TODO: Export any lib:raries intended for clients

void main(List<String> args) {
  final awesome = Awesome();
  print("object ${awesome.isAwesome}");
}
