import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import '../../geo_currencies.dart';
import '../implementations/common/functions.dart';

/// An implementation of [ExchangeRate].
class ExchangeRate {
  static final _log = Logger('ExchangeRate');

  /// Open Street map's Api endpoint url for geocoding.
  static const String _url = 'https://api.exchangerate-api.com/v4/latest/';

  /// Gets conversion data from exchange rate, Link to API documentation : https://www.exchangerate-api.com/docs/free.
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
      ConversionData.keyRate: rate,
      ConversionData.keyFormattedAmountConvertedWithCurrencySymbol:
          formatAmount(
        amount: amount * rate,
        config: config,
        currencyCodeIso4217: toCurrencyCodeIso4217,
        formatWithSymbol: true,
      ),
      ConversionData.keyFormattedAmountConvertedWithCurrencyCode: formatAmount(
        amount: amount * rate,
        config: config,
        currencyCodeIso4217: toCurrencyCodeIso4217,
        formatWithSymbol: false,
      ),
    });
  }

  /// Gets the rates.
  static Future<RateData?> getRate({
    required String fromCurrencyCodeIso4217,
    required String toCurrencyCodeIso4217,
    required CurrencyConversionData? currencyConversionData,
  }) async {
    if (currencyConversionData == null) {
      return null;
    }
    if (currencyConversionData.error != null) {
      return RateData.fromJson({
        RateData.keySucceeded: false,
        RateData.keyError: currencyConversionData.error,
      });
    }
    final toCurrencyCode = toCurrencyCodeIso4217.toUpperCase();
    final rate = currencyConversionData.rates?[toCurrencyCode];

    if (rate == null) {
      return RateData.fromJson({
        RateData.keySucceeded: false,
        RateData.keyError:
            'toCurrencyCodeIso4217 is unsupported : $toCurrencyCodeIso4217',
      });
    }

    return RateData.fromJson({
      RateData.keySucceeded: true,
      RateData.keyError: null,
      RateData.keyCurrencyConversionData: currencyConversionData,
      RateData.keyFromCurrencyCodeIso4217: fromCurrencyCodeIso4217,
      RateData.keyToCurrencyCodeIso4217: toCurrencyCodeIso4217,
      RateData.keyRate: rate,
    });
  }
}
