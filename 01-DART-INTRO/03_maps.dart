void main() {
  /// Map use

  // Every Map varibale can be Defined according to type of "keyword" and "value"
  // in this case "dynamic" is used for values because may be any type of data
  final Map<String, dynamic> pokemon = {
    'name': 'Ditto',
    'hp': 100,
    'isAlive': true,
    'habilities': <String>['impostor'],
    // embedded map
    'sprites': <int, String>{1: 'ditto/front.png', 2: 'ditto/back.png'},
    //     'sprites': <String>['ditto/front.png', 'ditto/back.png'],
  };

  print(pokemon);
  print('healt points: ${pokemon['hp']}');
  print('sprites available: ${pokemon['sprites']}');
  print('sprite front: ${pokemon['sprites'][1]}');
  print('sprite back: ${pokemon['sprites'][2]}');
}
