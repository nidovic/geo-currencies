# GeoCurrencies
[![pub package](https://img.shields.io/pub/v/geo-curencies.svg)](https://pub.dev/packages/geo-curencies)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![stars](https://img.shields.io/github/stars/nidovic/geo-currencies)

Flutter Package that provides methods for fetching currencies information.
All information about conversion currency are updated once a day.

## Features
* get currency data by coordinate: The library provides methods to get currency data of a given geographic coordinate.
* format amount with currency: The library provides methods to easily format amount with currency symbol.
* convert amount with currency: The library provides methods to easily convert amount the data source are fetched from [EXCHANGE RATE API DOCUMENTATION](https://www.exchangerate-api.com/docs/free).
* Support for multiple languages: The methods accept an optional Locale parameter, which can be used to specify the language. The default language is English.

## Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  geo_currencies: <lastest>
```
## Usage
The GeoCurrencies class is implemented as a interface, with a factory constructor that returns different instance by optional GeoCurrenciesType given, by default the GeoCurrenciesType is live.

For some tests in your code your can do:
```dart
final GeoCurrencies geoCurrencies = GeoCurrencies(
    config: GeoCurrenciesConfig(
        geoCurrenciesType: GeoCurrenciesType.fake,
        decimalDigits: 2,
        decimalSeparator: '.',
        includeSymbol: true,
        symbolSeparator: ' ',
        locale: Locale('En', 'en'),
        thousandSeparator: ','),
  );
```
For live implementation in your code your can do:
```dart
final GeoCurrencies geoCurrencies = GeoCurrencies(
    config: GeoCurrenciesConfig(
        geoCurrenciesType: GeoCurrenciesType.live,
        decimalDigits: 2,
        decimalSeparator: '.',
        includeSymbol: true,
        symbolSeparator: ' ',
        locale: Locale('En', 'en'),
        thousandSeparator: ','),
  );
```

### formatAmountWithCurrencySymbol
```dart
  String amountToDisplay = geoCurrencies.formatAmountWithCurrencySymbol(
    amount: 10,
    currencyCodeAlpha3: 'USD',
  );
```
## Responses

String ($ 10)

### formatAmountWithCurrencySymbol
```dart
  String amountToDisplay = geoCurrencies.formatAmountWithCurrencyCode(
    amount: 10,
    currencyCodeAlpha3: 'USD',
  );
```
## Responses

String (USD 10)

### getCurrencyDataByCoordinate
```dart
  CurrencyData? currencyData = await geoCurrencies.getCurrencyDataByCoordinate(
    latitude: 37.4219999,
    longitude: 32.0840575,
  );
```
## Responses

CurrencyData is a class that represents a currency and its details. It has the following attributes:

| Attribute     | Type   | Description |
|---------------|--------|-------------|
| currencyCodeIso4217     | String | represents the currency code in form iso 4217. |
| name      | String | represents the currency name. |
| countryName      | String    | represents the country where the currency is used. |
| symbol  | String    | represents the symbol of the currency. |

### convertAmountWithCurrenciesCodes
```dart
  Future<ConversionData?> convertAmountWithCurrenciesCodes({
    required num amount,
    required String fromCurrencyCodeIso4217,
    required String toCurrencyCodeIso4217,
  });
```
## Responses

ConversionData is a class that represents a conversion data and its details. It has the following attributes:

| Attribute     | Type   | Description |
|---------------|--------|-------------|
| baseAmount     | num | represents the amount to convert. |
| succeeded      | bool | wether the conversion is succeed. |
| amountConverted      | num    | represents the amount converted. |
| formattedAmountConverted  | String    | represents the format amount converted. |
| toCurrencyCodeIso4217  | String    | represents the currency code iso 4217 to which we must convert. |
| fromCurrencyCodeIso4217  | String    | represents the currency code iso 4217 from which to convert. |
| rate  | num    | represents the rate use for conversion. |
| currencyConversionData  | CurrencyConversionData    | represents the currency conversion data. |

### getRate
```dart
  Future<RateData?> getRate({
    required String fromCurrencyCodeIso4217,
    required String toCurrencyCodeIso4217,
  });
```
## Responses

RateData is a class that represents a rate data and its details. It has the following attributes:

| Attribute     | Type   | Description |
|---------------|--------|-------------|
| succeeded      | bool | wether the conversion is succeed. |
| formattedAmountConvertedWithCurrencyCode  | String    | represents the formatted amount converted with currency code. |
| formattedAmountConvertedWithCurrencySymbol  | String    | represents the formatted amount converted with currency symbol. |
| toCurrencyCodeIso4217  | String    | represents the currency code iso 4217 to which we must convert. |
| fromCurrencyCodeIso4217  | String    | represents the currency code iso 4217 from which to convert. |
| rate  | num    | represents the rate fetches. |
| currencyConversionData  | CurrencyConversionData    | represents the currency conversion data. |

### getRate
```dart
  AmountConvertedData convertAmountWithRate({
    required num amount,
    required num rate,
    required String toCurrencyCodeIso4217,
  });
```
## Responses

AmountConvertedData is a class that represents a amount converted data and its details. It has the following attributes:

| Attribute     | Type   | Description |
|---------------|--------|-------------|
| formattedAmountConvertedWithCurrencyCode  | String    | represents the formatted amount converted with currency code. |
| formattedAmountConvertedWithCurrencySymbol  | String    | represents the formatted amount converted with currency symbol. |
| toCurrencyCodeIso4217  | String    | represents the currency code iso 4217 to which we must convert. |
| baseAmount  | num    | represents the base amount. |
| amountConverted  | num    | represents the amount converted. |
| rate  | num    | represents the rate fetches. |

## Dependencies
```yaml
http: ^1.1.0
intl: ^0.19.1
logging: ^1.0.2
```

## Additional information
the library uses the following APIs:
* [EXCHANGE RATE API DOCUMENTATION](https://www.exchangerate-api.com/docs/free)
* [EXCHANGE RATE API TERMS](https://www.exchangerate-api.com/terms)
* [WIKIPEDIA ISO 4217](https://en.wikipedia.org/wiki/ISO_4217)
