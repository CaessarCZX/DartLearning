void main() {
  emitNumber().listen((int value) {
    print('Emited value: $value');
  });
}
// Async* is uset to convert a Stream function into a Future data
Stream<int> emitNumber() async* {
  final valuesToEmit = [1, 2, 3, 4, 5];

  for (int value in valuesToEmit) {
    await Future.delayed(const Duration(seconds: 1));
    // In Async* functions, the data recieved by Stream must be emited to listeners
    // with the keyword 'yield', in this type of functions 'return' cannot be used
    yield value;
  }
}
