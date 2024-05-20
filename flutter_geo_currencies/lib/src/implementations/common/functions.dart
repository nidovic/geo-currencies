import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';

import '../../../geo_currencies.dart';

/// Formats the given amount with currency to an easily readable string.
String formatAmount({
  required num amount,
  required String currencyCodeIso4217,
  required bool formatWithSymbol,
  required GeoCurrenciesConfig config,
}) {
  String symbol = '';
  if (config.includeSymbol) {
    symbol = formatWithSymbol
        ? NumberFormat.simpleCurrency(
            locale: config.locale.toString(),
            name: currencyCodeIso4217,
          ).currencySymbol
        : currencyCodeIso4217.toUpperCase();
  }

  final formattedAmount = NumberFormat.currency(
    locale: config.locale.languageCode.toLowerCase(),
    name: currencyCodeIso4217,
    symbol: '',
    decimalDigits: config.decimalDigits,
  ).format(amount);

  final symbols = NumberSymbols(
    NAME: '',
    DECIMAL_SEP: config.decimalSeparator,
    GROUP_SEP: config.thousandSeparator,
    PERCENT: '%',
    ZERO_DIGIT: '0',
    PLUS_SIGN: '+',
    MINUS_SIGN: '-',
    EXP_SYMBOL: 'E',
    PERMILL: '‰',
    INFINITY: '∞',
    NAN: 'NaN',
    DECIMAL_PATTERN: '#,##0.###',
    SCIENTIFIC_PATTERN: '#E0',
    PERCENT_PATTERN: '#,##0%',
    CURRENCY_PATTERN: '¤#,##0.00',
    DEF_CURRENCY_CODE: '',
  );

  final formattedAmountWithCustomSymbols =
      formattedAmount.replaceAll(symbols.GROUP_SEP, config.thousandSeparator);

  return symbol + config.symbolSeparator + formattedAmountWithCustomSymbols;
}

/// Converts the given [amount] using the [rate] to [toCurrencyCodeIso4217].
AmountConvertedData convertAmount({
  required num amount,
  required num rate,
  required String toCurrencyCodeIso4217,
  required GeoCurrenciesConfig config,
}) =>
    AmountConvertedData.fromJson({
      AmountConvertedData.keyBaseAmount: amount,
      AmountConvertedData.keyToCurrencyCodeIso4217: toCurrencyCodeIso4217,
      AmountConvertedData.keyAmountConverted: amount * rate,
      AmountConvertedData.keyFormattedAmountConvertedWithCurrencySymbol:
          formatAmount(
        amount: amount * rate,
        config: config,
        currencyCodeIso4217: toCurrencyCodeIso4217,
        formatWithSymbol: true,
      ),
      AmountConvertedData.keyFormattedAmountConvertedWithCurrencyCode:
          formatAmount(
        amount: amount * rate,
        config: config,
        currencyCodeIso4217: toCurrencyCodeIso4217,
        formatWithSymbol: false,
      ),
      AmountConvertedData.keyRate: rate,
    });
