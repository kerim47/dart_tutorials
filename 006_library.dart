// Author      : Abdulkerim Akan
// Email       : kerimakan77@gmail.com
// File Name   : 006_library.dart
// Created on  : 2023-09-11
// Description : This file contains library, import modules information.

// Normal kullanım
import 'module_ex.dart';

// Alias olarak kullanım
import 'module_ex.dart' as mod_ex;

// Aynı fonksiyona sahip moduller varsa alias kullanılarak hata giderilebilir.
// ignore: unused_import
import 'lib/example1.dart';
import 'lib/example2.dart' as ex2;

// Kitaplığın yalnızca bir bölümünü içe aktarma
// ignore: unused_import
import 'lib/example1.dart'
    hide sayCall; // sayCAll dışındaki herşeyi import eder.
// ignore: unused_import
import 'lib/example2.dart' show sayCall; // sayCAll sadece import eder.

// Tembel olarak kutuphane yukleme
// import 'package:greetings/hello.dart' deferred as hello;

void foo1() {
  sayHello();
}

void foo2() {
  mod_ex.sayHello();
}

void foo3() {
  // sayCall();
}

void foo4() {
  ex2.sayCall();
}

void main(List<String> args) {
  foo1();
  foo2();
  foo3();
  foo4();
}
