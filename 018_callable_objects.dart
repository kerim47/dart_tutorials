// Nesneleri bir function gibi çağırmak ve kullanmak için call kullanılır.

class WannabeFunction {
  String call(String a, String b, String c) => '$a $b $c!';
}

void foo1() {
  var wf = WannabeFunction();
  var out = wf('Hi', 'there,', 'gang');
  print(out);
}

// Birden fazla çağrılabilir fonksiyon yok sadece bir defa çaağrılabilir ama çeşitli manipulasyonlar uygulanabilir.
class Adder {
  int add(int a, int b) {
    return a + b;
  }

  // Define the call method
  int call(int a, int b) {
    return add(a, b);
  }
}

void main() => foo1();
