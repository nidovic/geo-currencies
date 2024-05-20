## 0.0.1

- this initial release contain only function getCurrencyDataByCoordinate used for retrieves currency data for a specific location specified by [latitude] and [longitude].

## 0.0.2

- We add function formatAmountWithCurrencySymbol and formatAmountWithCurrencyCode the both format the given [amount] with the currency (symbol or code) of [currencyCodeIso4217] into a readable string.

## 0.0.3

- We add function convertAmountWithCurrenciesCodes ( that converts the given [amount] from [fromCurrencyCodeIso4217] to [toCurrencyCodeIso4217] using currency codes).

## 0.0.4

- We add functions getRate ( that retrieves the conversion rate between [fromCurrencyCodeIso4217] and [toCurrencyCodeIso4217]) and convertAmountWithRate (that converts the given [amount] using the [rate] to [toCurrencyCodeIso4217]).
