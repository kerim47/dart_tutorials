// Author      : Abdulkerim Akan
// Email       : kerimakan77@gmail.com
// File Name   : 002_variables.dart
// Created on  : 2023-09-11
// Description : This file contains variables information.

// ignore_for_file: unused_local_variable

import 'dart:core';

void main(List<String> args) {
  // var tip çıkarımı (type inference) dart tarafından
  // değişkenin turu çalışma zamanında belirlenir.

  //NOTE: Turunu bildiğiniz durumlarda değişknin tipini kullanarak tanımlayın.
  // Bu performans açısından  daha sağlıklıdır.

  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  // const derleme zamanında belirlenir. Daha sonrasında değiştirilemez.
  const int sabitSayi = 10;
  const sabitMetin = "Bu bir sabit metindir";
  const List<int> sayilar = [1, 2, 3]; // Sabit koleksiyon

  // sabitSayi = 10 // Error: Can't assign to the const variable 'sabitSayi'

  // sabitSayi = 10;
  print(sabitSayi);

  // final çalışma zamanında belirlenir. Daha sonrasında değiştirilemez.
  final int get_value = GetValue();
  // getValue = 20; // Error: Can't assign to the final variable 'getValue'.
  print(get_value);

  // Daha fazla ayrıntı için bakınız. https://stackoverflow.com/questions/50431055/what-is-the-difference-between-the-const-and-final-keywords-in-dart

  // Object  tum veri turleri object nesnesinden turer. Yani veri turlerinin temelidir.
  // Herhangi veri tipi object nesnesine atanabilir, tur bilgisi kaybolabilir bundan dolayı tip guvenliği yoktur.
  Object myObject = 'Merhaba';
  myObject = 20; // no error
  print(myObject);

  // dynamic (Dinamik): tür belirleme (type inference) olmadan veya türünü bilmeden değişkenler oluşturmanıza izin veren bir türdür.
  // `dynamic` değişkenleri, herhangi bir türden bir değeri saklamak için kullanabilirsiniz ve tür bilgisini kaybetmezler. Bu nedenle çalışma zamanında tür çıkarımı yapılır.
  dynamic myDynamic = 42;
  myDynamic = "deneme";
  print(myDynamic);

  // ikisi arasında bir fark gorulmemiş gibi gozukmese aslında bazı farklılıkları var. Orneğin :
  String cast_to_dyn = myDynamic; // tur denetimi yok atama yapılabilir.
  print("$cast_to_dyn");

  int cast_to_obj = myObject
      as int; // Direkt olarak atama yapılamaz cast işlemine ihtiyac duyar.
  print("$cast_to_obj");

  // İkinci onemli husus ise şudur: Object tipi dynamic tipe gore daha az esneklik sağlar.
  // "dynamic" türü her türü kabul edebilir ve her methodu veya özelliği çağırabilirsiniz,
  // ancak tür güvenliği eksik olabilir ve hatalar çalışma zamanında ortaya çıkabilir.
  // "Object" türü ise daha sınırlıdır ve yalnızca Object türünün methodlarına ve özelliklerine erişebilirsiniz,
  // bu nedenle daha fazla tür güvenliği sağlar, ancak daha az esneklik sunar.
  // ornek olarak:

  dynamic dyn2;
  dyn2 = 42;
  dyn2 = "Merhaba";
  dyn2 = [1, 2, 3];

  print(dyn2.length); // Çalışma zamanında hata yok

  Object obj3;
  obj3 = 42;
  obj3 = "Merhaba";
  obj3 = [1, 2, 3];
  print(obj3);

  // print(obj3.length); // Çalışma zamanında hata alırsınız, çünkü "length" Object türünde tanımlı değil

  // Daha fazla ayrıntı için bakınız. https://stackoverflow.com/questions/31257735/what-is-the-difference-between-dynamic-and-object-in-dart

  Type dyn_type = myDynamic.runtimeType;
  print("Type of name is $dyn_type");

  // Get Type variable
  Type var_type = name.runtimeType;
  print("Type of name is $var_type");
  // output :  Type of name is String

  // Nested variables examples dict, list in dict
  Type var_type2 = image['tags'].runtimeType;
  print("Type of name is $var_type2");
  // output : Type of name is List<String>

  // String? name  // Nullable type. Can be `null` or string.
  //
  // String name   // Non-nullable type. Cannot be `null` but can be string.

  String? firstName; // bir deger atanmazsa otomatik olarak null deger atanır.
  print(firstName);

  // String lastName; // bir deger atanmazsa otomatik olarak hata verir.
  // print(lastName); // Error: Non-nullable variable 'lastName' must be assigned before it can be used.

  int? lineCount;
  print(lineCount); // output : null

  // late
  // Bazı durumlarda değişkenin tipini bilmediğimiz ve null olmadığını bildiğimiz durumlarda kullanırız.
  var descr = Example();
  print("${descr.desc}"); // Hata uretir. cunku null olamaz değer atanmali.
}

int GetValue() {
  return 42;
}

class Example {
  late final desc;

  Example() {
    desc = "This is a sample description";
  }
}
