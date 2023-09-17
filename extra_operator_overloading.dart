import 'dart:core';
import 'dart:math';

class Complex {
  final double real;
  final double imaginary;

  Complex conjugate() {
    return Complex(real: this.real, imaginary: -this.imaginary);
  }

  Complex({this.real = 0, this.imaginary = 0});

  Complex.ri(this.real, this.imaginary);

  Complex operator +(Complex b) {
    return Complex(
        real: this.real + b.real, imaginary: this.imaginary + b.imaginary);
  }

  Complex operator -(Complex b) {
    return Complex(
        real: this.real - b.real, imaginary: this.imaginary - b.imaginary);
  }

  Complex operator *(Complex b) {
    return Complex(
        real: this.real * b.real - this.imaginary * b.imaginary,
        imaginary: this.real * b.imaginary + this.imaginary * b.real);
  }

  Complex operator /(Complex b) {
    // https://stackoverflow.com/a/41146661/6846888
    var conjugation = b.conjugate();
    var denominatorRes = b * conjugation;

    // denominator has only real part
    var denominator = denominatorRes.real;
    var nominator = this * conjugation;

    return Complex(
        real: nominator.real / denominator,
        imaginary: nominator.imaginary / denominator);
  }

  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Complex &&
        other.real == real &&
        other.imaginary == imaginary;
  }

  @override
  int get hashCode => real.hashCode ^ imaginary.hashCode;

  double get magnitude => sqrt(real * real + imaginary * imaginary);

  // Complex get conjugate => Complex(real: real, imaginary: -imaginary);

  Complex scale(double factor) =>
      Complex(real: real * factor, imaginary: imaginary * factor);

  @override
  String toString() {
    return 'Complex(real: ${real}, imaginary: ${imaginary})';
  }
}

void main(List<String> args) {
  final complex1 = Complex.ri(3, 4); // 3 + 4i
  final complex2 = Complex.ri(1, 2); // 1 + 2i

  final sum = complex1 + complex2;
  final difference = complex1 - complex2;
  final product = complex1 * complex2;
  final quotient = complex1 / complex2;

  print('Sum       : $sum');
  print('Difference: $difference');
  print('Product   : $product');
  print('Quotient  : $quotient');
}
