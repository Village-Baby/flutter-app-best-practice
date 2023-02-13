class AppConfig {
  final Flavor flavor;

  AppConfig({
    this.flavor = Flavor.prd,
  });
}

enum Flavor {
  prd,
  dev,
}
