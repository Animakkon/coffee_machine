class Resources {
  int _milk = 250;
  int _water = 250;
  int _coffeeBeans = 250;
  int _cash = 0;

  Resources();

  int getMilk() => _milk;

  int getWater() => _water;

  int getBeans() => _coffeeBeans;

  int getCash() => _cash;

  setMilk(int milk) => _milk = milk;

  setWater(int water) => _water = water;

  setBeans(int beans) => _coffeeBeans = beans;

  setCash(int money) => _cash = money;
}