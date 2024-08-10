// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ProductlistStruct extends FFFirebaseStruct {
  ProductlistStruct({
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static ProductlistStruct fromMap(Map<String, dynamic> data) =>
      ProductlistStruct(
        name: data['name'] as String?,
      );

  static ProductlistStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductlistStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProductlistStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductlistStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProductlistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductlistStruct && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

ProductlistStruct createProductlistStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductlistStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductlistStruct? updateProductlistStruct(
  ProductlistStruct? productlist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productlist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductlistStructData(
  Map<String, dynamic> firestoreData,
  ProductlistStruct? productlist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productlist == null) {
    return;
  }
  if (productlist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productlist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productlistData =
      getProductlistFirestoreData(productlist, forFieldValue);
  final nestedData =
      productlistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productlist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductlistFirestoreData(
  ProductlistStruct? productlist, [
  bool forFieldValue = false,
]) {
  if (productlist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productlist.toMap());

  // Add any Firestore field values
  productlist.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductlistListFirestoreData(
  List<ProductlistStruct>? productlists,
) =>
    productlists?.map((e) => getProductlistFirestoreData(e, true)).toList() ??
    [];
