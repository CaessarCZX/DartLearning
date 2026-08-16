void main() {
  print(greeEveryone());
  print('Sum of two: ${addTwoNumbers(10, 20)}');
  print('Sum of two in Arroy func: ${addTwoNumbersArrow(10, 20)}');
  print(greetingPerson(name: 'Luis', message: 'Hi,'));
}

/// Common function statement
/*
String greeEveryone() {
  return "Hello, how are you?";
}
*/
/// Arrow functions only for oneline functions
String greeEveryone() => 'Hello, how are you?';

/// Always type the parameters for functions
// Function with mandatory parameters
int addTwoNumbers(int a, int b) {
  return a + b;
}

int addTwoNumbersArrow(int a, int b) => a + b;

/// Function with optional parameters, the second parameter is already setted in "0"
int addTwoNumbersOptional(int a, [int b = 0]) {
  // Validation post parameter example
  // b = b ?? 0;
  // valid shortcut
  //   b ??= 0;

  return a + b;
}

/// Named params
/// When the params are named become the possiblity to be null
// Full optionaly named params
// String greetingPerson({String? name, String? message}) {
//   return '$message $name';
// }

// Optional initialized and mandatory params
String greetingPerson({required String name, String message = 'Hello,'}) {
  return '$message $name';
}
