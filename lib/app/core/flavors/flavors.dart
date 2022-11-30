enum Flavors {
  local('.env.local'),
  development('.env.development'),
  production('.env.production');

  final String _environment;

  const Flavors(this._environment);

  String getEnvironment() => _environment;
}
//config dos env