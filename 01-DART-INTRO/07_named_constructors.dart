void main() {
  final Map<String, dynamic> rawJson = {
    'name': 'Tony Stark',
    'power': 'Money',
    'isAlive': false,
  };

  //   final Hero ironMan = new Hero(
  //     name: 'Tony Stark',
  //     power: 'Money',
  //     isAlive: false,
  //   );

  final Hero ironMan = Hero.fromJSON(json: rawJson);

  print(ironMan);
}

class Hero {
  String _name;
  String _power;
  bool _isAlive;

  /// Common constructor
  Hero({required this._name, required this._power, required this._isAlive});

  ///Named Constructor in case receive a Json as argument
  Hero.fromJSON({required Map<String, dynamic> json})
    : _name = json['name'] ?? 'Name not found',
      _power = json['power'] ?? 'Power not found',
      _isAlive = json['isAlive'] ?? false;

  @override
  String toString() {
    return '$_name - $_power- Is alive?: ${_isAlive ? 'YES!!' : 'Nope'}';
  }
}
