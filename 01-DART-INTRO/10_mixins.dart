void main() {
  final Dolphin flippy = Dolphin();
  flippy.swim();

  final Bat bat = Bat();
  bat.fly();
  bat.walk();

  final Duck duck = Duck();
  duck.fly();
  duck.walk();
  duck.swim();
}

abstract class Animal {}

abstract class Mammal extends Animal {}

abstract class Bird extends Animal {}

abstract class Fish extends Animal {}

mixin Walker {
  void walk() => print('I am walking');
}

mixin Swimmer {
  void swim() => print('I am swmming');
}

mixin Flyer {
  void fly() => print('I am flying');
}

/// Declare a class
class Dolphin extends Mammal with Swimmer {
  Dolphin();
}

class Bat extends Mammal with Flyer, Walker {
  Bat();
}

class Cat extends Mammal with Walker {
  Cat();
}

class Dove extends Bird with Flyer, Walker {
  Dove();
}

class Duck extends Bird with Flyer, Walker, Swimmer {
  Duck();
}

class Shark extends Fish with Swimmer {
  Shark();
}

class FlyingFish extends Fish with Swimmer, Flyer {
  FlyingFish();
}
