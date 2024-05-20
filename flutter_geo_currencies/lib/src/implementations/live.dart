import 'package:intl/intl.dart';

import '../../geo_currencies.dart';
import '../services/exchange_rate.dart';
import '../services/open_street_map.dart';
import 'common/functions.dart';

/// Represents country code associated with his information.
const Map<String, Map<String, String>> _countryCurrencyData = {
  'AF': {
    'codeAlpha3': 'AFN',
    'name': 'Afghan Afghani',
    'countryName': 'Afghanistan',
  },
  'AL': {
    'codeAlpha3': 'ALL',
    'name': 'Albanian Lek',
    'countryName': 'Albania',
  },
  'DZ': {
    'codeAlpha3': 'DZD',
    'name': 'Algerian Dinar',
    'countryName': 'Algeria',
  },
  'AD': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Andorra',
  },
  'AO': {
    'codeAlpha3': 'AOA',
    'name': 'Angolan Kwanza',
    'countryName': 'Angola',
  },
  'AG': {
    'codeAlpha3': 'XCD',
    'name': 'East Caribbean Dollar',
    'countryName': 'Antigua and Barbuda',
  },
  'AR': {
    'codeAlpha3': 'ARS',
    'name': 'Argentine Peso',
    'countryName': 'Argentina',
  },
  'AM': {
    'codeAlpha3': 'AMD',
    'name': 'Armenian Dram',
    'countryName': 'Armenia',
  },
  'AU': {
    'codeAlpha3': 'AUD',
    'name': 'Australian Dollar',
    'countryName': 'Australia',
  },
  'AT': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Austria',
  },
  'AZ': {
    'codeAlpha3': 'AZN',
    'name': 'Azerbaijani Manat',
    'countryName': 'Azerbaijan',
  },
  'BS': {
    'codeAlpha3': 'BSD',
    'name': 'Bahamian Dollar',
    'countryName': 'Bahamas',
  },
  'BH': {
    'codeAlpha3': 'BHD',
    'name': 'Bahraini Dinar',
    'countryName': 'Bahrain',
  },
  'BD': {
    'codeAlpha3': 'BDT',
    'name': 'Bangladeshi Taka',
    'countryName': 'Bangladesh',
  },
  'BB': {
    'codeAlpha3': 'BBD',
    'name': 'Barbadian Dollar',
    'countryName': 'Barbados',
  },
  'BY': {
    'codeAlpha3': 'BYN',
    'name': 'Belarusian Ruble',
    'countryName': 'Belarus',
  },
  'BE': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Belgium',
  },
  'BZ': {
    'codeAlpha3': 'BZD',
    'name': 'Belize Dollar',
    'countryName': 'Belize',
  },
  'BJ': {
    'codeAlpha3': 'XOF',
    'name': 'West African CFA Franc',
    'countryName': 'Benin',
  },
  'BT': {
    'codeAlpha3': 'BTN',
    'name': 'Bhutanese Ngultrum',
    'countryName': 'Bhutan',
  },
  'BO': {
    'codeAlpha3': 'BOB',
    'name': 'Bolivian Boliviano',
    'countryName': 'Bolivia',
  },
  'BA': {
    'codeAlpha3': 'BAM',
    'name': 'Bosnia and Herzegovina Convertible Mark',
    'countryName': 'Bosnia and Herzegovina',
  },
  'BW': {
    'codeAlpha3': 'BWP',
    'name': 'Botswana Pula',
    'countryName': 'Botswana',
  },
  'BR': {
    'codeAlpha3': 'BRL',
    'name': 'Brazilian Real',
    'countryName': 'Brazil',
  },
  'BN': {
    'codeAlpha3': 'BND',
    'name': 'Brunei Dollar',
    'countryName': 'Brunei',
  },
  'BG': {
    'codeAlpha3': 'BGN',
    'name': 'Bulgarian Lev',
    'countryName': 'Bulgaria',
  },
  'BF': {
    'codeAlpha3': 'XOF',
    'name': 'West African CFA Franc',
    'countryName': 'Burkina Faso',
  },
  'BI': {
    'codeAlpha3': 'BIF',
    'name': 'Burundian Franc',
    'countryName': 'Burundi',
  },
  'KH': {
    'codeAlpha3': 'KHR',
    'name': 'Cambodian Riel',
    'countryName': 'Cambodia',
  },
  'CM': {
    'codeAlpha3': 'XAF',
    'name': 'Central African CFA Franc',
    'countryName': 'Cameroon',
  },
  'CA': {
    'codeAlpha3': 'CAD',
    'name': 'Canadian Dollar',
    'countryName': 'Canada',
  },
  'CV': {
    'codeAlpha3': 'CVE',
    'name': 'Cape Verdean Escudo',
    'countryName': 'Cape Verde',
  },
  'CF': {
    'codeAlpha3': 'XAF',
    'name': 'Central African CFA Franc',
    'countryName': 'Central African Republic',
  },
  'TD': {
    'codeAlpha3': 'XAF',
    'name': 'Central African CFA Franc',
    'countryName': 'Chad',
  },
  'CL': {
    'codeAlpha3': 'CLP',
    'name': 'Chilean Peso',
    'countryName': 'Chile',
  },
  'CN': {
    'codeAlpha3': 'CNY',
    'name': 'Chinese Yuan',
    'countryName': 'China',
  },
  'CO': {
    'codeAlpha3': 'COP',
    'name': 'Colombian Peso',
    'countryName': 'Colombia',
  },
  'KM': {
    'codeAlpha3': 'KMF',
    'name': 'Comorian Franc',
    'countryName': 'Comoros',
  },
  'CG': {
    'codeAlpha3': 'XAF',
    'name': 'Central African CFA Franc',
    'countryName': 'Congo',
  },
  'CD': {
    'codeAlpha3': 'CDF',
    'name': 'Congolese Franc',
    'countryName': 'Democratic Republic of the Congo',
  },
  'CR': {
    'codeAlpha3': 'CRC',
    'name': 'Costa Rican Colon',
    'countryName': 'Costa Rica',
  },
  'HR': {
    'codeAlpha3': 'HRK',
    'name': 'Croatian Kuna',
    'countryName': 'Croatia',
  },
  'CU': {
    'codeAlpha3': 'CUC',
    'name': 'Cuban Convertible Peso',
    'countryName': 'Cuba',
  },
  'CY': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Cyprus',
  },
  'CZ': {
    'codeAlpha3': 'CZK',
    'name': 'Czech Koruna',
    'countryName': 'Czech Republic',
  },
  'DK': {
    'codeAlpha3': 'DKK',
    'name': 'Danish Krone',
    'countryName': 'Denmark',
  },
  'DJ': {
    'codeAlpha3': 'DJF',
    'name': 'Djiboutian Franc',
    'countryName': 'Djibouti',
  },
  'DM': {
    'codeAlpha3': 'XCD',
    'name': 'East Caribbean Dollar',
    'countryName': 'Dominica',
  },
  'DO': {
    'codeAlpha3': 'DOP',
    'name': 'Dominican Peso',
    'countryName': 'Dominican Republic',
  },
  'TL': {
    'codeAlpha3': 'USD',
    'name': 'United States Dollar',
    'countryName': 'East Timor',
  },
  'EC': {
    'codeAlpha3': 'USD',
    'name': 'United States Dollar',
    'countryName': 'Ecuador',
  },
  'EG': {
    'codeAlpha3': 'EGP',
    'name': 'Egyptian Pound',
    'countryName': 'Egypt',
  },
  'SV': {
    'codeAlpha3': 'USD',
    'name': 'United States Dollar',
    'countryName': 'El Salvador',
  },
  'GQ': {
    'codeAlpha3': 'XAF',
    'name': 'Central African CFA Franc',
    'countryName': 'Equatorial Guinea',
  },
  'ER': {
    'codeAlpha3': 'ERN',
    'name': 'Eritrean Nakfa',
    'countryName': 'Eritrea',
  },
  'EE': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Estonia',
  },
  'ET': {
    'codeAlpha3': 'ETB',
    'name': 'Ethiopian Birr',
    'countryName': 'Ethiopia',
  },
  'FJ': {
    'codeAlpha3': 'FJD',
    'name': 'Fijian Dollar',
    'countryName': 'Fiji',
  },
  'FI': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Finland',
  },
  'FR': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'France',
  },
  'GA': {
    'codeAlpha3': 'XAF',
    'name': 'Central African CFA Franc',
    'countryName': 'Gabon',
  },
  'GM': {
    'codeAlpha3': 'GMD',
    'name': 'Gambian Dalasi',
    'countryName': 'Gambia',
  },
  'GE': {
    'codeAlpha3': 'GEL',
    'name': 'Georgian Lari',
    'countryName': 'Georgia',
  },
  'DE': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Germany',
  },
  'GH': {
    'codeAlpha3': 'GHS',
    'name': 'Ghanaian Cedi',
    'countryName': 'Ghana',
  },
  'GR': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Greece',
  },
  'GD': {
    'codeAlpha3': 'XCD',
    'name': 'East Caribbean Dollar',
    'countryName': 'Grenada',
  },
  'GT': {
    'codeAlpha3': 'GTQ',
    'name': 'Guatemalan Quetzal',
    'countryName': 'Guatemala',
  },
  'GN': {
    'codeAlpha3': 'GNF',
    'name': 'Guinean Franc',
    'countryName': 'Guinea',
  },
  'GW': {
    'codeAlpha3': 'XOF',
    'name': 'West African CFA Franc',
    'countryName': 'Guinea-Bissau',
  },
  'GY': {
    'codeAlpha3': 'GYD',
    'name': 'Guyanese Dollar',
    'countryName': 'Guyana',
  },
  'HT': {
    'codeAlpha3': 'HTG',
    'name': 'Haitian Gourde',
    'countryName': 'Haiti',
  },
  'HN': {
    'codeAlpha3': 'HNL',
    'name': 'Honduran Lempira',
    'countryName': 'Honduras',
  },
  'HU': {
    'codeAlpha3': 'HUF',
    'name': 'Hungarian Forint',
    'countryName': 'Hungary',
  },
  'IS': {
    'codeAlpha3': 'ISK',
    'name': 'Icelandic Krona',
    'countryName': 'Iceland',
  },
  'IN': {
    'codeAlpha3': 'INR',
    'name': 'Indian Rupee',
    'countryName': 'India',
  },
  'ID': {
    'codeAlpha3': 'IDR',
    'name': 'Indonesian Rupiah',
    'countryName': 'Indonesia',
  },
  'IR': {
    'codeAlpha3': 'IRR',
    'name': 'Iranian Rial',
    'countryName': 'Iran',
  },
  'IQ': {
    'codeAlpha3': 'IQD',
    'name': 'Iraqi Dinar',
    'countryName': 'Iraq',
  },
  'IE': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Ireland',
  },
  'IL': {
    'codeAlpha3': 'ILS',
    'name': 'Israeli Shekel',
    'countryName': 'Israel',
  },
  'IT': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Italy',
  },
  'CI': {
    'codeAlpha3': 'XOF',
    'name': 'West African CFA Franc',
    'countryName': 'Ivory Coast',
  },
  'JM': {
    'codeAlpha3': 'JMD',
    'name': 'Jamaican Dollar',
    'countryName': 'Jamaica',
  },
  'JP': {
    'codeAlpha3': 'JPY',
    'name': 'Japanese Yen',
    'countryName': 'Japan',
  },
  'JO': {
    'codeAlpha3': 'JOD',
    'name': 'Jordanian Dinar',
    'countryName': 'Jordan',
  },
  'KZ': {
    'codeAlpha3': 'KZT',
    'name': 'Kazakhstani Tenge',
    'countryName': 'Kazakhstan',
  },
  'KE': {
    'codeAlpha3': 'KES',
    'name': 'Kenyan Shilling',
    'countryName': 'Kenya',
  },
  'KI': {
    'codeAlpha3': 'AUD',
    'name': 'Australian Dollar',
    'countryName': 'Kiribati',
  },
  'KW': {
    'codeAlpha3': 'KWD',
    'name': 'Kuwaiti Dinar',
    'countryName': 'Kuwait',
  },
  'KG': {
    'codeAlpha3': 'KGS',
    'name': 'Kyrgyzstani Som',
    'countryName': 'Kyrgyzstan',
  },
  'LA': {
    'codeAlpha3': 'LAK',
    'name': 'Lao Kip',
    'countryName': 'Laos',
  },
  'LV': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Latvia',
  },
  'LB': {
    'codeAlpha3': 'LBP',
    'name': 'Lebanese Pound',
    'countryName': 'Lebanon',
  },
  'LS': {
    'codeAlpha3': 'LSL',
    'name': 'Lesotho Loti',
    'countryName': 'Lesotho',
  },
  'LR': {
    'codeAlpha3': 'LRD',
    'name': 'Liberian Dollar',
    'countryName': 'Liberia',
  },
  'LY': {
    'codeAlpha3': 'LYD',
    'name': 'Libyan Dinar',
    'countryName': 'Libya',
  },
  'LI': {
    'codeAlpha3': 'CHF',
    'name': 'Swiss Franc',
    'countryName': 'Liechtenstein',
  },
  'LT': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Lithuania',
  },
  'LU': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Luxembourg',
  },
  'MG': {
    'codeAlpha3': 'MGA',
    'name': 'Malagasy Ariary',
    'countryName': 'Madagascar',
  },
  'MW': {
    'codeAlpha3': 'MWK',
    'name': 'Malawian Kwacha',
    'countryName': 'Malawi',
  },
  'MY': {
    'codeAlpha3': 'MYR',
    'name': 'Malaysian Ringgit',
    'countryName': 'Malaysia',
  },
  'MV': {
    'codeAlpha3': 'MVR',
    'name': 'Maldivian Rufiyaa',
    'countryName': 'Maldives',
  },
  'ML': {
    'codeAlpha3': 'XOF',
    'name': 'West African CFA Franc',
    'countryName': 'Mali',
  },
  'MT': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Malta',
  },
  'MH': {
    'codeAlpha3': 'USD',
    'name': 'United States Dollar',
    'countryName': 'Marshall Islands',
  },
  'MR': {
    'codeAlpha3': 'MRO',
    'name': 'Mauritanian Ouguiya',
    'countryName': 'Mauritania',
  },
  'MU': {
    'codeAlpha3': 'MUR',
    'name': 'Mauritian Rupee',
    'countryName': 'Mauritius',
  },
  'MX': {
    'codeAlpha3': 'MXN',
    'name': 'Mexican Peso',
    'countryName': 'Mexico',
  },
  'FM': {
    'codeAlpha3': 'USD',
    'name': 'United States Dollar',
    'countryName': 'Micronesia',
  },
  'MD': {
    'codeAlpha3': 'MDL',
    'name': 'Moldovan Leu',
    'countryName': 'Moldova',
  },
  'MC': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Monaco',
  },
  'MN': {
    'codeAlpha3': 'MNT',
    'name': 'Mongolian Tugrik',
    'countryName': 'Mongolia',
  },
  'ME': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Montenegro',
  },
  'MA': {
    'codeAlpha3': 'MAD',
    'name': 'Moroccan Dirham',
    'countryName': 'Morocco',
  },
  'MZ': {
    'codeAlpha3': 'MZN',
    'name': 'Mozambican Metical',
    'countryName': 'Mozambique',
  },
  'MM': {
    'codeAlpha3': 'MMK',
    'name': 'Myanmar Kyat',
    'countryName': 'Myanmar (Burma)',
  },
  'NA': {
    'codeAlpha3': 'NAD',
    'name': 'Namibian Dollar',
    'countryName': 'Namibia',
  },
  'NR': {
    'codeAlpha3': 'AUD',
    'name': 'Australian Dollar',
    'countryName': 'Nauru',
  },
  'NP': {
    'codeAlpha3': 'NPR',
    'name': 'Nepalese Rupee',
    'countryName': 'Nepal',
  },
  'NL': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Netherlands',
  },
  'NZ': {
    'codeAlpha3': 'NZD',
    'name': 'New Zealand Dollar',
    'countryName': 'New Zealand',
  },
  'NI': {
    'codeAlpha3': 'NIO',
    'name': 'Nicaraguan Cordoba',
    'countryName': 'Nicaragua',
  },
  'NE': {
    'codeAlpha3': 'XOF',
    'name': 'West African CFA Franc',
    'countryName': 'Niger',
  },
  'NG': {
    'codeAlpha3': 'NGN',
    'name': 'Nigerian Naira',
    'countryName': 'Nigeria',
  },
  'KP': {
    'codeAlpha3': 'KPW',
    'name': 'North Korean Won',
    'countryName': 'North Korea',
  },
  'MK': {
    'codeAlpha3': 'MKD',
    'name': 'Macedonian Denar',
    'countryName': 'North Macedonia (formerly Macedonia)',
  },
  'NO': {
    'codeAlpha3': 'NOK',
    'name': 'Norwegian Krone',
    'countryName': 'Norway',
  },
  'OM': {
    'codeAlpha3': 'OMR',
    'name': 'Omani Rial',
    'countryName': 'Oman',
  },
  'PK': {
    'codeAlpha3': 'PKR',
    'name': 'Pakistani Rupee',
    'countryName': 'Pakistan',
  },
  'PW': {
    'codeAlpha3': 'USD',
    'name': 'United States Dollar',
    'countryName': 'Palau',
  },
  'PA': {
    'codeAlpha3': 'PAB',
    'name': 'Panamanian Balboa',
    'countryName': 'Panama',
  },
  'PG': {
    'codeAlpha3': 'PGK',
    'name': 'Papua New Guinean Kina',
    'countryName': 'Papua New Guinea',
  },
  'PY': {
    'codeAlpha3': 'PYG',
    'name': 'Paraguayan Guarani',
    'countryName': 'Paraguay',
  },
  'PE': {
    'codeAlpha3': 'PEN',
    'name': 'Peruvian Sol',
    'countryName': 'Peru',
  },
  'PH': {
    'codeAlpha3': 'PHP',
    'name': 'Philippine Peso',
    'countryName': 'Philippines',
  },
  'PL': {
    'codeAlpha3': 'PLN',
    'name': 'Polish Zloty',
    'countryName': 'Poland',
  },
  'PT': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Portugal',
  },
  'QA': {
    'codeAlpha3': 'QAR',
    'name': 'Qatari Riyal',
    'countryName': 'Qatar',
  },
  'XK': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Republic of Kosovo',
  },
  'RO': {
    'codeAlpha3': 'RON',
    'name': 'Romanian Leu',
    'countryName': 'Romania',
  },
  'RU': {
    'codeAlpha3': 'RUB',
    'name': 'Russian Ruble',
    'countryName': 'Russia',
  },
  'RW': {
    'codeAlpha3': 'RWF',
    'name': 'Rwandan Franc',
    'countryName': 'Rwanda',
  },
  'KN': {
    'codeAlpha3': 'XCD',
    'name': 'East Caribbean Dollar',
    'countryName': 'Saint Kitts and Nevis',
  },
  'LC': {
    'codeAlpha3': 'XCD',
    'name': 'East Caribbean Dollar',
    'countryName': 'Saint Lucia',
  },
  'VC': {
    'codeAlpha3': 'XCD',
    'name': 'East Caribbean Dollar',
    'countryName': 'Saint Vincent and the Grenadines',
  },
  'WS': {
    'codeAlpha3': 'WST',
    'name': 'Samoan Tala',
    'countryName': 'Samoa',
  },
  'SM': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'San Marino',
  },
  'ST': {
    'codeAlpha3': 'STN',
    'name': 'São Tomé and Príncipe Dobra',
    'countryName': 'São Tomé and Príncipe',
  },
  'SA': {
    'codeAlpha3': 'SAR',
    'name': 'Saudi Riyal',
    'countryName': 'Saudi Arabia',
  },
  'SN': {
    'codeAlpha3': 'XOF',
    'name': 'West African CFA Franc',
    'countryName': 'Senegal',
  },
  'RS': {
    'codeAlpha3': 'RSD',
    'name': 'Serbian Dinar',
    'countryName': 'Serbia',
  },
  'SC': {
    'codeAlpha3': 'SCR',
    'name': 'Seychellois Rupee',
    'countryName': 'Seychelles',
  },
  'SL': {
    'codeAlpha3': 'SLL',
    'name': 'Sierra Leonean Leone',
    'countryName': 'Sierra Leone',
  },
  'SG': {
    'codeAlpha3': 'SGD',
    'name': 'Singapore Dollar',
    'countryName': 'Singapore',
  },
  'SK': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Slovakia',
  },
  'SI': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Slovenia',
  },
  'SB': {
    'codeAlpha3': 'SBD',
    'name': 'Solomon Islands Dollar',
    'countryName': 'Solomon Islands',
  },
  'SO': {
    'codeAlpha3': 'SOS',
    'name': 'Somali Shilling',
    'countryName': 'Somalia',
  },
  'ZA': {
    'codeAlpha3': 'ZAR',
    'name': 'South African Rand',
    'countryName': 'South Africa',
  },
  'KR': {
    'codeAlpha3': 'KRW',
    'name': 'South Korean Won',
    'countryName': 'South Korea',
  },
  'SS': {
    'codeAlpha3': 'SSP',
    'name': 'South Sudanese Pound',
    'countryName': 'South Sudan',
  },
  'ES': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Spain',
  },
  'LK': {
    'codeAlpha3': 'LKR',
    'name': 'Sri Lankan Rupee',
    'countryName': 'Sri Lanka',
  },
  'SD': {
    'codeAlpha3': 'SDG',
    'name': 'Sudanese Pound',
    'countryName': 'Sudan',
  },
  'SR': {
    'codeAlpha3': 'SRD',
    'name': 'Surinamese Dollar',
    'countryName': 'Suriname',
  },
  'SZ': {
    'codeAlpha3': 'SZL',
    'name': 'Swazi Lilangeni',
    'countryName': 'Eswatini (formerly Swaziland)',
  },
  'SE': {
    'codeAlpha3': 'SEK',
    'name': 'Swedish Krona',
    'countryName': 'Sweden',
  },
  'CH': {
    'codeAlpha3': 'CHF',
    'name': 'Swiss Franc',
    'countryName': 'Switzerland',
  },
  'SY': {
    'codeAlpha3': 'SYP',
    'name': 'Syrian Pound',
    'countryName': 'Syria',
  },
  'TW': {
    'codeAlpha3': 'TWD',
    'name': 'New Taiwan Dollar',
    'countryName': 'Taiwan',
  },
  'TJ': {
    'codeAlpha3': 'TJS',
    'name': 'Tajikistani Somoni',
    'countryName': 'Tajikistan',
  },
  'TZ': {
    'codeAlpha3': 'TZS',
    'name': 'Tanzanian Shilling',
    'countryName': 'Tanzania',
  },
  'TH': {
    'codeAlpha3': 'THB',
    'name': 'Thai Baht',
    'countryName': 'Thailand',
  },
  'TG': {
    'codeAlpha3': 'XOF',
    'name': 'West African CFA Franc',
    'countryName': 'Togo',
  },
  'TO': {
    'codeAlpha3': 'TOP',
    'name': "Tongan Pa'anga",
    'countryName': 'Tonga',
  },
  'TT': {
    'codeAlpha3': 'TTD',
    'name': 'Trinidad and Tobago Dollar',
    'countryName': 'Trinidad and Tobago',
  },
  'TN': {
    'codeAlpha3': 'TND',
    'name': 'Tunisian Dinar',
    'countryName': 'Tunisia',
  },
  'TR': {
    'codeAlpha3': 'TRY',
    'name': 'Turkish Lira',
    'countryName': 'Turkey',
  },
  'TM': {
    'codeAlpha3': 'TMT',
    'name': 'Turkmenistani Manat',
    'countryName': 'Turkmenistan',
  },
  'TV': {
    'codeAlpha3': 'AUD',
    'name': 'Australian Dollar',
    'countryName': 'Tuvalu',
  },
  'UG': {
    'codeAlpha3': 'UGX',
    'name': 'Ugandan Shilling',
    'countryName': 'Uganda',
  },
  'UA': {
    'codeAlpha3': 'UAH',
    'name': 'Ukrainian Hryvnia',
    'countryName': 'Ukraine',
  },
  'AE': {
    'codeAlpha3': 'AED',
    'name': 'United Arab Emirates Dirham',
    'countryName': 'United Arab Emirates (UAE)',
  },
  'GB': {
    'codeAlpha3': 'GBP',
    'name': 'British Pound',
    'countryName': 'United Kingdom (UK)',
  },
  'US': {
    'codeAlpha3': 'USD',
    'name': 'United States Dollar',
    'countryName': 'United States of America (USA)',
  },
  'UY': {
    'codeAlpha3': 'UYU',
    'name': 'Uruguayan Peso',
    'countryName': 'Uruguay',
  },
  'UZ': {
    'codeAlpha3': 'UZS',
    'name': 'Uzbekistani Som',
    'countryName': 'Uzbekistan',
  },
  'VU': {
    'codeAlpha3': 'VUV',
    'name': 'Vanuatu Vatu',
    'countryName': 'Vanuatu',
  },
  'VA': {
    'codeAlpha3': 'EUR',
    'name': 'Euro',
    'countryName': 'Vatican City (Holy See)',
  },
  'VE': {
    'codeAlpha3': 'VES',
    'name': 'Venezuelan Bolívar',
    'countryName': 'Venezuela',
  },
  'VN': {
    'codeAlpha3': 'VND',
    'name': 'Vietnamese Đồng',
    'countryName': 'Vietnam',
  },
  'YE': {
    'codeAlpha3': 'YER',
    'name': 'Yemeni Rial',
    'countryName': 'Yemen',
  },
  'ZM': {
    'codeAlpha3': 'ZMW',
    'name': 'Zambian Kwacha',
    'countryName': 'Zambia',
  },
  'ZW': {
    'codeAlpha3': 'ZWL',
    'name': 'Zimbabwean Dollar',
    'countryName': 'Zimbabwe',
  },
};

/// An implementation of [GeoCurrencies] used for live implementation.
class GeoCurrenciesLiveImplementation implements GeoCurrencies {
  final GeoCurrenciesConfig _config;

  /// Constructs a new [GeoCurrenciesLiveImplementation].
  GeoCurrenciesLiveImplementation(this._config);

  /// Get the currency data.
  Map<String, String>? _getCurrencyData(String? countryCode) {
    if (_countryCurrencyData.containsKey(countryCode?.toUpperCase())) {
      return _countryCurrencyData[countryCode];
    }

    return null;
  }

  @override
  Future<CurrencyData?> getCurrencyDataByCoordinate({
    required double latitude,
    required double longitude,
  }) async {
    final countryCode = await GeocodingOpenStreetMap.getCountryCode(
      latitude: latitude,
      longitude: longitude,
    );

    final currency = _getCurrencyData(countryCode?.toUpperCase());

    if (currency == null) {
      return null;
    }

    return CurrencyData(
      codeIso4217: currency[CurrencyData.keyCodeIso4217],
      countryName: currency[CurrencyData.keyCountryName],
      name: currency[CurrencyData.keyName],
      symbol: NumberFormat.simpleCurrency(
        name: currency[CurrencyData.keyCodeIso4217],
      ).currencySymbol,
    );
  }

  @override
  String formatAmountWithCurrencySymbol({
    required num amount,
    required String currencyCodeIso4217,
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
    final currencyConversionData = await ExchangeRate.getConversionData(
      fromCurrencyCodeIso4217: fromCurrencyCodeIso4217,
    );

    return await ExchangeRate.convertAmount(
      amount: amount,
      config: _config,
      fromCurrencyCodeIso4217: fromCurrencyCodeIso4217,
      toCurrencyCodeIso4217: toCurrencyCodeIso4217,
      currencyConversionData: currencyConversionData,
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
    final currencyConversionData = await ExchangeRate.getConversionData(
      fromCurrencyCodeIso4217: fromCurrencyCodeIso4217,
    );

    return await ExchangeRate.getRate(
      fromCurrencyCodeIso4217: fromCurrencyCodeIso4217,
      toCurrencyCodeIso4217: toCurrencyCodeIso4217,
      currencyConversionData: currencyConversionData,
    );
  }
}
