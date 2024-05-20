import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

/// An implementation of [GeocodingOpenStreetMap] that uses Open street map.
class GeocodingOpenStreetMap {
  static final _log = Logger('GeocodingOpenStreetMapImplementation');

  /// Open Street map's Api endpoint url for geocoding.
  static const String _url = 'nominatim.openstreetmap.org';

  /// Gets a geocoding's address with a pair [latitude] and [longitude], Link to API documentation : https://nominatim.org/release-docs/latest/api/Reverse/.
  static Future<String?> getCountryCode({
    required double latitude,
    required double longitude,
  }) async {
    const String urlParams = '/reverse';
    final Map<String, String> dataParams = {
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'format': 'jsonv2',
    };

    final Uri uri = Uri.https(_url, urlParams, dataParams);
    try {
      final response = await http.get(uri);
      // Check status code response 200 mean it's okay.
      if (response.statusCode == 200) {
        final result = _GeocodingResultOSM.fromJson(json.decode(response.body));

        return result.addressOSM?.countryCode;
      }
    } on HttpException catch (e) {
      _log.severe(e.toString(), e);

      return null;
    }

    return null;
  }
}

/// Representation of reverse geocoding result's open street map.
class _GeocodingResultOSM {
  /// The stored key ref for the [addressOSM] property.
  static const keyAddress = 'address';

  /// The address open street map.
  final _AddressOSM? addressOSM;

  /// Constructs a new [_GeocodingResultOSM] from [Map] object.
  _GeocodingResultOSM.fromJson(Map<String, dynamic> json)
      : addressOSM = (json[keyAddress] != null)
            ? _AddressOSM.fromJson(json[keyAddress])
            : null;
}

/// Representation of a geocoding address with open street map.
class _AddressOSM {
  /// The stored key ref for the [countryCode] property.
  static const keyCountryCode = 'country_code';

  /// The country code.
  final String? countryCode;

  /// Constructs a new [_AddressOSM].
  _AddressOSM.fromJson(Map<String, dynamic> json)
      : countryCode = json[keyCountryCode];
}
