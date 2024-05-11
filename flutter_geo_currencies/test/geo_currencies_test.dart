import 'package:flutter_geo_currencies/geo_currencies.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final GeoCurrenciesInterface geoCurrencies =
      GeoCurrenciesInterface(GeoCurrenciesType.fake);
  test('Gets currency data by coordinate.', () async {
    await getCurrencyDataByCoordinate(geoCurrencies);
  });
  test('Formats amount with currency symbol.', () async {
    formatAmountWithCurrencySymbol(geoCurrencies);
  });
}

Future<void> getCurrencyDataByCoordinate(
  GeoCurrenciesInterface geoCurrencies,
) async {
  final response = await geoCurrencies.getCurrencyDataByCoordinate(
    latitude: 4.052851963460176,
    longitude: 9.717363661147893,
  );
  expect(
    response?.codeAlpha3,
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
  GeoCurrenciesInterface geoCurrencies,
) async {
  final response = await geoCurrencies.formatAmountWithCurrencySymbol(
    amount: 10,
    currencyCodeAlpha3: 'XAF',
  );
  expect(
    response,
    'FCFA 10',
  );
}
