import 'package:flutter_test/flutter_test.dart';
import 'package:geo_currencies/geo_currencies.dart';

void main() {
  final GeoCurrencies geoCurrencies = GeoCurrencies(
    config: GeoCurrenciesConfig(geoCurrenciesType: GeoCurrenciesType.fake),
  );
  test('Gets currency data by coordinate.', () async {
    await getCurrencyDataByCoordinate(geoCurrencies);
  });
  test('Formats amount with currency symbol.', () async {
    formatAmountWithCurrencySymbol(geoCurrencies);
  });
  test('Converts amount.', () async {
    convertAmount(geoCurrencies);
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
) async {
  final response = await geoCurrencies.formatAmountWithCurrencySymbol(
    amount: 10,
    currencyCodeIso4217: 'XAF',
  );
  expect(
    response,
    'FCFA 10.00',
  );
}

void convertAmount(
  GeoCurrencies geoCurrencies,
) async {
  final response = await geoCurrencies.convertAmount(
    amount: 10,
    fromCurrencyCodeIso4217: 'EUR',
    toCurrencyCodeIso4217: 'XAF',
  );
  expect(
    response?.succeeded,
    false,
  );
  expect(
    response?.baseAmount,
    10,
  );
  expect(
    response?.formatAmountConverted,
    'FCFA 6,559.60',
  );
  expect(
    response?.fromCurrencyCodeIso4217,
    'EUR',
  );
}
