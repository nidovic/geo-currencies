# GeoCurrencies
[![pub package](https://img.shields.io/pub/v/geo-curencies.svg)](https://pub.dev/packages/geo-curencies)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![stars](https://img.shields.io/github/stars/nidovic/geo-currencies)

Flutter Package that provides methods for fetching currencies information.

## Features
* get currency data by coordinate: The library provides methods to get currency data of a given geographic coordinate.
* format amount with currency: The library provides methods to easily format amount with currency symbol.
* Address suggestions: The library provides methods to get address suggestions for a given address.
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
GeoCurrencies geoCurrencies = GeoCurrencies(GeoCurrenciesType.fake);
```
For live implementation in your code your can do:
```dart
GeoCurrencies geoCurrencies = GeoCurrencies(GeoCurrenciesType.live);
```
Or
```dart
GeoCurrencies geoCurrencies = GeoCurrencies();
```

### getCurrencyDataByCoordinate
```dart
  CurrencyData? currencyData = await geoCurrencies.getCurrencyDataByCoordinate(
    latitude: 37.4219999,
    longitude: 32.0840575,
  );
```
## Responses

CurrencyData is a class that represents a currency and its details. It has the following attributes:

### formatAmountWithCurrencySymbol
```dart
  String amountToDisplay = geoCurrencies.formatAmountWithCurrencySymbol(
    amount: 10,
    currencyCodeAlpha3: 'USD',
    locale: const Locale('en','US')
  );
```
## Responses

CurrencyData is a class that represents a currency and its details. It has the following attributes:

| Attribute     | Type   | Description |
|---------------|--------|-------------|
| codeAlpha3     | String | represents the currency code in form alpha 3. |
| name      | String | represents the currency name. |
| countryName      | String    | represents the country where the currency is used. |
| symbol  | String    | represents the symbol of the currency. |

## Dependencies
```yaml
http: ^1.1.0
intl: ^0.19.1
logging: ^1.0.2
```
