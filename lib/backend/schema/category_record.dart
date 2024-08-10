import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryRecord extends FirestoreRecord {
  CategoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "cat_name" field.
  String? _catName;
  String get catName => _catName ?? '';
  bool hasCatName() => _catName != null;

  // "sub_cat" field.
  String? _subCat;
  String get subCat => _subCat ?? '';
  bool hasSubCat() => _subCat != null;

  void _initializeFields() {
    _catName = snapshotData['cat_name'] as String?;
    _subCat = snapshotData['sub_cat'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('category');

  static Stream<CategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryRecord.fromSnapshot(s));

  static Future<CategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryRecord.fromSnapshot(s));

  static CategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryRecordData({
  String? catName,
  String? subCat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cat_name': catName,
      'sub_cat': subCat,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryRecordDocumentEquality implements Equality<CategoryRecord> {
  const CategoryRecordDocumentEquality();

  @override
  bool equals(CategoryRecord? e1, CategoryRecord? e2) {
    return e1?.catName == e2?.catName && e1?.subCat == e2?.subCat;
  }

  @override
  int hash(CategoryRecord? e) =>
      const ListEquality().hash([e?.catName, e?.subCat]);

  @override
  bool isValidKey(Object? o) => o is CategoryRecord;
}
