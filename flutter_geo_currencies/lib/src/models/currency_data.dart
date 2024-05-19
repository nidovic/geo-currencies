/// Representation of a currency data.
class CurrencyData {
  /// The stored key ref for the [codeIso4217] property.
  static const keyCodeIso4217 = 'codeIso4217';

  /// The stored key ref for the [name] property.
  static const keyName = 'name';

  /// The stored key ref for the [countryName] property.
  static const keyCountryName = 'countryName';

  /// The stored key ref for the [symbol] property.
  static const keySymbol = 'symbol';

  /// The currency code in form iso 4217.
  final String? codeIso4217;

  /// The currency name.
  final String? name;

  /// The country name.
  final String? countryName;

  /// The symbol.
  final String? symbol;

  /// Constructs a new [CurrencyData].
  CurrencyData({
    this.codeIso4217,
    this.symbol,
    this.name,
    this.countryName,
  });
}
