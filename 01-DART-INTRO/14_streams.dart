void main() {
  print('Emiting from Stream');

  // Listening for Stream 
  emitNumbers().listen((value) {
    print('Stream value: $value');
  });

  print('End of stream');
}

/// Stream function statement
Stream<int> emitNumbers() {
  return Stream.periodic(const Duration(seconds: 1), (value) {
    return value;
  }).take(5); // Only take 5 stream periods
}
