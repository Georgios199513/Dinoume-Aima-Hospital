import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TextsRecord extends FirestoreRecord {
  TextsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Tags" field.
  String? _tags;
  String get tags => _tags ?? '';
  bool hasTags() => _tags != null;

  // "Text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "Note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _tags = snapshotData['Tags'] as String?;
    _text = snapshotData['Text'] as String?;
    _note = snapshotData['Note'] as String?;
    _title = snapshotData['Title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Texts');

  static Stream<TextsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TextsRecord.fromSnapshot(s));

  static Future<TextsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TextsRecord.fromSnapshot(s));

  static TextsRecord fromSnapshot(DocumentSnapshot snapshot) => TextsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TextsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TextsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TextsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TextsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createTextsRecordData({
  String? tags,
  String? text,
  String? note,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Tags': tags,
      'Text': text,
      'Note': note,
      'Title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class TextsRecordDocumentEquality implements Equality<TextsRecord> {
  const TextsRecordDocumentEquality();

  @override
  bool equals(TextsRecord? e1, TextsRecord? e2) {
    return e1?.tags == e2?.tags &&
        e1?.text == e2?.text &&
        e1?.note == e2?.note &&
        e1?.title == e2?.title;
  }

  @override
  int hash(TextsRecord? e) =>
      const ListEquality().hash([e?.tags, e?.text, e?.note, e?.title]);

  @override
  bool isValidKey(Object? o) => o is TextsRecord;
}
