import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserdetailsRecord extends FirestoreRecord {
  UserdetailsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "fulName" field.
  String? _fulName;
  String get fulName => _fulName ?? '';
  bool hasFulName() => _fulName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  void _initializeFields() {
    _fulName = snapshotData['fulName'] as String?;
    _email = snapshotData['email'] as String?;
    _password = snapshotData['password'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userdetails');

  static Stream<UserdetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserdetailsRecord.fromSnapshot(s));

  static Future<UserdetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserdetailsRecord.fromSnapshot(s));

  static UserdetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserdetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserdetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserdetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserdetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserdetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserdetailsRecordData({
  String? fulName,
  String? email,
  String? password,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fulName': fulName,
      'email': email,
      'password': password,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserdetailsRecordDocumentEquality implements Equality<UserdetailsRecord> {
  const UserdetailsRecordDocumentEquality();

  @override
  bool equals(UserdetailsRecord? e1, UserdetailsRecord? e2) {
    return e1?.fulName == e2?.fulName &&
        e1?.email == e2?.email &&
        e1?.password == e2?.password;
  }

  @override
  int hash(UserdetailsRecord? e) =>
      const ListEquality().hash([e?.fulName, e?.email, e?.password]);

  @override
  bool isValidKey(Object? o) => o is UserdetailsRecord;
}
