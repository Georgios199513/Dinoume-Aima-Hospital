import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  // "Newsletters" field.
  bool? _newsletters;
  bool get newsletters => _newsletters ?? false;
  bool hasNewsletters() => _newsletters != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "isNyaUser" field.
  bool? _isNyaUser;
  bool get isNyaUser => _isNyaUser ?? false;
  bool hasIsNyaUser() => _isNyaUser != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "eventsPaticipated" field.
  List<DocumentReference>? _eventsPaticipated;
  List<DocumentReference> get eventsPaticipated =>
      _eventsPaticipated ?? const [];
  bool hasEventsPaticipated() => _eventsPaticipated != null;

  // "gender" field.
  DocumentReference? _gender;
  DocumentReference? get gender => _gender;
  bool hasGender() => _gender != null;

  // "isComplete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  bool hasIsComplete() => _isComplete != null;

  // "NYAUserHospital" field.
  DocumentReference? _nYAUserHospital;
  DocumentReference? get nYAUserHospital => _nYAUserHospital;
  bool hasNYAUserHospital() => _nYAUserHospital != null;

  // "createdProfileAt" field.
  DateTime? _createdProfileAt;
  DateTime? get createdProfileAt => _createdProfileAt;
  bool hasCreatedProfileAt() => _createdProfileAt != null;

  // "isDeveloper" field.
  bool? _isDeveloper;
  bool get isDeveloper => _isDeveloper ?? false;
  bool hasIsDeveloper() => _isDeveloper != null;

  // "eventCanceled" field.
  bool? _eventCanceled;
  bool get eventCanceled => _eventCanceled ?? false;
  bool hasEventCanceled() => _eventCanceled != null;

  // "eventChanged" field.
  bool? _eventChanged;
  bool get eventChanged => _eventChanged ?? false;
  bool hasEventChanged() => _eventChanged != null;

  // "inAppointment" field.
  String? _inAppointment;
  String get inAppointment => _inAppointment ?? '';
  bool hasInAppointment() => _inAppointment != null;

  // "accountStatus" field.
  String? _accountStatus;
  String get accountStatus => _accountStatus ?? '';
  bool hasAccountStatus() => _accountStatus != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _region = snapshotData['region'] as String?;
    _newsletters = snapshotData['Newsletters'] as bool?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _isNyaUser = snapshotData['isNyaUser'] as bool?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _eventsPaticipated = getDataList(snapshotData['eventsPaticipated']);
    _gender = snapshotData['gender'] as DocumentReference?;
    _isComplete = snapshotData['isComplete'] as bool?;
    _nYAUserHospital = snapshotData['NYAUserHospital'] as DocumentReference?;
    _createdProfileAt = snapshotData['createdProfileAt'] as DateTime?;
    _isDeveloper = snapshotData['isDeveloper'] as bool?;
    _eventCanceled = snapshotData['eventCanceled'] as bool?;
    _eventChanged = snapshotData['eventChanged'] as bool?;
    _inAppointment = snapshotData['inAppointment'] as String?;
    _accountStatus = snapshotData['accountStatus'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? region,
  bool? newsletters,
  String? photoUrl,
  bool? isAdmin,
  bool? isNyaUser,
  DateTime? birthday,
  DocumentReference? gender,
  bool? isComplete,
  DocumentReference? nYAUserHospital,
  DateTime? createdProfileAt,
  bool? isDeveloper,
  bool? eventCanceled,
  bool? eventChanged,
  String? inAppointment,
  String? accountStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'region': region,
      'Newsletters': newsletters,
      'photo_url': photoUrl,
      'isAdmin': isAdmin,
      'isNyaUser': isNyaUser,
      'birthday': birthday,
      'gender': gender,
      'isComplete': isComplete,
      'NYAUserHospital': nYAUserHospital,
      'createdProfileAt': createdProfileAt,
      'isDeveloper': isDeveloper,
      'eventCanceled': eventCanceled,
      'eventChanged': eventChanged,
      'inAppointment': inAppointment,
      'accountStatus': accountStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.region == e2?.region &&
        e1?.newsletters == e2?.newsletters &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.isNyaUser == e2?.isNyaUser &&
        e1?.birthday == e2?.birthday &&
        listEquality.equals(e1?.eventsPaticipated, e2?.eventsPaticipated) &&
        e1?.gender == e2?.gender &&
        e1?.isComplete == e2?.isComplete &&
        e1?.nYAUserHospital == e2?.nYAUserHospital &&
        e1?.createdProfileAt == e2?.createdProfileAt &&
        e1?.isDeveloper == e2?.isDeveloper &&
        e1?.eventCanceled == e2?.eventCanceled &&
        e1?.eventChanged == e2?.eventChanged &&
        e1?.inAppointment == e2?.inAppointment &&
        e1?.accountStatus == e2?.accountStatus;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.region,
        e?.newsletters,
        e?.photoUrl,
        e?.isAdmin,
        e?.isNyaUser,
        e?.birthday,
        const ListEquality().hash(e?.eventsPaticipated),
        e?.gender,
        e?.isComplete,
        e?.nYAUserHospital,
        e?.createdProfileAt,
        e?.isDeveloper,
        e?.eventCanceled,
        e?.eventChanged,
        e?.inAppointment,
        e?.accountStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
