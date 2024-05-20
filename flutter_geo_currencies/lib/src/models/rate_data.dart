import 'currency_conversion_data.dart';

/// Representation of the rate data.
class RateData {
  /// The stored key ref for the [error] property.
  static const keyError = 'error';

  /// The stored key ref for the [fromCurrencyCodeIso4217] property.
  static const keyFromCurrencyCodeIso4217 = 'fromCurrencyCodeIso4217';

  /// The stored key ref for the [toCurrencyCodeIso4217] property.
  static const keyToCurrencyCodeIso4217 = 'toCurrencyCodeIso4217';

  /// The stored key ref for the [succeeded] property.
  static const keySucceeded = 'succeeded';

  /// The stored key ref for the [currencyConversionData] property.
  static const keyCurrencyConversionData = 'currencyConversionData';

  /// The stored key ref for the [rate] property.
  static const keyRate = 'rate';

  /// The error.
  final String? error;

  /// Wether the conversion is succeed.
  final bool succeeded;

  /// The currency code iso 4217 to which we must convert.
  final String? toCurrencyCodeIso4217;

  /// The currency code iso 4217 from which to convert.
  final String? fromCurrencyCodeIso4217;

  /// The currency conversion data.
  final CurrencyConversionData? currencyConversionData;

  /// The rate.
  final num? rate;

  /// Constructs a  new [RateData] from [Map] object.
  RateData.fromJson(
    Map<String, dynamic> json,
  )   : fromCurrencyCodeIso4217 = json[keyFromCurrencyCodeIso4217],
        toCurrencyCodeIso4217 = json[keyToCurrencyCodeIso4217],
        succeeded = json[keySucceeded],
        currencyConversionData = json[keyCurrencyConversionData],
        rate = json[keyRate],
        error = json[keyError];

  /// Converts class to json.
  Map<String, dynamic> toJson() => {
        keyError: error,
        keyFromCurrencyCodeIso4217: fromCurrencyCodeIso4217,
        keyToCurrencyCodeIso4217: toCurrencyCodeIso4217,
        keyCurrencyConversionData: currencyConversionData,
        keyRate: rate,
        keySucceeded: succeeded,
      };
}
