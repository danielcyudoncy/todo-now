import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TodoRecord extends FirestoreRecord {
  TodoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  bool hasDay() => _day != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "task1" field.
  String? _task1;
  String get task1 => _task1 ?? '';
  bool hasTask1() => _task1 != null;

  // "task2" field.
  String? _task2;
  String get task2 => _task2 ?? '';
  bool hasTask2() => _task2 != null;

  // "task3" field.
  String? _task3;
  String get task3 => _task3 ?? '';
  bool hasTask3() => _task3 != null;

  void _initializeFields() {
    _day = snapshotData['day'] as String?;
    _date = snapshotData['date'] as String?;
    _task1 = snapshotData['task1'] as String?;
    _task2 = snapshotData['task2'] as String?;
    _task3 = snapshotData['task3'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('todo');

  static Stream<TodoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TodoRecord.fromSnapshot(s));

  static Future<TodoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TodoRecord.fromSnapshot(s));

  static TodoRecord fromSnapshot(DocumentSnapshot snapshot) => TodoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TodoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TodoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TodoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TodoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTodoRecordData({
  String? day,
  String? date,
  String? task1,
  String? task2,
  String? task3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day': day,
      'date': date,
      'task1': task1,
      'task2': task2,
      'task3': task3,
    }.withoutNulls,
  );

  return firestoreData;
}

class TodoRecordDocumentEquality implements Equality<TodoRecord> {
  const TodoRecordDocumentEquality();

  @override
  bool equals(TodoRecord? e1, TodoRecord? e2) {
    return e1?.day == e2?.day &&
        e1?.date == e2?.date &&
        e1?.task1 == e2?.task1 &&
        e1?.task2 == e2?.task2 &&
        e1?.task3 == e2?.task3;
  }

  @override
  int hash(TodoRecord? e) => const ListEquality()
      .hash([e?.day, e?.date, e?.task1, e?.task2, e?.task3]);

  @override
  bool isValidKey(Object? o) => o is TodoRecord;
}
