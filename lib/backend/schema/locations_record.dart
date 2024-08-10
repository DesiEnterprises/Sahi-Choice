import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationsRecord extends FirestoreRecord {
  LocationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "updated_date" field.
  DateTime? _updatedDate;
  DateTime? get updatedDate => _updatedDate;
  bool hasUpdatedDate() => _updatedDate != null;

  // "state" field.
  DocumentReference? _state;
  DocumentReference? get state => _state;
  bool hasState() => _state != null;

  // "district" field.
  DocumentReference? _district;
  DocumentReference? get district => _district;
  bool hasDistrict() => _district != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _updatedDate = snapshotData['updated_date'] as DateTime?;
    _state = snapshotData['state'] as DocumentReference?;
    _district = snapshotData['district'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('locations')
          : FirebaseFirestore.instance.collectionGroup('locations');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('locations').doc(id);

  static Stream<LocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocationsRecord.fromSnapshot(s));

  static Future<LocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocationsRecord.fromSnapshot(s));

  static LocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocationsRecordData({
  DocumentReference? user,
  DateTime? updatedDate,
  DocumentReference? state,
  DocumentReference? district,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'updated_date': updatedDate,
      'state': state,
      'district': district,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocationsRecordDocumentEquality implements Equality<LocationsRecord> {
  const LocationsRecordDocumentEquality();

  @override
  bool equals(LocationsRecord? e1, LocationsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.state == e2?.state &&
        e1?.district == e2?.district;
  }

  @override
  int hash(LocationsRecord? e) => const ListEquality()
      .hash([e?.user, e?.updatedDate, e?.state, e?.district]);

  @override
  bool isValidKey(Object? o) => o is LocationsRecord;
}
