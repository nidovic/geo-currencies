library geo_currencies;

import 'dart:ui';

import 'src/implementations/fake.dart';
import 'src/implementations/live.dart';
import 'src/models/conversion_data.dart';
import 'src/models/currency_data.dart';

/// Supported geocoding backends.
enum GeoCurrenciesType {
  /// GeoCurrencies for live implementation.
  live,

  /// Fake GeoCurrencies implementation for testing.
  fake,
}

/// The representation of geo currencies config.
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

  /// Gets a currency date use in specify place
  /// with a pair [latitude] and [longitude].
  Future<CurrencyData?> getCurrencyDataByCoordinate({
    required double latitude,
    required double longitude,
  });

  /// Formats the given amount with currency to an easily readable string.
  String formatAmountWithCurrencySymbol({
    required num amount,
    required String currencyCodeIso4217,
  });

  /// Converts the given amount with currency.
  Future<ConversionData?> convertAmount({
    required num amount,
    required String fromCurrencyCodeIso4217,
    required String toCurrencyCodeIso4217,
  });
}
