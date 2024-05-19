import 'currency_conversion_data.dart';

/// Representation of the conversion data.
class ConversionData {
  /// The stored key ref for the [error] property.
  static const keyError = 'error';

  /// The stored key ref for the [baseAmount] property.
  static const keyBaseAmount = 'baseAmount';

  /// The stored key ref for the [amountConverted] property.
  static const keyAmountConverted = 'amountConverted';

  /// The stored key ref for the [formatAmountConverted] property.
  static const keyFormatAmountConverted = 'formatAmountConverted';

  /// The stored key ref for the [fromCurrencyCodeIso4217] property.
  static const keyFromCurrencyCodeIso4217 = 'fromCurrencyCodeIso4217';

  /// The stored key ref for the [toCurrencyCodeIso4217] property.
  static const keyToCurrencyCodeIso4217 = 'toCurrencyCodeIso4217';

  /// The stored key ref for the [succeeded] property.
  static const keySucceeded = 'succeeded';

  /// The stored key ref for the [currencyConversionData] property.
  static const keyCurrencyConversionData = 'currencyConversionData';

  /// The error.
  final String? error;

  /// The base amount.
  final num? baseAmount;

  /// Wether the conversion is succeed.
  final bool succeeded;

  /// The amount converted.
  final num? amountConverted;

  /// The format amount converted.
  final String? formatAmountConverted;

  /// The currency code iso 4217 to which we must convert.
  final String? toCurrencyCodeIso4217;

  /// The currency code iso 4217 from which to convert.
  final String? fromCurrencyCodeIso4217;

  /// The currency conversion data.
  final CurrencyConversionData? currencyConversionData;

  /// Constructs a  new [ConversionData] from [Map] object.
  ConversionData.fromJson(
    Map<String, dynamic> json,
  )   : baseAmount = json[keyBaseAmount],
        amountConverted = json[keyAmountConverted],
        fromCurrencyCodeIso4217 = json[keyFromCurrencyCodeIso4217],
        toCurrencyCodeIso4217 = json[keyToCurrencyCodeIso4217],
        succeeded = json[keySucceeded],
        formatAmountConverted = json[keyFormatAmountConverted],
        currencyConversionData = json[keyCurrencyConversionData],
        error = json[keyError];

  /// Converts class to json.
  Map<String, dynamic> toJson() => {
        keyError: error,
        keyBaseAmount: baseAmount,
        keyAmountConverted: amountConverted,
        keyFromCurrencyCodeIso4217: fromCurrencyCodeIso4217,
        keyToCurrencyCodeIso4217: toCurrencyCodeIso4217,
        keyFormatAmountConverted: formatAmountConverted,
        keyCurrencyConversionData: currencyConversionData,
        keySucceeded: succeeded,
      };
}
