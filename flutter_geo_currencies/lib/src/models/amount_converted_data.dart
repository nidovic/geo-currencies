/// Representation of the amount converted data.
class AmountConvertedData {
  /// The stored key ref for the [baseAmount] property.
  static const keyBaseAmount = 'baseAmount';

  /// The stored key ref for the [amountConverted] property.
  static const keyAmountConverted = 'amountConverted';

  /// The stored key ref for the [formattedAmountConvertedWithCurrencyCode] property.
  static const keyFormattedAmountConvertedWithCurrencyCode =
      'formattedAmountConvertedWithCurrencyCode';

  /// The stored key ref for the [formattedAmountConvertedWithCurrencySymbol] property.
  static const keyFormattedAmountConvertedWithCurrencySymbol =
      'formattedAmountConvertedWithCurrencySymbol';

  /// The stored key ref for the [toCurrencyCodeIso4217] property.
  static const keyToCurrencyCodeIso4217 = 'toCurrencyCodeIso4217';

  /// The stored key ref for the [rate] property.
  static const keyRate = 'rate';

  /// The base amount.
  final num? baseAmount;

  /// The amount converted.
  final num? amountConverted;

  /// The formatted amount converted with currency code.
  final String? formattedAmountConvertedWithCurrencyCode;

  /// The formatted amount converted with currency symbol.
  final String? formattedAmountConvertedWithCurrencySymbol;

  /// The currency code iso 4217 to which we must convert.
  final String? toCurrencyCodeIso4217;

  /// The rate.
  final num? rate;

  /// Constructs a  new [AmountConvertedData] from [Map] object.
  AmountConvertedData.fromJson(
    Map<String, dynamic> json,
  )   : baseAmount = json[keyBaseAmount],
        amountConverted = json[keyAmountConverted],
        toCurrencyCodeIso4217 = json[keyToCurrencyCodeIso4217],
        formattedAmountConvertedWithCurrencySymbol =
            json[keyFormattedAmountConvertedWithCurrencySymbol],
        formattedAmountConvertedWithCurrencyCode =
            json[keyFormattedAmountConvertedWithCurrencyCode],
        rate = json[keyRate];

  /// Converts class to json.
  Map<String, dynamic> toJson() => {
        keyBaseAmount: baseAmount,
        keyAmountConverted: amountConverted,
        keyToCurrencyCodeIso4217: toCurrencyCodeIso4217,
        keyFormattedAmountConvertedWithCurrencyCode:
            formattedAmountConvertedWithCurrencyCode,
        keyFormattedAmountConvertedWithCurrencySymbol:
            formattedAmountConvertedWithCurrencySymbol,
        keyRate: rate,
      };
}
