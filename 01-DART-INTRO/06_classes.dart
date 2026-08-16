void main() {
  //   final Hero wolverine = new Hero('Logan', 'Regeneration');
  //   final wolverine = Hero('Logan', 'Regeneration');
  final wolverine = Hero(name: 'Logan');
  print(wolverine.toString());
}

/// Formal statement
// class Hero {
//   String _name = 'no-name';
//   String _power = 'no-power';

//   Hero(String pName, String pPower) {
//     this._name = pName;
//     this._power = pPower;
//   }

//   String toString() {
//     return 'Name: ${this._name}\nPower: ${this._power}';
//   }
// }

///Direct statement
class Hero {
  //   String _name = 'no-name';
  //   String _power = 'no-power';
  String _name;
  String _power;

  /// Classic instantiation
  //   Hero(String pName, String pPower) {
  //     _name = pName;
  //     _power = pPower;
  //   }
  /// Controlled instantiation
  //   Hero(String pName, String pPower) : _name = pName, _power = pPower;
  /// Classic direct instantiation
  //   Hero(this._name, this._power);

  // Named Params (Object shuc as param)
  Hero({required this._name, this._power = 'no-power'});

  //Over writing inherit method, always put decorator "@override"
  @override
  String toString() {
    return 'Name: $_name\nPower: $_power';
  }
}
