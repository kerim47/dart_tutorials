void foo1() {
  var tea = 10;
  print('I drink $tea.');
}

// Numbers
void foo2() {
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
}

// Parser num
void foo3() {
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);
}

void foo4() {
  var result = int.parse('42', radix: 16); // 2 8 10 16
  print("$result");
  assert(result == 66);
}

void foo5() {
  // Convert an int to a string.
  assert(42.toString() == '42');

  // Convert a double to a string.
  assert(123.456.toString() == '123.456');

  // Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46');

  // Specify the number of significant figures.
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);
}
