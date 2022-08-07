import 'package:coffee_machine/classes/Coffee.dart';
import 'package:coffee_machine/classes/Resources.dart';
import 'package:coffee_machine/enums/CoffeeType.dart';
import 'package:coffee_machine/interfaces/ICoffee.dart';

class Machine {
  Machine._privateConstructor();
  static final Machine _instance = Machine._privateConstructor();
  factory Machine() => _instance;

  final Resources _resources = Resources();

  Resources getResources() => _resources;

  fillMilk(int value) => _resources.setMilk(_resources.getMilk() + value);

  fillWater(int value) => _resources.setWater(_resources.getWater() + value);

  fillBeans(int value) => _resources.setBeans(_resources.getBeans() + value);

  fillCash(int value) => _resources.setCash(_resources.getCash() + value);

  // фабрика - в зависимости от типа создаем нужный кофе
  makeCoffee(CoffeeType type) {
    switch (type) {
      case CoffeeType.espresso:
        if (isAvailable(Espresso())) {
          _make(Espresso());
        }
        break;
      case CoffeeType.cappuccino:
        if (isAvailable(Cappuccino())) {
          _make(Cappuccino());
        }
        break;
      //  todo: оповестить пользователя, что не хватает ресурсов
    }
  }

  bool isAvailable(ICoffee coffee) {
    return _resources.getWater() >= coffee.water() &&
        _resources.getMilk() >= coffee.milk() &&
        _resources.getBeans() >= coffee.beans() &&
        _resources.getCash() >= coffee.cost();
  }

  _make(ICoffee coffee) {
    _resources.setWater(_resources.getWater() - coffee.water());
    _resources.setMilk(_resources.getMilk() - coffee.milk());
    _resources.setBeans(_resources.getBeans() - coffee.beans());
    _resources.setCash(_resources.getCash() - coffee.cost());
  }
}
