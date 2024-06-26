import 'dart:ui';

import 'package:intl/intl.dart';

import '../../geo_currencies.dart';
import '../services/exchange_rate.dart';
import 'common/functions.dart';

const _currencyConversionData = {
  'provider': 'https://www.exchangerate-api.com',
  'WARNING_UPGRADE_TO_V6': 'https://www.exchangerate-api.com/docs/free',
  'terms': 'https://www.exchangerate-api.com/terms',
  'base': 'EUR',
  'date': '2024-05-19',
  'time_last_updated': 1716076801,
  'rates': {
    'EUR': 1,
    'AED': 3.99,
    'AFN': 78.15,
    'ALL': 100.41,
    'AMD': 420.61,
    'ANG': 1.94,
    'AOA': 928.7,
    'ARS': 939.55,
    'AUD': 1.63,
    'AWG': 1.94,
    'AZN': 1.85,
    'BAM': 1.96,
    'BBD': 2.17,
    'BDT': 127.28,
    'BGN': 1.96,
    'BHD': 0.409,
    'BIF': 3106.64,
    'BMD': 1.09,
    'BND': 1.46,
    'BOB': 7.53,
    'BRL': 5.56,
    'BSD': 1.09,
    'BTN': 90.53,
    'BWP': 14.76,
    'BYN': 3.51,
    'BZD': 2.17,
    'CAD': 1.48,
    'CDF': 3034.23,
    'CHF': 0.987,
    'CLP': 977,
    'CNY': 7.85,
    'COP': 4166.48,
    'CRC': 556.18,
    'CUP': 26.08,
    'CVE': 110.27,
    'CZK': 24.71,
    'DJF': 193.09,
    'DKK': 7.46,
    'DOP': 63.55,
    'DZD': 146.32,
    'EGP': 50.94,
    'ERN': 16.3,
    'ETB': 62.53,
    'FJD': 2.43,
    'FKP': 0.856,
    'FOK': 7.46,
    'GBP': 0.856,
    'GEL': 2.98,
    'GGP': 0.856,
    'GHS': 15.73,
    'GIP': 0.856,
    'GMD': 69.22,
    'GNF': 9315.28,
    'GTQ': 8.45,
    'GYD': 227.83,
    'HKD': 8.47,
    'HNL': 26.89,
    'HRK': 7.53,
    'HTG': 144.42,
    'HUF': 387.07,
    'IDR': 17346.19,
    'ILS': 4.03,
    'IMP': 0.856,
    'INR': 90.53,
    'IQD': 1426.35,
    'IRR': 45933.48,
    'ISK': 150.3,
    'JEP': 0.856,
    'JMD': 168.73,
    'JOD': 0.77,
    'JPY': 169.03,
    'KES': 142.37,
    'KGS': 96.32,
    'KHR': 4450.2,
    'KID': 1.63,
    'KMF': 491.97,
    'KRW': 1471.65,
    'KWD': 0.333,
    'KYD': 0.905,
    'KZT': 482.16,
    'LAK': 23651.1,
    'LBP': 97241.54,
    'LKR': 325.41,
    'LRD': 210.5,
    'LSL': 19.77,
    'LYD': 5.28,
    'MAD': 10.81,
    'MDL': 19.23,
    'MGA': 4770.21,
    'MKD': 61.5,
    'MMK': 2878.52,
    'MNT': 3685.01,
    'MOP': 8.73,
    'MRU': 43.1,
    'MUR': 50.08,
    'MVR': 16.81,
    'MWK': 1896.45,
    'MXN': 18.08,
    'MYR': 5.09,
    'MZN': 69.36,
    'NAD': 19.77,
    'NGN': 1653.9,
    'NIO': 39.99,
    'NOK': 11.62,
    'NPR': 144.86,
    'NZD': 1.77,
    'OMR': 0.418,
    'PAB': 1.09,
    'PEN': 4.06,
    'PGK': 4.17,
    'PHP': 62.58,
    'PKR': 302.97,
    'PLN': 4.26,
    'PYG': 8143.67,
    'QAR': 3.95,
    'RON': 4.98,
    'RSD': 117.11,
    'RUB': 98.82,
    'RWF': 1452.78,
    'SAR': 4.07,
    'SBD': 9.17,
    'SCR': 15.86,
    'SDG': 486.54,
    'SEK': 11.65,
    'SGD': 1.46,
    'SHP': 0.856,
    'SLE': 25.14,
    'SLL': 25137.42,
    'SOS': 622.7,
    'SRD': 35.07,
    'SSP': 1954.64,
    'STN': 24.5,
    'SYP': 13969.79,
    'SZL': 19.77,
    'THB': 39.31,
    'TJS': 11.88,
    'TMT': 3.79,
    'TND': 3.38,
    'TOP': 2.53,
    'TRY': 35.02,
    'TTD': 7.52,
    'TVD': 1.63,
    'TWD': 34.96,
    'TZS': 2818.69,
    'UAH': 42.76,
    'UGX': 4100.94,
    'USD': 1.09,
    'UYU': 41.95,
    'UZS': 13895.12,
    'VES': 39.76,
    'VND': 27696.02,
    'VUV': 129.01,
    'WST': 2.94,
    'XAF': 655.96,
    'XCD': 2.93,
    'XDR': 0.819,
    'XOF': 655.96,
    'XPF': 119.33,
    'YER': 272.33,
    'ZAR': 19.77,
    'ZMW': 27.7,
    'ZWL': 14.91,
  },
};

/// An implementation of [GeoCurrencies] used for live implementation.
class GeoCurrenciesFakeImplementation implements GeoCurrencies {
  final GeoCurrenciesConfig _config;

  /// Constructs a new [GeoCurrenciesFakeImplementation].
  GeoCurrenciesFakeImplementation(this._config);

  @override
  Future<CurrencyData?> getCurrencyDataByCoordinate({
    required double latitude,
    required double longitude,
  }) async {
    return CurrencyData(
      codeIso4217: 'XAF',
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
    required String currencyCodeIso4217,
    Locale locale = const Locale('en', 'US'),
    bool includeSymbol = true,
    String thousandSeparator = ',',
    String symbolSeparator = ' ',
    int decimalDigits = 2,
  }) =>
      formatAmount(
        amount: amount,
        currencyCodeIso4217: currencyCodeIso4217,
        config: _config,
        formatWithSymbol: true,
      );

  @override
  String formatAmountWithCurrencyCode(
          {required num amount, required String currencyCodeIso4217}) =>
      formatAmount(
        amount: amount,
        currencyCodeIso4217: currencyCodeIso4217,
        config: _config,
        formatWithSymbol: false,
      );

  @override
  Future<ConversionData?> convertAmountWithCurrenciesCodes({
    required num amount,
    required String fromCurrencyCodeIso4217,
    required String toCurrencyCodeIso4217,
  }) async {
    return await ExchangeRate.convertAmount(
      amount: amount,
      config: _config,
      fromCurrencyCodeIso4217: fromCurrencyCodeIso4217,
      toCurrencyCodeIso4217: toCurrencyCodeIso4217,
      currencyConversionData:
          CurrencyConversionData.fromJson(_currencyConversionData),
    );
  }

  @override
  AmountConvertedData convertAmountWithRate(
          {required num amount,
          required num rate,
          required String toCurrencyCodeIso4217}) =>
      convertAmount(
          amount: amount,
          config: _config,
          rate: rate,
          toCurrencyCodeIso4217: toCurrencyCodeIso4217);

  @override
  Future<RateData?> getRate({
    required String fromCurrencyCodeIso4217,
    required String toCurrencyCodeIso4217,
  }) async {
    return await ExchangeRate.getRate(
      fromCurrencyCodeIso4217: fromCurrencyCodeIso4217,
      toCurrencyCodeIso4217: toCurrencyCodeIso4217,
      currencyConversionData:
          CurrencyConversionData.fromJson(_currencyConversionData),
    );
  }
}
