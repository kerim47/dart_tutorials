void foo13() {
// Create an empty list of strings.
  var grains = <String>[];
  assert(grains.isEmpty);

// Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

// Add to a list.
  fruits.add('kiwis');

// Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

// Get the list length.
  assert(fruits.length == 5);

// Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

// Remove all elements from a list.
  fruits.clear();
  assert(fruits.isEmpty);

// You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));
  // Bir dizedeki tüm UTF-16 kod birimlerini almak
  List<int> getCodeUnitsExample() {
    return 'Never odd or even'
        .codeUnits
        .toList(); // [78, 101, 118, 101, 114, 32, 111, 100, 100, 32, 111, 114, 32, 101, 118, 101, 110]
  }

  print('Get Code Units Example: ${getCodeUnitsExample()}');
}

void foo14() {
  var fruits = ['apples', 'oranges'];
// Access a list item by index.
  assert(fruits[0] == 'apples');

// Find an item in a list.
  assert(fruits.indexOf('apples') == 0);
}

void foo15() {
  var fruits = ['apples', 'oranges'];
  // Sort a list.
  fruits.sort((a, b) => a.compareTo(b));

  assert(fruits[0] == 'apples');
}

void foo16() {
// This list should contain only strings.
  var fruits = <String>[];

  fruits.add('apples');
  var fruit = fruits[0];
  // ignore: unnecessary_type_check
  assert(fruit is String);
}
