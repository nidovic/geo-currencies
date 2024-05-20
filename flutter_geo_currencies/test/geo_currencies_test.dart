import 'package:flutter_test/flutter_test.dart';
import 'package:geo_currencies/geo_currencies.dart';

void main() {
  final GeoCurrencies geoCurrencies = GeoCurrencies(
    config: GeoCurrenciesConfig(geoCurrenciesType: GeoCurrenciesType.fake),
  );
  test('Gets currency data by coordinates.', () async {
    await getCurrencyDataByCoordinate(geoCurrencies);
  });
  test('Formats amount with currency symbol.', () {
    formatAmountWithCurrencySymbol(geoCurrencies);
  });
  test('Formats amount with currency code.', () {
    formatAmountWithCurrencyCode(geoCurrencies);
  });
  test('Converts amount with currency code.', () async {
    convertAmountWithCurrenciesCodes(geoCurrencies);
  });
  test('Gets rate.', () async {
    getRate(geoCurrencies);
  });
  test('Converts amount with rate.', () {
    convertAmountWithRate(geoCurrencies);
  });
}

Future<void> getCurrencyDataByCoordinate(
  GeoCurrencies geoCurrencies,
) async {
  final response = await geoCurrencies.getCurrencyDataByCoordinate(
    latitude: 4.052851963460176,
    longitude: 9.717363661147893,
  );
  expect(
    response?.codeIso4217,
    'XAF',
  );
  expect(
    response?.countryName,
    'Cameroon',
  );
  expect(
    response?.name,
    'Central African CFA Franc',
  );
  expect(
    response?.symbol,
    'FCFA',
  );
}

void formatAmountWithCurrencySymbol(
  GeoCurrencies geoCurrencies,
) {
  final response = geoCurrencies.formatAmountWithCurrencySymbol(
    amount: 10,
    currencyCodeIso4217: 'XAF',
  );
  expect(
    response,
    'FCFA 10.00',
  );
}

void formatAmountWithCurrencyCode(
  GeoCurrencies geoCurrencies,
) {
  final response = geoCurrencies.formatAmountWithCurrencyCode(
    amount: 10,
    currencyCodeIso4217: 'XAF',
  );
  expect(
    response,
    'XAF 10.00',
  );
}

void convertAmountWithCurrenciesCodes(
  GeoCurrencies geoCurrencies,
) async {
  final response = await geoCurrencies.convertAmountWithCurrenciesCodes(
    amount: 10,
    fromCurrencyCodeIso4217: 'EUR',
    toCurrencyCodeIso4217: 'XAF',
  );
  expect(
    response?.succeeded,
    true,
  );
  expect(
    response?.baseAmount,
    10,
  );
  expect(
    response?.formattedAmountConvertedWithCurrencySymbol,
    'FCFA 6,559.60',
  );
  expect(
    response?.formattedAmountConvertedWithCurrencyCode,
    'XAF 6,559.60',
  );
  expect(
    response?.fromCurrencyCodeIso4217,
    'EUR',
  );
}

void getRate(
  GeoCurrencies geoCurrencies,
) async {
  final response = await geoCurrencies.getRate(
    fromCurrencyCodeIso4217: 'EUR',
    toCurrencyCodeIso4217: 'XAF',
  );
  expect(
    response?.succeeded,
    true,
  );
  expect(
    response?.fromCurrencyCodeIso4217,
    'EUR',
  );
  expect(
    response?.rate,
    655.96,
  );
}

void convertAmountWithRate(
  GeoCurrencies geoCurrencies,
) {
  final response = geoCurrencies.convertAmountWithRate(
    amount: 10,
    rate: 23,
    toCurrencyCodeIso4217: 'XAF',
  );
  expect(
    response.baseAmount,
    10,
  );
  expect(
    response.amountConverted,
    230,
  );
  expect(response.formattedAmountConvertedWithCurrencySymbol, 'FCFA 230.00');
  expect(response.formattedAmountConvertedWithCurrencyCode, 'XAF 230.00');
}
