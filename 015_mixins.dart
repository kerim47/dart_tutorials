/* =============================================================================
#  Author:          Abdulkerim Akan - https://github.com/kerim47/flutter
#  Email:           kerimakan77@gmail.com
#  FileName:        015_mixins.dart
#  Description:     /
#  Version:         0.0.1
#  History:         
============================================================================= */

// Mixin, bir sınıfın uyesiymiş sağlamayı amaçlayan yapıdır. Karıştırıcı işlevi gorur.

class Performer {}

mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

mixin Aggressive {
  void beAggressive() {
    print('Being aggressive');
  }
}

mixin Demented {
  void beDemented() {
    print('Being demented');
  }
}

class Person with Aggressive, Demented {
  String name = '';
  // Person sınıfının diğer özellikleri ve metotları...
}

class Musician extends Performer with Musical {
  // Musician sınıfının özellikleri ve metotları...
}

class Maestro extends Person with Musical {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}

abstract mixin class Musician2 {
  // No 'on' clause, but an abstract method that other types must define if
  // they want to use (mix in or extend) Musician:
  void playInstrument(String instrumentName);

  void playPiano() {
    playInstrument('Piano');
  }

  void playFlute() {
    playInstrument('Flute');
  }
}

class Virtuoso with Musician2 {
  // Use Musician as a mixin
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName beautifully');
  }
}

class Novice extends Musician {
  // Use Musician as a class
  void playInstrument(String instrumentName) {
    print('Plays the $instrumentName poorly');
  }
}

void foo1() {
  var maestro = Maestro("Abdulkerim Akan");
  maestro.entertainMe();
}

void foo2() {}

void main() {
  foo1();
}
