import 'package:customer/models/mock_types.dart';

class DistanceDocSnapshot<T> {
  final DocumentSnapshot<T> documentSnapshot;
  final double kmDistance;

  DistanceDocSnapshot({
    required this.documentSnapshot,
    required this.kmDistance,
  });
}
