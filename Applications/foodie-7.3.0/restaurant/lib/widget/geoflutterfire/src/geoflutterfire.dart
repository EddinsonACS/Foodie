import 'package:restaurant/models/mock_types.dart';
import 'package:restaurant/widget/geoflutterfire/src/collection/with_converter.dart';

import 'collection/default.dart';
import 'models/point.dart';

class Geoflutterfire {
  Geoflutterfire();

  GeoFireCollectionRef collection({
    required Query<Map<String, dynamic>> collectionRef,
  }) {
    return GeoFireCollectionRef(collectionRef);
  }

  GeoFireCollectionWithConverterRef<T> collectionWithConverter<T>({
    required Query<T> collectionRef,
  }) {
    return GeoFireCollectionWithConverterRef<T>(collectionRef);
  }

  GeoFireCollectionRef customCollection({
    required Query<Map<String, dynamic>> collectionRef,
  }) {
    return GeoFireCollectionRef(collectionRef);
  }

  GeoFirePoint point({required double latitude, required double longitude}) {
    return GeoFirePoint(latitude, longitude);
  }
}
