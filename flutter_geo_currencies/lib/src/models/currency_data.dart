/// Representation of a currency data.
class CurrencyData {
  /// The stored key ref for the [codeAlpha3] property.
  static const keyCodeAlpha3 = 'codeAlpha3';

  /// The stored key ref for the [name] property.
  static const keyName = 'name';

  /// The stored key ref for the [countryName] property.
  static const keyCountryName = 'countryName';

  /// The stored key ref for the [symbol] property.
  static const keySymbol = 'symbol';

  /// The currency code in form alpha 3.
  final String? codeAlpha3;

  /// The currency name.
  final String? name;

  /// The country name.
  final String? countryName;

  /// The symbol.
  final String? symbol;

  /// Constructs a new [CurrencyData].
  CurrencyData({
    this.codeAlpha3,
    this.symbol,
    this.name,
    this.countryName,
  });
}
