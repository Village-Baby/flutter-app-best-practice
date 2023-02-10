class AppConfig {
  final Flavor flavor;

  AppConfig({
    required this.flavor,
  });
}

enum Flavor {
  prd,
  dev,
}
