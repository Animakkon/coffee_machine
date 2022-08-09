import 'dart:ui';

import 'package:coffee_machine/classes/Machine.dart';
import 'package:coffee_machine/enums/CoffeeType.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//todo: разбить на кусочки виджетов для простоты
class CoffeeMaker extends StatefulWidget {
  const CoffeeMaker({Key? key}) : super(key: key);

  @override
  State<CoffeeMaker> createState() => _CoffeeMaker();
}

class _CoffeeMaker extends State<CoffeeMaker> {
  CoffeeType _type = CoffeeType.espresso;
  final GlobalKey<FormState> _userMoneyInput = GlobalKey<FormState>();
  final TextEditingController userMoneyInputController =
      TextEditingController();

  Machine machine = Machine();

  // Clean up the controller when the widget is disposed
  @override
  void dispose() {
    userMoneyInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //todo: автоматическое определение высоты элементов

    return ListView(
      children: [
        // * height: 300
        Container(
          height: 300,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          color: Colors.lime,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                // todo: выровнять по правому краю текст
                child: Column(children: [
                  Text('Beans: ${machine.getResources().getBeans()}',
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black45),
                      textAlign: TextAlign.right),
                  Text('Milk: ${machine.getResources().getMilk()}',
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black45),
                      textAlign: TextAlign.right),
                  Text('Water: ${machine.getResources().getWater()}',
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black45),
                      textAlign: TextAlign.right),
                ]),
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(6),
                color: Colors.white60,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // todo: поставить таймер на приготовление кофе и на то, готов ли он
                      const Text('Coffee Maker',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                            'Your money: ${machine.getResources().getCash()}',
                            style: const TextStyle(
                                fontSize: 24, color: Colors.black54)),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
        // * height: 250
        Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: Offset.zero,
                )
              ],
            ),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.black12,
                              style: BorderStyle.solid,
                              width: 1))),
                  child: Center(
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: const Text('espresso'),
                                leading: Radio<CoffeeType>(
                                  value: CoffeeType.espresso,
                                  groupValue: _type,
                                  onChanged: (CoffeeType? value) {
                                    setState(() {
                                      _type = value!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('cappuccino'),
                                leading: Radio<CoffeeType>(
                                  value: CoffeeType.cappuccino,
                                  groupValue: _type,
                                  onChanged: (CoffeeType? value) {
                                    setState(() {
                                      _type = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          flex: 2,
                        ),
                        Flexible(
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                  icon: const Icon(Icons.play_arrow_rounded),
                                  //todo: making coffee method
                                  onPressed: () => setState(() {
                                        machine.makeCoffee(_type);
                                      })),
                            ),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Form(
                                key: _userMoneyInput,
                                child: TextFormField(
                                  controller: userMoneyInputController,
                                  decoration: const InputDecoration(
                                      hintText: 'Put money here'),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter some money';
                                    }
                                    // todo: regex????????????????????????????????????????????????????????????????????
                                    try {
                                      var cash = int.parse(value);
                                    } catch (e) {
                                      return 'you put strange money!!!';
                                    }
                                    return null;
                                  },
                                )),
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: Row(children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 5, right: 5),
                                decoration: BoxDecoration(
                                    color: Colors.lightGreen[200],
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                  icon: Icon(Icons.monetization_on),
                                  onPressed: () {
                                    if (_userMoneyInput.currentState!
                                        .validate()) {
                                      // todo: высвечивающаяся подсказка
                                      setState(() {
                                        machine.getResources().setCash(machine
                                                .getResources()
                                                .getCash() +
                                            int.parse(
                                                userMoneyInputController.text));
                                      });
                                      _userMoneyInput.currentState?.reset();
                                    }
                                  },
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 5, right: 5),
                                decoration: BoxDecoration(
                                    color: Colors.pink[200],
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                    icon: Icon(Icons.money_off),
                                    // todo: высвечивающаяся подсказка
                                    onPressed: () => setState(() {
                                          if (machine.getResources().getCash() > 0) {
                                            machine.getResources().setCash(0);
                                          }// todo: print("you have no money")
                                        })),
                              ),
                            ]))
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
