void main() {
  final Square mySquare = Square(side: 10);
  mySquare.side = 9;
  print(mySquare.area);
}

class Square {
  double _side;

  /// Assertions are used to keep business rules and prevent fatal mistakes
  Square({required double side})
    : assert(side >= 0, 'Side must be >= than 0'),
    _side = side;

  double _calcArea() => _side * _side;

  double get area => _calcArea();

  void set side(double newSide) {
    if (newSide < 0) throw 'Value must be greater than zero';

    _side = newSide;
  }
}
