// Bir alt dizede kullanım
String substringExample() {
  return 'Never odd or even'.substring(6, 9); // 'odd'
}

// Bir dizeyi belirli bir desene göre bölmek
List<String> splitExample() {
  return 'progressive web apps'.split(' '); // ['progressive', 'web', 'apps']
}

// Bir dizenin belirli bir konumdaki UTF-16 kod birimini almak
String charAtExample() {
  return 'Never odd or even'[0]; // 'N'
}

// Bir dizeyi karakterlerine bölmek ve karakterleri döngü ile gezinmek
void iterateStringCharacters() {
  for (final char in 'hello'.split('')) {
    print(char);
  }
}

void foo6() {
  // Check whether a string contains another string.
  assert('Never odd or even'.contains('odd'));

  // Does a string start with another string?
  assert('Never odd or even'.startsWith('Never'));

  // Does a string end with another string?
  assert('Never odd or even'.endsWith('even'));

  // Find the location of a string inside a string.
  assert('Never odd or even'.indexOf('odd') == 6);

  print('Substring Example: ${substringExample()}');
  print('Split Example: ${splitExample()}');
  print('CharAt Example: ${charAtExample()}');
  print('Iterate String Characters:');
  iterateStringCharacters();
}

void foo7() {
  String originalString = 'web apps';

  // Diziyi büyük harfe dönüştürme
  String upperCaseString = originalString.toUpperCase();
  print(upperCaseString); // Çıktı: WEB APPS

  // Diziyi küçük harfe dönüştürme
  String lowerCaseString = upperCaseString.toLowerCase();
  print(lowerCaseString); // Çıktı: web apps

  assert(upperCaseString == 'WEB APPS');
  assert(lowerCaseString == 'web apps');
}

void foo8() {
// Trim a string.
  assert('  hello  '.trim() == 'hello');

// Check whether a string is empty.
  assert(''.isEmpty);

// Strings with only white space are not empty.
  assert('  '.isNotEmpty);
}

void foo9() {
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

// greetingTemplate didn't change.
  assert(greeting != greetingTemplate);
}

void foo10() {
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();

  assert(fullString == 'Use a StringBuffer for efficient string creation.');
}

void foo11() {
// Here's a regular expression for one or more digits.
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

// contains() can use a regular expression.
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

// Replace every match with another string.
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
}

void foo12() {
  var numbers = RegExp(r'\d+');
  var someDigits = 'll23amas live 15 to 20 years';

// Check whether the reg exp has a match in a string.
  assert(numbers.hasMatch(someDigits));

// Loop through all matches.
  for (final match in numbers.allMatches(someDigits)) {
    print(match.group(0)); // 15, then 20
  }
}
