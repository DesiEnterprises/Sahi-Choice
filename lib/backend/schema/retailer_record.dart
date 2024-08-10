import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RetailerRecord extends FirestoreRecord {
  RetailerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "no_of_flyers" field.
  int? _noOfFlyers;
  int get noOfFlyers => _noOfFlyers ?? 0;
  bool hasNoOfFlyers() => _noOfFlyers != null;

  // "flyerposter" field.
  String? _flyerposter;
  String get flyerposter => _flyerposter ?? '';
  bool hasFlyerposter() => _flyerposter != null;

  // "flyername" field.
  String? _flyername;
  String get flyername => _flyername ?? '';
  bool hasFlyername() => _flyername != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _logo = snapshotData['logo'] as String?;
    _noOfFlyers = castToType<int>(snapshotData['no_of_flyers']);
    _flyerposter = snapshotData['flyerposter'] as String?;
    _flyername = snapshotData['flyername'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('retailer');

  static Stream<RetailerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RetailerRecord.fromSnapshot(s));

  static Future<RetailerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RetailerRecord.fromSnapshot(s));

  static RetailerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RetailerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RetailerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RetailerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RetailerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RetailerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRetailerRecordData({
  String? name,
  String? logo,
  int? noOfFlyers,
  String? flyerposter,
  String? flyername,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'logo': logo,
      'no_of_flyers': noOfFlyers,
      'flyerposter': flyerposter,
      'flyername': flyername,
    }.withoutNulls,
  );

  return firestoreData;
}

class RetailerRecordDocumentEquality implements Equality<RetailerRecord> {
  const RetailerRecordDocumentEquality();

  @override
  bool equals(RetailerRecord? e1, RetailerRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.logo == e2?.logo &&
        e1?.noOfFlyers == e2?.noOfFlyers &&
        e1?.flyerposter == e2?.flyerposter &&
        e1?.flyername == e2?.flyername;
  }

  @override
  int hash(RetailerRecord? e) => const ListEquality()
      .hash([e?.name, e?.logo, e?.noOfFlyers, e?.flyerposter, e?.flyername]);

  @override
  bool isValidKey(Object? o) => o is RetailerRecord;
}
