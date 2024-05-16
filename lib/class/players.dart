class Players {
  String name;
  int buyin = 1;
  double base;
  double total = 0.0;
  double playerBase = 0.0;
  double earning = 0.0;

  void increasebuyin() {
    buyin++;
    updateValues();
  }

  void decreasebuyin(int mode) {
    if (buyin > 0) {
      buyin--;
      updateValues();
    }
  }

  void updateValues() {
    playerBase = buyin * base;
    earning = total - base;
    print("$name Total: $total, Earning: $earning, Base: $playerBase");
  }

  Players(this.name, [this.base = 25.0]) {
    playerBase = buyin * base;
  }
}
