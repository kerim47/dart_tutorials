class Television {
  bool _isOn = false; // Televizyonun açık/kapalı durumu

  /// Use [turnOn] to turn the power on instead.
  @Deprecated('Use turnOn instead')
  void activate() {
    turnOn();
  }

  /// Turns the TV's power on.
  void turnOn() {
    _isOn = true;
    print('Television is turned on.');
  }

  /// Turns the TV's power off.
  void turnOff() {
    _isOn = false;
    print('Television is turned off.');
  }

  /// Checks if the TV is currently on.
  bool isOn() {
    return _isOn;
  }
}

void main() {
  Television tv = Television();

  // Televizyonu açıyoruz.
  tv.activate();
  tv.turnOn();

  // Televizyonun açık olduğunu kontrol ediyoruz.
  if (tv.isOn()) {
    print('Television is currently on.');
  } else {
    print('Television is currently off.');
  }

  // Televizyonu kapatıyoruz.
  tv.turnOff();

  // Televizyonun açık olduğunu tekrar kontrol ediyoruz.
  if (tv.isOn()) {
    print('Television is currently on.');
  } else {
    print('Television is currently off.');
  }
}

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}

@Todo('Dash', 'Implement this function')
void doSomething() {
  print('Do something');
}

// create new function

void doSomethingElse() {
  print('Do something else');
}
