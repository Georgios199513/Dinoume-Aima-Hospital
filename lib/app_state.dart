import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _appVersion = prefs.getString('ff_appVersion') ?? _appVersion;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _CurrentRegion = '';
  String get CurrentRegion => _CurrentRegion;
  set CurrentRegion(String value) {
    _CurrentRegion = value;
  }

  bool _HospitalPasswordVerified = false;
  bool get HospitalPasswordVerified => _HospitalPasswordVerified;
  set HospitalPasswordVerified(bool value) {
    _HospitalPasswordVerified = value;
  }

  DocumentReference? _newEvent;
  DocumentReference? get newEvent => _newEvent;
  set newEvent(DocumentReference? value) {
    _newEvent = value;
  }

  int _NewEventOrderFrom = 1;
  int get NewEventOrderFrom => _NewEventOrderFrom;
  set NewEventOrderFrom(int value) {
    _NewEventOrderFrom = value;
  }

  int _NewEventOrderTo = 36;
  int get NewEventOrderTo => _NewEventOrderTo;
  set NewEventOrderTo(int value) {
    _NewEventOrderTo = value;
  }

  DocumentReference? _defaultGender =
      FirebaseFirestore.instance.doc('/Gender/kO9Zr5qye68AZ4b8bOgq');
  DocumentReference? get defaultGender => _defaultGender;
  set defaultGender(DocumentReference? value) {
    _defaultGender = value;
  }

  String _ChooseGender = '';
  String get ChooseGender => _ChooseGender;
  set ChooseGender(String value) {
    _ChooseGender = value;
  }

  DocumentReference? _NewEventFromTimeRange =
      FirebaseFirestore.instance.doc('/TimeChunksChoices/4WGPN58crqtZcL6g7zMz');
  DocumentReference? get NewEventFromTimeRange => _NewEventFromTimeRange;
  set NewEventFromTimeRange(DocumentReference? value) {
    _NewEventFromTimeRange = value;
  }

  DocumentReference? _NewEventToTimeRange =
      FirebaseFirestore.instance.doc('/TimeChunksChoices/7AWa8v4PMK3bD85G6tet');
  DocumentReference? get NewEventToTimeRange => _NewEventToTimeRange;
  set NewEventToTimeRange(DocumentReference? value) {
    _NewEventToTimeRange = value;
  }

  int _totalUpdateAmount = 0;
  int get totalUpdateAmount => _totalUpdateAmount;
  set totalUpdateAmount(int value) {
    _totalUpdateAmount = value;
  }

  bool _isActiveEventChip = true;
  bool get isActiveEventChip => _isActiveEventChip;
  set isActiveEventChip(bool value) {
    _isActiveEventChip = value;
  }

  int _EditAppointmentTimeOrder = 0;
  int get EditAppointmentTimeOrder => _EditAppointmentTimeOrder;
  set EditAppointmentTimeOrder(int value) {
    _EditAppointmentTimeOrder = value;
  }

  bool _isFilteredAppointment = false;
  bool get isFilteredAppointment => _isFilteredAppointment;
  set isFilteredAppointment(bool value) {
    _isFilteredAppointment = value;
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  List<DocumentReference> _UserOfAppointmentsToComplete = [];
  List<DocumentReference> get UserOfAppointmentsToComplete =>
      _UserOfAppointmentsToComplete;
  set UserOfAppointmentsToComplete(List<DocumentReference> value) {
    _UserOfAppointmentsToComplete = value;
  }

  void addToUserOfAppointmentsToComplete(DocumentReference value) {
    UserOfAppointmentsToComplete.add(value);
  }

  void removeFromUserOfAppointmentsToComplete(DocumentReference value) {
    UserOfAppointmentsToComplete.remove(value);
  }

  void removeAtIndexFromUserOfAppointmentsToComplete(int index) {
    UserOfAppointmentsToComplete.removeAt(index);
  }

  void updateUserOfAppointmentsToCompleteAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    UserOfAppointmentsToComplete[index] =
        updateFn(_UserOfAppointmentsToComplete[index]);
  }

  void insertAtIndexInUserOfAppointmentsToComplete(
      int index, DocumentReference value) {
    UserOfAppointmentsToComplete.insert(index, value);
  }

  DocumentReference? _hospitalplanner;
  DocumentReference? get hospitalplanner => _hospitalplanner;
  set hospitalplanner(DocumentReference? value) {
    _hospitalplanner = value;
  }

  bool _toComplete = false;
  bool get toComplete => _toComplete;
  set toComplete(bool value) {
    _toComplete = value;
  }

  String _appVersion = '';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
    prefs.setString('ff_appVersion', value);
  }

  int _verifyingTimes = 0;
  int get verifyingTimes => _verifyingTimes;
  set verifyingTimes(int value) {
    _verifyingTimes = value;
  }

  bool _notCome = false;
  bool get notCome => _notCome;
  set notCome(bool value) {
    _notCome = value;
  }

  DocumentReference? _selectedHospital;
  DocumentReference? get selectedHospital => _selectedHospital;
  set selectedHospital(DocumentReference? value) {
    _selectedHospital = value;
  }

  List<DocumentReference> _userList = [];
  List<DocumentReference> get userList => _userList;
  set userList(List<DocumentReference> value) {
    _userList = value;
  }

  void addToUserList(DocumentReference value) {
    userList.add(value);
  }

  void removeFromUserList(DocumentReference value) {
    userList.remove(value);
  }

  void removeAtIndexFromUserList(int index) {
    userList.removeAt(index);
  }

  void updateUserListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    userList[index] = updateFn(_userList[index]);
  }

  void insertAtIndexInUserList(int index, DocumentReference value) {
    userList.insert(index, value);
  }

  String _NewCurrentEventName = '';
  String get NewCurrentEventName => _NewCurrentEventName;
  set NewCurrentEventName(String value) {
    _NewCurrentEventName = value;
  }

  DateTime? _NewCurrentEventDate;
  DateTime? get NewCurrentEventDate => _NewCurrentEventDate;
  set NewCurrentEventDate(DateTime? value) {
    _NewCurrentEventDate = value;
  }

  String _NewCurrentEventAddres = '';
  String get NewCurrentEventAddres => _NewCurrentEventAddres;
  set NewCurrentEventAddres(String value) {
    _NewCurrentEventAddres = value;
  }

  List<DocumentReference> _BloodAppointmentsToComplete = [];
  List<DocumentReference> get BloodAppointmentsToComplete =>
      _BloodAppointmentsToComplete;
  set BloodAppointmentsToComplete(List<DocumentReference> value) {
    _BloodAppointmentsToComplete = value;
  }

  void addToBloodAppointmentsToComplete(DocumentReference value) {
    BloodAppointmentsToComplete.add(value);
  }

  void removeFromBloodAppointmentsToComplete(DocumentReference value) {
    BloodAppointmentsToComplete.remove(value);
  }

  void removeAtIndexFromBloodAppointmentsToComplete(int index) {
    BloodAppointmentsToComplete.removeAt(index);
  }

  void updateBloodAppointmentsToCompleteAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    BloodAppointmentsToComplete[index] =
        updateFn(_BloodAppointmentsToComplete[index]);
  }

  void insertAtIndexInBloodAppointmentsToComplete(
      int index, DocumentReference value) {
    BloodAppointmentsToComplete.insert(index, value);
  }

  List<DocumentReference> _TimeChunksList = [];
  List<DocumentReference> get TimeChunksList => _TimeChunksList;
  set TimeChunksList(List<DocumentReference> value) {
    _TimeChunksList = value;
  }

  void addToTimeChunksList(DocumentReference value) {
    TimeChunksList.add(value);
  }

  void removeFromTimeChunksList(DocumentReference value) {
    TimeChunksList.remove(value);
  }

  void removeAtIndexFromTimeChunksList(int index) {
    TimeChunksList.removeAt(index);
  }

  void updateTimeChunksListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    TimeChunksList[index] = updateFn(_TimeChunksList[index]);
  }

  void insertAtIndexInTimeChunksList(int index, DocumentReference value) {
    TimeChunksList.insert(index, value);
  }

  List<DocumentReference> _BloodAppointmentToCheck = [];
  List<DocumentReference> get BloodAppointmentToCheck =>
      _BloodAppointmentToCheck;
  set BloodAppointmentToCheck(List<DocumentReference> value) {
    _BloodAppointmentToCheck = value;
  }

  void addToBloodAppointmentToCheck(DocumentReference value) {
    BloodAppointmentToCheck.add(value);
  }

  void removeFromBloodAppointmentToCheck(DocumentReference value) {
    BloodAppointmentToCheck.remove(value);
  }

  void removeAtIndexFromBloodAppointmentToCheck(int index) {
    BloodAppointmentToCheck.removeAt(index);
  }

  void updateBloodAppointmentToCheckAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    BloodAppointmentToCheck[index] = updateFn(_BloodAppointmentToCheck[index]);
  }

  void insertAtIndexInBloodAppointmentToCheck(
      int index, DocumentReference value) {
    BloodAppointmentToCheck.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
