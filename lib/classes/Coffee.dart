import 'package:coffee_machine/interfaces/ICoffee.dart';

class Espresso implements ICoffee {
  // singleton паттерн
  Espresso._privateConstructor();

  static final Espresso _instance = Espresso._privateConstructor();

  factory Espresso() => _instance;


  @override
  int beans() => 10;

  //todo:  кастомное исключение ????????????????????????????????????????????77
  @override
  int milk() => 0;

  @override
  int water() => 100;

  @override
  int cost() => 100;

}

class Cappuccino implements ICoffee {
  Cappuccino._privateConstructor();

  static final Cappuccino _instance = Cappuccino._privateConstructor();

  factory Cappuccino() => _instance;

  @override
  int beans() => 25;

  @override
  int milk() => 120;

  @override
  int water() => 55;

  @override
  int cost() => 200;

}