import 'dart:ui';

import 'package:intl/intl.dart';

import '../../geo_currencies.dart';
import '../models/currency_data.dart';

/// An implementation of [GeoCurrenciesInterface] used for live implementation.
class GeoCurrenciesFakeImplementation implements GeoCurrenciesInterface {
  @override
  Future<CurrencyData?> getCurrencyDataByCoordinate({
    required double latitude,
    required double longitude,
  }) async {
    return CurrencyData(
      codeAlpha3: 'XAF',
      countryName: 'Cameroon',
      name: 'Central African CFA Franc',
      symbol: NumberFormat.simpleCurrency(
        name: 'XAF',
      ).currencySymbol,
    );
  }

  @override
  String formatAmountWithCurrencySymbol({
    required num amount,
    required String currencyCodeAlpha3,
    Locale? locale = const Locale('en', 'US'),
  }) =>
      NumberFormat.currency(
        name: currencyCodeAlpha3,
        symbol: '${NumberFormat.simpleCurrency(
          name: currencyCodeAlpha3,
        ).currencySymbol} ',
        locale: locale?.languageCode.toLowerCase(),
      ).format(amount);
}
