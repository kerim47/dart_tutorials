// ignore_for_file: unused_local_variable

void foo25() {
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);
}

void foo26() {
  var teas = ['green', 'black', 'chamomile', 'earl grey'];

  teas.forEach((tea) => print('I drink $tea'));
}

void foo27() {
  Map<String, List<String>> hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Maui': ['Kaanapali', 'Wailea'],
    'Kauai': ['Poipu', 'Hanalei'],
    'Big Island': ['Kona', 'Hapuna'],
  };

  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
  });
}

void foo28() {
  var teas = ['green', 'black', 'chamomile', 'earl grey'];

  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  var loudTeas2 = teas.map((tea) => tea.toUpperCase()).toList();
}

void foo29() {
  var teas = ['green', 'black', 'chamomile', 'earl grey'];

// Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

// Use where() to find only the items that return true
// from the provided function.
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
// or teas.where(isDecaffeinated)

// Use any() to check whether at least one item in the
// collection satisfies a condition.
  assert(teas.any(isDecaffeinated));

// Use every() to check whether all the items in a
// collection satisfy a condition.
  assert(!teas.every(isDecaffeinated));
}
