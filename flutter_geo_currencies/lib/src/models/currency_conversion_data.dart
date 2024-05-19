/// Representation of the currency conversion data.
class CurrencyConversionData {
  /// The stored key ref for the [provider] property.
  static const keyProvider = 'provider';

  /// The stored key ref for the [baseCodeIso4217] property.
  static const keyBaseCodeIso4217 = 'base';

  /// The stored key ref for the [rates] property.
  static const keyRates = 'rates';

  /// The stored key ref for the [lastTimeUpdated] property.
  static const keyLastTimeUpdated = 'time_last_updated';

  /// The stored key ref for the [error] property.
  static const keyError = 'error_type';

  /// The code for the currency conversion in form iso 4217.
  final String? baseCodeIso4217;

  /// The provider of data.
  final String? provider;

  /// The error.
  final String? error;

  /// The different conversion rates.
  final Map<String, num>? rates;

  /// The date and time the currency conversion updates in UTC.
  final DateTime? lastTimeUpdated;

  /// Constructs a  new [CurrencyConversionData] from [Map] object.
  CurrencyConversionData.fromJson(
    Map<String, dynamic> json,
  )   : baseCodeIso4217 = json[keyBaseCodeIso4217],
        rates = Map<String, num>.from(json[keyRates]),
        provider = json[keyProvider],
        error = json[keyError],
        lastTimeUpdated = json[keyLastTimeUpdated] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                json[keyLastTimeUpdated] * 1000,
                isUtc: true,
              ).toLocal()
            : null;

  /// Converts class to json.
  Map<String, dynamic> toJson() {
    final time = lastTimeUpdated?.millisecondsSinceEpoch;

    return {
      keyBaseCodeIso4217: baseCodeIso4217,
      keyRates: rates,
      keyProvider: provider,
      keyError: error,
      keyLastTimeUpdated: time != null ? (time ~/ 1000) : null,
    };
  }
}
