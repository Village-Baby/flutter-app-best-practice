enum Flavor {
  PRD,
  DEV,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.PRD:
        return 'Baby Billy';
      case Flavor.DEV:
        return '(STG)Baby Billy';
      default:
        return 'title';
    }
  }

}
