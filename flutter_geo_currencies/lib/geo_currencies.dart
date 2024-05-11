library flutter_geo_currencies;

import 'dart:ui';

import 'src/implementations/fake.dart';
import 'src/implementations/live.dart';
import 'src/models/currency_data.dart';

/// Supported geocoding backends.
enum GeoCurrenciesType {
  /// GeoCurrencies for live implementation.
  live,

  /// Fake GeoCurrencies implementation for testing.
  fake,
}

/// Service providing the user's GeoCurrencies.
abstract class GeoCurrenciesInterface {
  /// Builds a [GeoCurrenciesInterface] implementation
  /// for the specified [GeoCurrenciesType].
  factory GeoCurrenciesInterface([GeoCurrenciesType? type]) {
    switch (type) {
      case GeoCurrenciesType.live:
        return GeoCurrenciesLiveImplementation();
      case GeoCurrenciesType.fake:
        return GeoCurrenciesFakeImplementation();
      default:
        return GeoCurrenciesLiveImplementation();
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
    required String currencyCodeAlpha3,
    Locale? locale = const Locale('en', 'US'),
  });
}
