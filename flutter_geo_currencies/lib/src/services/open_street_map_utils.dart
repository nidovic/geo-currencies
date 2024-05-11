import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

/// An implementation of [GeocodingOpenStreetMap] that uses Open street map.
class GeocodingOpenStreetMap {
  final _log = Logger('GeocodingOpenStreetMapImplementation');

  /// Open Street map's Api endpoint url for geocoding.
  final String _url = 'nominatim.openstreetmap.org';

  /// Gets a geocoding's address with a pair [latitude] and [longitude], Link to API documentation : https://nominatim.org/release-docs/latest/api/Reverse/.
  Future<String?> getCountryCode({
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
  /// The stored key ref for the [placeId] property.
  static const keyPlaceId = 'place_id';

  /// The stored key ref for the [osmType] property.
  static const keyOsmType = 'osm_type';

  /// The stored key ref for the [osmId] property.
  static const keyOsmId = 'osm_id';

  /// The stored key ref for the [lat] property.
  static const keyLat = 'lat';

  /// The stored key ref for the [lon] property.
  static const keyLon = 'lon';

  /// The stored key ref for the [placeRank] property.
  static const keyPlaceRank = 'place_rank';

  /// The stored key ref for the [category] property.
  static const keyCategory = 'category';

  /// The stored key ref for the [type] property.
  static const keyType = 'type';

  /// The stored key ref for the [importance] property.
  static const keyImportance = 'importance';

  /// The stored key ref for the [addressType] property.
  static const keyAddressType = 'addresstype';

  /// The stored key ref for the [name] property.
  static const keyName = 'name';

  /// The stored key ref for the [displayName] property.
  static const keyDisplayName = 'display_name';

  /// The stored key ref for the [addressOSM] property.
  static const keyAddress = 'address';

  /// The stored key ref for the [boundingBox] property.
  static const keyBoundingBox = 'boundingbox';

  /// The place id.
  final int? placeId;

  /// The open street map type.
  final String? osmType;

  /// The open street map id.
  final int? osmId;

  /// The latitude.
  final String lat;

  /// The longitude.
  final String lon;

  /// The place rank.
  final int? placeRank;

  /// The category.
  final String? category;

  /// The type.
  final String? type;

  /// The importance.
  final double? importance;

  /// The address type.
  final String? addressType;

  /// The name.
  final String? name;

  /// The display name.
  final String? displayName;

  /// The address open street map.
  final _AddressOSM? addressOSM;

  /// The bounding box.
  final List<String>? boundingBox;

  /// Constructs a new [_GeocodingResultOSM] from [Map] object.
  _GeocodingResultOSM.fromJson(Map<String, dynamic> json)
      : placeId = json[keyPlaceId],
        osmType = json[keyOsmType],
        osmId = json[keyOsmId],
        lat = json[keyLat],
        lon = json[keyLon],
        placeRank = json[keyPlaceRank],
        category = json[keyCategory],
        type = json[keyType],
        importance = json[keyImportance].toDouble(),
        addressType = json[keyAddressType],
        name = json[keyName],
        displayName = json[keyDisplayName],
        addressOSM = (json[keyAddress] != null)
            ? _AddressOSM.fromJson(json[keyAddress])
            : null,
        boundingBox = json[keyBoundingBox] == null
            ? null
            : List<String>.from(json[keyBoundingBox]);

  /// Returns the JSON representation of the [_GeocodingResultOSM].
  Map<String, dynamic> toJson() => {
        keyPlaceId: placeId,
        keyOsmType: osmType,
        keyOsmId: osmId,
        keyLat: lat,
        keyLon: lon,
        keyPlaceRank: placeRank,
        keyCategory: category,
        keyType: type,
        keyImportance: importance,
        keyAddressType: addressType,
        keyName: name,
        keyDisplayName: displayName,
        keyAddress: addressOSM?.toJson(),
        keyBoundingBox: boundingBox,
      };
}

/// Representation of a geocoding address with open street map.
class _AddressOSM {
  /// The stored key ref for the [road] property.
  static const keyRoad = 'road';

  /// The stored key ref for the [suburb] property.
  static const keySuburb = 'suburb';

  /// The stored key ref for the [town] property.
  static const keyTown = 'town';

  /// The stored key ref for the [city] property.
  static const keyCity = 'city';

  /// The stored key ref for the [municipality] property.
  static const keyMunicipality = 'municipality';

  /// The stored key ref for the [county] property.
  static const keyCounty = 'county';

  /// The stored key ref for the [state] property.
  static const keyState = 'state';

  /// The stored key ref for the [postCode] property.
  static const keyPostCode = 'postcode';

  /// The stored key ref for the [country] property.
  static const keyCountry = 'country';

  /// The stored key ref for the [countryCode] property.
  static const keyCountryCode = 'country_code';

  /// The road's name.
  final String? road;

  /// The sub-road's name.
  final String? suburb;

  /// The town's name.
  final String? town;

  /// The city's name.
  final String? city;

  /// The municipality's name.
  final String? municipality;

  /// The county's name.
  final String? county;

  /// The state's name.
  final String? state;

  /// The postal code.
  final String? postCode;

  /// The country's name.
  final String? country;

  /// The country code.
  final String? countryCode;

  /// Constructs a new [_AddressOSM].
  _AddressOSM.fromJson(Map<String, dynamic> json)
      : road = json[keyRoad],
        suburb = json[keySuburb],
        town = json[keyTown],
        city = json[keyCity],
        municipality = json[keyMunicipality],
        county = json[keyCounty],
        state = json[keyState],
        postCode = json[keyPostCode],
        country = json[keyCountry],
        countryCode = json[keyCountryCode];

  /// Returns the JSON representation of the [_AddressOSM].
  Map<String, dynamic> toJson() => {
        keyRoad: road,
        keySuburb: suburb,
        keyTown: town,
        keyCity: city,
        keyMunicipality: municipality,
        keyCounty: county,
        keyState: state,
        keyPostCode: postCode,
        keyCountry: country,
        keyCountryCode: countryCode,
      };
}
