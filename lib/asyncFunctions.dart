import 'package:coffee_machine/enums/CoffeeType.dart';
import 'package:coffee_machine/interfaces/ICoffee.dart';
import 'package:flutter/material.dart';

Future<String> boilingWater() async {
  print('start_process: water');
  return Future.delayed(const Duration(seconds: 5),() => 'done_process: water');
}

Future<String> coffeeWithWater() async {
  print('start_process: espresso');
  return Future.delayed(Duration(seconds: 5), () => 'done_process: coffee with water');
}

Future<String> milkBoiling() async {
  print('start_process: milk');
  return Future.delayed(Duration(seconds: 3), () => 'done_process: milk');
}

Future<void> process(CoffeeType type, BuildContext context) async {
  print('*------------------------------*');
  print('_start_');
  if (type == CoffeeType.cappuccino) {
    final milkPrepairing = milkBoiling();
    milkPrepairing.then((value) => print(value));
  }
  final waterPrepairing = await boilingWater();
  print(waterPrepairing);
  print('_then_');
  final mixedCoffee = await coffeeWithWater();
  print(mixedCoffee);
  print('_end_');

  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(
    content: Text('coffee is done'),
  ));
}