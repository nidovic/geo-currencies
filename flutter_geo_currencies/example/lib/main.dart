import 'package:flutter/material.dart';
import 'package:geo_currencies/geo_currencies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geo Currencies Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Geo Currencies Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final GeoCurrencies geoCurrencies = GeoCurrencies(
      config: GeoCurrenciesConfig(
          geoCurrenciesType: GeoCurrenciesType.live,
          decimalDigits: 2,
          decimalSeparator: '.',
          includeSymbol: true,
          symbolSeparator: ' ',
          locale: const Locale('En', 'en'),
          thousandSeparator: ','),
    );
    const TextStyle style1 = TextStyle(
        color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold);
    final convertAmountWithRate = geoCurrencies.convertAmountWithRate(
      amount: 10,
      rate: 0.23,
      toCurrencyCodeIso4217: 'XAF',
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Formats amount with currency symbol',
                style: style1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                geoCurrencies.formatAmountWithCurrencySymbol(
                  amount: 10,
                  currencyCodeIso4217: 'XAF',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Formats amount with currency code',
                style: style1,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                geoCurrencies.formatAmountWithCurrencyCode(
                  amount: 1000,
                  currencyCodeIso4217: 'XAF',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Converts amount with rate',
                style: style1,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    'amountConverted: ${convertAmountWithRate.amountConverted}',
                  ),
                  Text(
                    'baseAmount: ${convertAmountWithRate.baseAmount}',
                  ),
                  Text(
                    'rate: ${convertAmountWithRate.rate}',
                  ),
                  Text(
                    'formattedAmountConvertedWithCurrencyCode: ${convertAmountWithRate.formattedAmountConvertedWithCurrencyCode}',
                  ),
                  Text(
                    'formattedAmountConvertedWithCurrencySymbol: ${convertAmountWithRate.formattedAmountConvertedWithCurrencySymbol}',
                  ),
                  Text(
                    'toCurrencyCodeIso4217: ${convertAmountWithRate.toCurrencyCodeIso4217}',
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Gets currency data by coordinate.',
                style: style1,
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<CurrencyData?>(
                  future: geoCurrencies.getCurrencyDataByCoordinate(
                    latitude: 4.052851963460176,
                    longitude: 9.717363661147893,
                  ),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        Text(
                          'names: ${snapshot.data?.name}',
                        ),
                        Text(
                          'countryName: ${snapshot.data?.countryName}',
                        ),
                        Text(
                          'symbol: ${snapshot.data?.symbol}',
                        ),
                        Text(
                          'codeIso4217: ${snapshot.data?.codeIso4217}',
                        ),
                      ],
                    );
                  }),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Converts amount with currencies codes.',
                style: style1,
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<ConversionData?>(
                  future: geoCurrencies.convertAmountWithCurrenciesCodes(
                    amount: 10,
                    fromCurrencyCodeIso4217: 'EUR',
                    toCurrencyCodeIso4217: 'XAF',
                  ),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        Text(
                          'amountConverted: ${snapshot.data?.amountConverted}',
                        ),
                        Text(
                          'baseAmount: ${snapshot.data?.baseAmount}',
                        ),
                        Text(
                          'formattedAmountConvertedWithCurrencyCode: ${snapshot.data?.formattedAmountConvertedWithCurrencyCode}', //
                        ),
                        Text(
                          'formattedAmountConvertedWithCurrencySymbol: ${snapshot.data?.formattedAmountConvertedWithCurrencySymbol}', //
                        ),
                        Text(
                          'toCurrencyCodeIso4217: ${snapshot.data?.toCurrencyCodeIso4217}',
                        ),
                      ],
                    );
                  }),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Gets rate.',
                style: style1,
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<RateData?>(
                  future: geoCurrencies.getRate(
                    fromCurrencyCodeIso4217: 'EUR',
                    toCurrencyCodeIso4217: 'XAF',
                  ),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        Text(
                          'fromCurrencyCodeIso4217: ${snapshot.data?.fromCurrencyCodeIso4217}',
                        ),
                        Text(
                          'rate: ${snapshot.data?.rate}',
                        ),
                        Text(
                          'toCurrencyCodeIso4217: ${snapshot.data?.toCurrencyCodeIso4217}',
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
