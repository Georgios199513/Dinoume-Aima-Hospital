import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentsRecord extends FirestoreRecord {
  AppointmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "RelatedEvent" field.
  DocumentReference? _relatedEvent;
  DocumentReference? get relatedEvent => _relatedEvent;
  bool hasRelatedEvent() => _relatedEvent != null;

  // "RelatedUser" field.
  DocumentReference? _relatedUser;
  DocumentReference? get relatedUser => _relatedUser;
  bool hasRelatedUser() => _relatedUser != null;

  // "ProcessCompleted" field.
  bool? _processCompleted;
  bool get processCompleted => _processCompleted ?? false;
  bool hasProcessCompleted() => _processCompleted != null;

  // "TimeOfAppointment" field.
  DocumentReference? _timeOfAppointment;
  DocumentReference? get timeOfAppointment => _timeOfAppointment;
  bool hasTimeOfAppointment() => _timeOfAppointment != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "isCanceled" field.
  bool? _isCanceled;
  bool get isCanceled => _isCanceled ?? false;
  bool hasIsCanceled() => _isCanceled != null;

  // "appointmentReminderEmailiD" field.
  String? _appointmentReminderEmailiD;
  String get appointmentReminderEmailiD => _appointmentReminderEmailiD ?? '';
  bool hasAppointmentReminderEmailiD() => _appointmentReminderEmailiD != null;

  // "notCome" field.
  bool? _notCome;
  bool get notCome => _notCome ?? false;
  bool hasNotCome() => _notCome != null;

  // "TimeOfAppointmentOrder" field.
  int? _timeOfAppointmentOrder;
  int get timeOfAppointmentOrder => _timeOfAppointmentOrder ?? 0;
  bool hasTimeOfAppointmentOrder() => _timeOfAppointmentOrder != null;

  void _initializeFields() {
    _relatedEvent = snapshotData['RelatedEvent'] as DocumentReference?;
    _relatedUser = snapshotData['RelatedUser'] as DocumentReference?;
    _processCompleted = snapshotData['ProcessCompleted'] as bool?;
    _timeOfAppointment =
        snapshotData['TimeOfAppointment'] as DocumentReference?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _isCanceled = snapshotData['isCanceled'] as bool?;
    _appointmentReminderEmailiD =
        snapshotData['appointmentReminderEmailiD'] as String?;
    _notCome = snapshotData['notCome'] as bool?;
    _timeOfAppointmentOrder =
        castToType<int>(snapshotData['TimeOfAppointmentOrder']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Appointments');

  static Stream<AppointmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentsRecord.fromSnapshot(s));

  static Future<AppointmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentsRecord.fromSnapshot(s));

  static AppointmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createAppointmentsRecordData({
  DocumentReference? relatedEvent,
  DocumentReference? relatedUser,
  bool? processCompleted,
  DocumentReference? timeOfAppointment,
  bool? isCompleted,
  bool? isCanceled,
  String? appointmentReminderEmailiD,
  bool? notCome,
  int? timeOfAppointmentOrder,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RelatedEvent': relatedEvent,
      'RelatedUser': relatedUser,
      'ProcessCompleted': processCompleted,
      'TimeOfAppointment': timeOfAppointment,
      'isCompleted': isCompleted,
      'isCanceled': isCanceled,
      'appointmentReminderEmailiD': appointmentReminderEmailiD,
      'notCome': notCome,
      'TimeOfAppointmentOrder': timeOfAppointmentOrder,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentsRecordDocumentEquality
    implements Equality<AppointmentsRecord> {
  const AppointmentsRecordDocumentEquality();

  @override
  bool equals(AppointmentsRecord? e1, AppointmentsRecord? e2) {
    return e1?.relatedEvent == e2?.relatedEvent &&
        e1?.relatedUser == e2?.relatedUser &&
        e1?.processCompleted == e2?.processCompleted &&
        e1?.timeOfAppointment == e2?.timeOfAppointment &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.isCanceled == e2?.isCanceled &&
        e1?.appointmentReminderEmailiD == e2?.appointmentReminderEmailiD &&
        e1?.notCome == e2?.notCome &&
        e1?.timeOfAppointmentOrder == e2?.timeOfAppointmentOrder;
  }

  @override
  int hash(AppointmentsRecord? e) => const ListEquality().hash([
        e?.relatedEvent,
        e?.relatedUser,
        e?.processCompleted,
        e?.timeOfAppointment,
        e?.isCompleted,
        e?.isCanceled,
        e?.appointmentReminderEmailiD,
        e?.notCome,
        e?.timeOfAppointmentOrder
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentsRecord;
}
