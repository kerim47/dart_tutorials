// ignore_for_file: unused_local_variable

import 'dart:collection'; // IterableBase library
import 'dart:async';

class Process {
  // Represents a process...
}

class ProcessIterator implements Iterator<Process> {
  final List<Process> _processes;
  int _currentIndex = 0;

  ProcessIterator(this._processes);

  @override
  Process get current => _processes[_currentIndex];

  @override
  bool moveNext() {
    _currentIndex++;
    return _currentIndex < _processes.length;
  }
}

// A mythical class that lets you iterate through all
// processes. Extends a subclass of [Iterable].
class Processes extends IterableBase<Process> {
  final List<Process> _processList;

  Processes(this._processList);

  @override
  Iterator<Process> get iterator => ProcessIterator(_processList);
}

// Yineleme
void foo1() {
  // Create a list of processes
  final List<Process> processList = [
    Process(), // Add your processes here
    Process(),
    // Add more processes as needed
  ];

  // Create a Processes object with the list of processes
  final processes = Processes(processList);

  // Iterable objects can be used with for-in.
  for (final process in processes) {
    // Do something with the process.
    print("${process.toString()}");
  }
}

// My own "Exception" create

class FooException implements Exception {
  final String? msg;

  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}

class MyException implements Exception {
  final String? msg;
  MyException([this.msg]);
  @override
  String toString() => msg ?? 'MyException';
}

void foo2() {
  if (true) {
    // throw FooException('This is a FooException');
    throw MyException('This is a MyException');
  }
}

Future<void> delete() async {
  // Simulate a successful delete operation.
}

Future<void> copy() async {
  // Simulate a successful copy operation.
}

Future<void> errorResult() async {
  // Simulate an error result.
  throw Exception('Error occurred during the operation');
}

void foo3() async {
  try {
    // Wait for each future in a list, returns a list of futures:
    var results = await [delete(), copy(), errorResult()].wait;
  } on ParallelWaitError<List<bool?>, List<AsyncError?>> catch (e) {
    print(e.values[0]); // Prints successful future
    print(e.values[1]); // Prints successful future
    print(e.values[2]); // Prints null when the result is an error

    print(e.errors[0]); // Prints null when the result is successful
    print(e.errors[1]); // Prints null when the result is successful
    print(e.errors[2]); // Prints error
  }
}

void main() => foo3();
