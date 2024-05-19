import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import '../../geo_currencies.dart';
import '../implementations/common/functions.dart';
import '../models/conversion_data.dart';

/// An implementation of [ExchangeRate].
class ExchangeRate {
  static final _log = Logger('ExchangeRate');

  /// Open Street map's Api endpoint url for geocoding.
  static const String _url = 'https://api.exchangerate-api.com/v4/latest/';

  /// Gets conversion data from exchange rate, Link to API documentation : https://nominatim.org/release-docs/latest/api/Reverse/.
  static Future<CurrencyConversionData?> getConversionData({
    required String fromCurrencyCodeIso4217,
  }) async {
    final String urlParams = '$_url${fromCurrencyCodeIso4217.toUpperCase()}';

    final Uri uri = Uri.parse(urlParams);
    try {
      final response = await http.get(uri);
      // Check status code response 200 mean it's okay.
      if (response.statusCode == 200) {
        return CurrencyConversionData.fromJson(json.decode(response.body));
      }
    } on HttpException catch (e) {
      _log.severe(e.toString(), e);

      return null;
    }

    return null;
  }

  /// Converts the given amount with currency.
  static Future<ConversionData?> convertAmount({
    required num amount,
    required String fromCurrencyCodeIso4217,
    required String toCurrencyCodeIso4217,
    required GeoCurrenciesConfig config,
    required CurrencyConversionData? currencyConversionData,
  }) async {
    if (currencyConversionData == null) {
      return null;
    }
    if (currencyConversionData.error != null) {
      return ConversionData.fromJson({
        ConversionData.keySucceeded: false,
        ConversionData.keyError: currencyConversionData.error,
      });
    }
    final toCurrencyCode = toCurrencyCodeIso4217.toUpperCase();
    final rate = currencyConversionData.rates?[toCurrencyCode];

    if (rate == null) {
      return ConversionData.fromJson({
        ConversionData.keySucceeded: false,
        ConversionData.keyError:
            'toCurrencyCodeIso4217 is unsupported : $toCurrencyCodeIso4217',
      });
    }

    return ConversionData.fromJson({
      ConversionData.keySucceeded: true,
      ConversionData.keyError: null,
      ConversionData.keyBaseAmount: amount,
      ConversionData.keyCurrencyConversionData: currencyConversionData,
      ConversionData.keyAmountConverted: amount * rate,
      ConversionData.keyFromCurrencyCodeIso4217: fromCurrencyCodeIso4217,
      ConversionData.keyToCurrencyCodeIso4217: toCurrencyCodeIso4217,
      ConversionData.keyFormatAmountConverted: formatAmount(
        amount: amount * rate,
        config: config,
        currencyCodeIso4217: toCurrencyCodeIso4217,
      ),
    });
  }
}

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
                    isUtc: true)
                .toLocal()
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
