//  Açıklama                | Operatör                                                  | İşlem Sırası
//  ------------------------|-----------------------------------------------------------|-------------
//  Tekli son ek            | expr++    expr--    ()    []    ?[]    .    ?.    !       | Yok
//  Tekli önek              | -expr    !expr    ~expr    ++expr    --expr    await expr | Yok
//  Çarpma                  | *    /    %  ~/                                           | Sol
//  Toplama                 | +    -                                                    | Sol
//  Kaydırma                | <<    >>    >>>                                           | Sol
//  Bit seviyesi VE         | &                                                         | Sol
//  Bit seviyesi XOR        | ^                                                         | Sol
//  Bit seviyesi VEYA       | \|                                                        | Sol
//  İlişkisel ve tip sınavı | >=    >    <=    <    as    is    is!                     | Yok
//  Eşitlik                 | ==    !=                                                  | Yok
//  Mantıksal VE            | &&                                                        | Sol
//  Mantıksal VEYA          | \|\|                                                      | Sol
//  Null ise                | ??                                                        | Sol
//  Koşullu                 | expr1 ? expr2 : expr3                                     | Sağ
//  Zincirleme              | ..    ?..                                                 | Sol
//  Atama                   | =    *=    /=   +=   -=   &=   ^=   vb.                   | Sağ
  
void main(List<String> args) {
  ArithmeticOperators(); 
  IncrementDecrementOperators();
  OperatorPrecedence();
  TypeTestOperators();
  LogicalOperators();
  BitwiseShiftOperators();
  ConditionalExpressions();
}



void ArithmeticOperators() {
  // assert((2 + 3 != 5), "eşit değildir");
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an int
  assert(5 % 2 == 1); // Remainder
  assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');
}


void IncrementDecrementOperators() {
  int a;
  int b;

  a = 0;
  b = ++a; // Increment a before b gets its value.
  assert(a == b); // 1 == 1

  a = 0;
  b = a++; // Increment a after b gets its value.
  assert(a != b); // 1 != 0

  a = 0;
  b = --a; // Decrement a before b gets its value.
  assert(a == b); // -1 == -1

  a = 0;
  b = a--; // Decrement a after b gets its value.
  assert(a != b); // -1 != 0
}

void OperatorPrecedence() {
  int n = 10;
  int d = 5;
  int i = 2;

  // Parantezlerle ve uygun tiplerle kullanımı:
  if ((n % i == 0) && (d % i == 0)) {
    print("İkisi de bölebilir.");
  } else {
    print("Bölme işlemi gerçekleşmez.");
  }

  // Parantez olmadan ve uygun tiplerle kullanımı:
  if (n % i == 0 && d % i == 0) {
    print("İkisi de bölebilir.");
  } else {
    print("Bölme işlemi gerçekleşmez.");
  }
}

void EqualityAndRelationalOperators() {
  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);
}


// "as" operatörü: Belirli bir türe dönüştürme yapar veya library önekini belirtir.
String asOperatorExample(Object obj) {
  if (obj is String) {
    // Eğer obj bir String ise, onu String türüne dönüştür ve geri döndür.
    String str = obj as String;
    return "Dönüştürülen String: $str";
  } else {
    return "Bu bir String değil.";
  }
}

// "is" operatörü: Bir nesnenin belirli bir tipe sahip olup olmadığını kontrol eder.
String isOperatorExample(Object obj) {
  if (obj is String) {
    return "Bu bir String.";
  } else {
    return "Bu bir String değil.";
  }
}

// "is!" operatörü: Bir nesnenin belirli bir tipe sahip olmadığını kontrol eder.
String isNotOperatorExample(Object obj) {
  if (obj is! String) {
    return "Bu bir String değil.";
  } else {
    return "Bu bir String.";
  }
}

void TypeTestOperators() {
  Object obj1 = "Merhaba"; // Bir String
  Object obj2 = 42; // Bir tamsayı

  print(asOperatorExample(obj1)); // "Dönüştürülen String: Merhaba"
  print(asOperatorExample(obj2)); // "Bu bir String değil."

  print(isOperatorExample(obj1)); // "Bu bir String."
  print(isOperatorExample(obj2)); // "Bu bir String değil."

  print(isNotOperatorExample(obj1)); // "Bu bir String değil."
  print(isNotOperatorExample(obj2)); // "Bu bir String."
}


void LogicalOperators() {
  bool done = false;
  int col = 3;
  if (!done && (col == 0 || col == 3)) {
    print("İşlem yapılacak!"); // İşlem yapılacak durumda
  } else {
    print("İşlem yapılmayacak!"); // İşlem yapılmayacak durumda
  }
}

void BitwiseShiftOperators() {

  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask) == 0x02); // AND
  assert((value & ~bitmask) == 0x20); // AND NOT
  assert((value | bitmask) == 0x2f); // OR
  assert((value ^ bitmask) == 0x2d); // XOR

  assert((value << 4) == 0x220); // Shift left
  assert((value >> 4) == 0x02); // Shift right

  // Shift right example that results in different behavior on web
  // because the operand value changes when masked to 32 bits:
  assert((-value >> 4) == -0x03);

  assert((value >>> 4) == 0x02); // Unsigned shift right
  assert((-value >>> 4) > 0); // Unsigned shift right
}

void ConditionalExpressions() {
  bool? isPublic; // true, false veya null olarak ayarlayabilirsiniz.

  // Gelen bool ifadesi null ise, varsayılan olarak 'private' döndür.
  dynamic visibility = isPublic ?? false;

  // 'visibility' değişkeni doğru (true) ise 'public', yanlış (false) ise 'private'.
  visibility = visibility ? 'public' : 'private';
  print('Görünürlük: $visibility');

  String? name;
  print("${playerName(name)}");

}

String playerName(String? name) => name ?? 'Guest';
