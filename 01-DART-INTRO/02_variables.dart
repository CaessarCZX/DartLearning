void main() {
  // Always use "final" when you declare a variable
  // unless the value never going to change in that case use "const",
  // Otherwise if you need that the variable have another value, Just declare as common variable

  // String
  final String pokemon = 'Ditto';
  // int
  final int hp = 100;
  // boolean
  final bool isAlive = true;

  // List<String>
  final List<String> abilities = ['impostor']; // formal declaration
  //final abilities = <String>['impostor']; // declaration with Generics
  //final abilities = ['impostor']; // infered declaration

  final sprites = <String>['ditto/front.png', 'ditto/back.png'];

  //Dynamic variable
  // The data into this variable may be either null or any other type
  // dynamic == null
  // Alway apply null-safety with this type of data
  // Be careful using "dynamic variables", because basically lose any restriction applyed by Syntax
  dynamic errMsg = 'Hello';
  errMsg = true;
  errMsg = [1, 2, 3, 4, 5, 6];
  errMsg = {1, 2, 3, 4, 5, 6};
  errMsg = () => true;
  errMsg = null;

  // Multiline printing
  print("""
  $pokemon
  $hp
  $isAlive
  $abilities
  $sprites
  $errMsg
  """);
}
