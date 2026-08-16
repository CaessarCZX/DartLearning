void main() {
  final WindPlant windPlant = WindPlant(initialEnergy: 100);
  final NuclearPlant nukePlant = NuclearPlant(energyLeft: 100);
  print('Wind:\n$windPlant');
  print('Nuclear:\n$nukePlant');

  print('Consuming energy: 45w');
  windPlant.consumeEnergy(45);
  nukePlant.consumeEnergy(45);

  print('Wind:\n$windPlant');
  print('Nuclear:\n$nukePlant');

  chargePhone(windPlant);
  chargePhone(nukePlant);
  print('Applying charge to Phone...');

  print('Wind:\n$windPlant');
  print('Nuclear:\n$nukePlant');
}

void chargePhone(EnergyPlant plant) {
  if (plant.energyLeft < 10) throw Exception('Not enough energy');
  plant.consumeEnergy(10);
}

enum PlantType { nuclear, wind, water }

abstract class EnergyPlant {
  double _energyLeft;
  final PlantType _type;

  EnergyPlant({required this._energyLeft, required this._type});

  void consumeEnergy(double amount);

  double get energyLeft => this._energyLeft;
  PlantType get type => this._type;
  void set energyLeft(double amount) => this._energyLeft = amount;
}

// Extend or Implementation

/// Extended statement for class
class WindPlant extends EnergyPlant {
  WindPlant({required double initialEnergy})
    : super(energyLeft: initialEnergy, type: PlantType.wind);

  @override
  void consumeEnergy(double amount) {
    if (amount < 0) throw 'Amount cannot be negative';
    final double finalConsume = (amount > energyLeft) ? energyLeft : amount;
    energyLeft -= finalConsume;
  }

  @override
  String toString() {
    return 'Current energy:$energyLeft \nType of Energy: $type';
  }
}

/// Implementation statement for class
// Implementation forces a explicit colocation of "@override" in every eighter attribute or method of a implemented class

class NuclearPlant implements EnergyPlant {
  @override
  double _energyLeft;
  @override
  final PlantType _type = PlantType.nuclear;

  NuclearPlant({required this._energyLeft});

  @override
  void consumeEnergy(double amount) {
    if (amount < 0) throw 'Amount cannot be negative';
    final performingConsume = amount * 0.5;
    final double finalConsume = (performingConsume > energyLeft)
        ? energyLeft
        : performingConsume;
    energyLeft -= finalConsume;
  }

  @override
  double get energyLeft => this._energyLeft;
  @override
  PlantType get type => this._type;
  @override
  void set energyLeft(double amount) => this._energyLeft = amount;

  @override
  String toString() {
    return 'Current energy:$energyLeft \nType of Energy: $type';
  }
}
