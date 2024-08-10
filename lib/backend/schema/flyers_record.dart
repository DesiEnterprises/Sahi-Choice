import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlyersRecord extends FirestoreRecord {
  FlyersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "flyer_images" field.
  List<String>? _flyerImages;
  List<String> get flyerImages => _flyerImages ?? const [];
  bool hasFlyerImages() => _flyerImages != null;

  // "flyerid" field.
  DocumentReference? _flyerid;
  DocumentReference? get flyerid => _flyerid;
  bool hasFlyerid() => _flyerid != null;

  void _initializeFields() {
    _flyerImages = getDataList(snapshotData['flyer_images']);
    _flyerid = snapshotData['flyerid'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('flyers');

  static Stream<FlyersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FlyersRecord.fromSnapshot(s));

  static Future<FlyersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FlyersRecord.fromSnapshot(s));

  static FlyersRecord fromSnapshot(DocumentSnapshot snapshot) => FlyersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FlyersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FlyersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FlyersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FlyersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFlyersRecordData({
  DocumentReference? flyerid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'flyerid': flyerid,
    }.withoutNulls,
  );

  return firestoreData;
}

class FlyersRecordDocumentEquality implements Equality<FlyersRecord> {
  const FlyersRecordDocumentEquality();

  @override
  bool equals(FlyersRecord? e1, FlyersRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.flyerImages, e2?.flyerImages) &&
        e1?.flyerid == e2?.flyerid;
  }

  @override
  int hash(FlyersRecord? e) =>
      const ListEquality().hash([e?.flyerImages, e?.flyerid]);

  @override
  bool isValidKey(Object? o) => o is FlyersRecord;
}
