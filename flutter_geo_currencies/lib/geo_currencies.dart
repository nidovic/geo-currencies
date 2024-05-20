library geo_currencies;

import 'dart:ui';

import 'package:geo_currencies/geo_currencies.dart';

import 'src/implementations/fake.dart';
import 'src/implementations/live.dart';

export './src/models/conversion_data.dart';
export './src/models/currency_conversion_data.dart';
export './src/models/currency_data.dart';
export './src/models/amount_converted_data.dart';
export './src/models/rate_data.dart';

/// Enum representing supported geo currency types.
enum GeoCurrenciesType {
  /// GeoCurrencies for live implementation.
  live,

  /// Fake GeoCurrencies implementation for testing.
  fake,
}

/// Configuration class for GeoCurrencies.
class GeoCurrenciesConfig {
  /// The geo currency type.
  final GeoCurrenciesType geoCurrenciesType;

  /// The locale.
  final Locale locale;

  /// Whether include symbol.
  final bool includeSymbol = true;

  /// The thousand separator.
  final String thousandSeparator;

  /// The symbol separator.
  final String symbolSeparator;

  /// The decimal digits.
  final int decimalDigits;

  /// The decimal separator.
  final String decimalSeparator;

  /// Constructs a new [GeoCurrenciesConfig].
  GeoCurrenciesConfig({
    required this.geoCurrenciesType,
    Locale? locale,
    bool? includeSymbol,
    String? thousandSeparator,
    String? symbolSeparator,
    int? decimalDigits,
    String? decimalSeparator,
  })  : locale = locale ?? const Locale('en', 'US'),
        thousandSeparator = thousandSeparator ?? ',',
        decimalSeparator = decimalSeparator ?? '.',
        symbolSeparator = symbolSeparator ?? ' ',
        decimalDigits = decimalDigits ?? 2;
}

/// Service providing the user's GeoCurrencies.
abstract class GeoCurrencies {
  /// Builds a [GeoCurrencies] implementation
  /// for the specified [GeoCurrenciesType].
  factory GeoCurrencies({required GeoCurrenciesConfig config}) {
    switch (config.geoCurrenciesType) {
      case GeoCurrenciesType.live:
        return GeoCurrenciesLiveImplementation(config);
      case GeoCurrenciesType.fake:
        return GeoCurrenciesFakeImplementation(config);
      default:
        return GeoCurrenciesLiveImplementation(config);
    }
  }

  /// Retrieves currency data for a specific location
  /// specified by [latitude] and [longitude].
  Future<CurrencyData?> getCurrencyDataByCoordinate({
    required double latitude,
    required double longitude,
  });

  /// Formats the given [amount] with the currency
  /// symbol of [currencyCodeIso4217] into a readable string.
  String formatAmountWithCurrencySymbol({
    required num amount,
    required String currencyCodeIso4217,
  });

  /// Formats the given [amount] with the currency
  /// code of [currencyCodeIso4217] into a readable string.
  String formatAmountWithCurrencyCode({
    required num amount,
    required String currencyCodeIso4217,
  });

  /// Converts the given [amount] from [fromCurrencyCodeIso4217]
  /// to [toCurrencyCodeIso4217] using currency codes.
  Future<ConversionData?> convertAmountWithCurrenciesCodes({
    required num amount,
    required String fromCurrencyCodeIso4217,
    required String toCurrencyCodeIso4217,
  });

  /// Converts the given [amount] using the [rate] to [toCurrencyCodeIso4217].
  AmountConvertedData convertAmountWithRate({
    required num amount,
    required num rate,
    required String toCurrencyCodeIso4217,
  });

  /// Retrieves the conversion rate between [fromCurrencyCodeIso4217]
  /// and [toCurrencyCodeIso4217].
  Future<RateData?> getRate({
    required String fromCurrencyCodeIso4217,
    required String toCurrencyCodeIso4217,
  });
}
