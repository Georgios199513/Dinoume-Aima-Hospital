import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "NameOfEvent" field.
  String? _nameOfEvent;
  String get nameOfEvent => _nameOfEvent ?? '';
  bool hasNameOfEvent() => _nameOfEvent != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "EventDate" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "Details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "Address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  bool hasAddress() => _address != null;

  // "SeatsTotalPerTimeChunk" field.
  int? _seatsTotalPerTimeChunk;
  int get seatsTotalPerTimeChunk => _seatsTotalPerTimeChunk ?? 0;
  bool hasSeatsTotalPerTimeChunk() => _seatsTotalPerTimeChunk != null;

  // "TimeRange" field.
  ChunkOrderRangeStruct? _timeRange;
  ChunkOrderRangeStruct get timeRange => _timeRange ?? ChunkOrderRangeStruct();
  bool hasTimeRange() => _timeRange != null;

  // "SeatsMax" field.
  int? _seatsMax;
  int get seatsMax => _seatsMax ?? 0;
  bool hasSeatsMax() => _seatsMax != null;

  // "UsersParticipated" field.
  List<DocumentReference>? _usersParticipated;
  List<DocumentReference> get usersParticipated =>
      _usersParticipated ?? const [];
  bool hasUsersParticipated() => _usersParticipated != null;

  // "NewNotifiaction" field.
  int? _newNotifiaction;
  int get newNotifiaction => _newNotifiaction ?? 0;
  bool hasNewNotifiaction() => _newNotifiaction != null;

  // "EventUserPlanner" field.
  DocumentReference? _eventUserPlanner;
  DocumentReference? get eventUserPlanner => _eventUserPlanner;
  bool hasEventUserPlanner() => _eventUserPlanner != null;

  // "updated_time" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "TimeSlotToRemove" field.
  List<DocumentReference>? _timeSlotToRemove;
  List<DocumentReference> get timeSlotToRemove => _timeSlotToRemove ?? const [];
  bool hasTimeSlotToRemove() => _timeSlotToRemove != null;

  // "TimeSlotOrderToRemove" field.
  List<int>? _timeSlotOrderToRemove;
  List<int> get timeSlotOrderToRemove => _timeSlotOrderToRemove ?? const [];
  bool hasTimeSlotOrderToRemove() => _timeSlotOrderToRemove != null;

  // "EventHospitalPlanner" field.
  DocumentReference? _eventHospitalPlanner;
  DocumentReference? get eventHospitalPlanner => _eventHospitalPlanner;
  bool hasEventHospitalPlanner() => _eventHospitalPlanner != null;

  // "UsersParticipatedEmailsList" field.
  List<String>? _usersParticipatedEmailsList;
  List<String> get usersParticipatedEmailsList =>
      _usersParticipatedEmailsList ?? const [];
  bool hasUsersParticipatedEmailsList() => _usersParticipatedEmailsList != null;

  // "DeveloperMode" field.
  bool? _developerMode;
  bool get developerMode => _developerMode ?? false;
  bool hasDeveloperMode() => _developerMode != null;

  // "eventState" field.
  String? _eventState;
  String get eventState => _eventState ?? '';
  bool hasEventState() => _eventState != null;

  // "bloodAppointmentList" field.
  List<DocumentReference>? _bloodAppointmentList;
  List<DocumentReference> get bloodAppointmentList =>
      _bloodAppointmentList ?? const [];
  bool hasBloodAppointmentList() => _bloodAppointmentList != null;

  void _initializeFields() {
    _nameOfEvent = snapshotData['NameOfEvent'] as String?;
    _location = snapshotData['Location'] as LatLng?;
    _eventDate = snapshotData['EventDate'] as DateTime?;
    _details = snapshotData['Details'] as String?;
    _address = snapshotData['Address'] is AddressStruct
        ? snapshotData['Address']
        : AddressStruct.maybeFromMap(snapshotData['Address']);
    _seatsTotalPerTimeChunk =
        castToType<int>(snapshotData['SeatsTotalPerTimeChunk']);
    _timeRange = snapshotData['TimeRange'] is ChunkOrderRangeStruct
        ? snapshotData['TimeRange']
        : ChunkOrderRangeStruct.maybeFromMap(snapshotData['TimeRange']);
    _seatsMax = castToType<int>(snapshotData['SeatsMax']);
    _usersParticipated = getDataList(snapshotData['UsersParticipated']);
    _newNotifiaction = castToType<int>(snapshotData['NewNotifiaction']);
    _eventUserPlanner = snapshotData['EventUserPlanner'] as DocumentReference?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _timeSlotToRemove = getDataList(snapshotData['TimeSlotToRemove']);
    _timeSlotOrderToRemove = getDataList(snapshotData['TimeSlotOrderToRemove']);
    _eventHospitalPlanner =
        snapshotData['EventHospitalPlanner'] as DocumentReference?;
    _usersParticipatedEmailsList =
        getDataList(snapshotData['UsersParticipatedEmailsList']);
    _developerMode = snapshotData['DeveloperMode'] as bool?;
    _eventState = snapshotData['eventState'] as String?;
    _bloodAppointmentList = getDataList(snapshotData['bloodAppointmentList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createEventsRecordData({
  String? nameOfEvent,
  LatLng? location,
  DateTime? eventDate,
  String? details,
  AddressStruct? address,
  int? seatsTotalPerTimeChunk,
  ChunkOrderRangeStruct? timeRange,
  int? seatsMax,
  int? newNotifiaction,
  DocumentReference? eventUserPlanner,
  DateTime? updatedTime,
  DateTime? createdTime,
  DocumentReference? eventHospitalPlanner,
  bool? developerMode,
  String? eventState,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'NameOfEvent': nameOfEvent,
      'Location': location,
      'EventDate': eventDate,
      'Details': details,
      'Address': AddressStruct().toMap(),
      'SeatsTotalPerTimeChunk': seatsTotalPerTimeChunk,
      'TimeRange': ChunkOrderRangeStruct().toMap(),
      'SeatsMax': seatsMax,
      'NewNotifiaction': newNotifiaction,
      'EventUserPlanner': eventUserPlanner,
      'updated_time': updatedTime,
      'created_time': createdTime,
      'EventHospitalPlanner': eventHospitalPlanner,
      'DeveloperMode': developerMode,
      'eventState': eventState,
    }.withoutNulls,
  );

  // Handle nested data for "Address" field.
  addAddressStructData(firestoreData, address, 'Address');

  // Handle nested data for "TimeRange" field.
  addChunkOrderRangeStructData(firestoreData, timeRange, 'TimeRange');

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nameOfEvent == e2?.nameOfEvent &&
        e1?.location == e2?.location &&
        e1?.eventDate == e2?.eventDate &&
        e1?.details == e2?.details &&
        e1?.address == e2?.address &&
        e1?.seatsTotalPerTimeChunk == e2?.seatsTotalPerTimeChunk &&
        e1?.timeRange == e2?.timeRange &&
        e1?.seatsMax == e2?.seatsMax &&
        listEquality.equals(e1?.usersParticipated, e2?.usersParticipated) &&
        e1?.newNotifiaction == e2?.newNotifiaction &&
        e1?.eventUserPlanner == e2?.eventUserPlanner &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.timeSlotToRemove, e2?.timeSlotToRemove) &&
        listEquality.equals(
            e1?.timeSlotOrderToRemove, e2?.timeSlotOrderToRemove) &&
        e1?.eventHospitalPlanner == e2?.eventHospitalPlanner &&
        listEquality.equals(
            e1?.usersParticipatedEmailsList, e2?.usersParticipatedEmailsList) &&
        e1?.developerMode == e2?.developerMode &&
        e1?.eventState == e2?.eventState &&
        listEquality.equals(e1?.bloodAppointmentList, e2?.bloodAppointmentList);
  }

  @override
  int hash(EventsRecord? e) => const ListEquality().hash([
        e?.nameOfEvent,
        e?.location,
        e?.eventDate,
        e?.details,
        e?.address,
        e?.seatsTotalPerTimeChunk,
        e?.timeRange,
        e?.seatsMax,
        const ListEquality().hash(e?.usersParticipated),
        e?.newNotifiaction,
        e?.eventUserPlanner,
        e?.updatedTime,
        e?.createdTime,
        const ListEquality().hash(e?.timeSlotToRemove),
        const ListEquality().hash(e?.timeSlotOrderToRemove),
        e?.eventHospitalPlanner,
        const ListEquality().hash(e?.usersParticipatedEmailsList),
        e?.developerMode,
        e?.eventState,
        const ListEquality().hash(e?.bloodAppointmentList)
      ]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
