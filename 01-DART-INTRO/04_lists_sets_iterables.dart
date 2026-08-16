void main() {
  final numbers = [1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9, 10];

  print('Original List: $numbers');
  print('List length: ${numbers.length}');
  print('Index 0: ${numbers[0]}');
  print('First element: ${numbers.first}');
  print('Reversed: ${numbers.reversed}');

  final reversedNumbers = numbers.reversed;
  print('Iterable: $reversedNumbers');
  print('List: ${reversedNumbers.toList()}');
  print('Set: ${reversedNumbers.toSet()}');

  final numbersGreaterThanFive = numbers.where((numb) => numb > 5);
  print('>5 iterable: $numbersGreaterThanFive');
  print('>5 set: ${numbersGreaterThanFive.toSet()}');
}
