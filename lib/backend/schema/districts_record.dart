import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DistrictsRecord extends FirestoreRecord {
  DistrictsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "district" field.
  String? _district;
  String get district => _district ?? '';
  bool hasDistrict() => _district != null;

  // "stateref" field.
  String? _stateref;
  String get stateref => _stateref ?? '';
  bool hasStateref() => _stateref != null;

  void _initializeFields() {
    _district = snapshotData['district'] as String?;
    _stateref = snapshotData['stateref'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('districts');

  static Stream<DistrictsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DistrictsRecord.fromSnapshot(s));

  static Future<DistrictsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DistrictsRecord.fromSnapshot(s));

  static DistrictsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DistrictsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DistrictsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DistrictsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DistrictsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DistrictsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDistrictsRecordData({
  String? district,
  String? stateref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'district': district,
      'stateref': stateref,
    }.withoutNulls,
  );

  return firestoreData;
}

class DistrictsRecordDocumentEquality implements Equality<DistrictsRecord> {
  const DistrictsRecordDocumentEquality();

  @override
  bool equals(DistrictsRecord? e1, DistrictsRecord? e2) {
    return e1?.district == e2?.district && e1?.stateref == e2?.stateref;
  }

  @override
  int hash(DistrictsRecord? e) =>
      const ListEquality().hash([e?.district, e?.stateref]);

  @override
  bool isValidKey(Object? o) => o is DistrictsRecord;
}
