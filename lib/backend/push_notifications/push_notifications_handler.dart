import 'dart:async';

import 'serialization_util.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    await _handlePushNotificationData(message.data);
  }

  Future _handlePushNotificationData(Map<String, dynamic> messageData) async {
    safeSetState(() => _loading = true);
    try {
      final initialPageName = messageData['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(messageData);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primary,
          child: Center(
            child: Image.asset(
              'assets/images/Slpashscreen.png',
              width: 500.0,
              fit: BoxFit.fitHeight,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'HomePageMobile': (data) async => HomePageMobileWidget(),
  'Step1_ChooseNYA': (data) async => Step1ChooseNYAWidget(),
  'Step2_TempPassword': (data) async => Step2TempPasswordWidget(
        titleBlackTxt: getParameter(data, 'titleBlackTxt'),
        redValue: getParameter(data, 'redValue'),
        hospitalSelected: await getDocumentParameter(
            data, 'hospitalSelected', HospitalsCreatedRecord.fromSnapshot),
      ),
  'Step2_NewPassword': (data) async => Step2NewPasswordWidget(
        blackTitleTxt: getParameter(data, 'blackTitleTxt'),
        redTxt: getParameter(data, 'redTxt'),
        hospitalSelected: await getDocumentParameter(
            data, 'hospitalSelected', HospitalsCreatedRecord.fromSnapshot),
      ),
  'Step3_HospitalUser': (data) async => Step3HospitalUserWidget(
        hospitalSelected: await getDocumentParameter(
            data, 'hospitalSelected', HospitalsCreatedRecord.fromSnapshot),
      ),
  'Step4_SignUpUser': (data) async => Step4SignUpUserWidget(
        useSelected: getParameter(data, 'useSelected'),
      ),
  'CreateUser': (data) async => CreateUserWidget(
        hospital: getParameter(data, 'hospital'),
      ),
  'ForgotPassword': (data) async => ForgotPasswordWidget(),
  'ProfileScreenMobile': (data) async => ProfileScreenMobileWidget(),
  'PreviewPastEvents': (data) async => PreviewPastEventsWidget(
        event: await getDocumentParameter(
            data, 'event', EventsRecord.fromSnapshot),
      ),
  'Step5_VerifyEmail': (data) async => Step5VerifyEmailWidget(),
  'ProfileDetails_LawThings': (data) async => ProfileDetailsLawThingsWidget(),
  'EditProfile': (data) async => EditProfileWidget(),
  'ProfileDetails': (data) async => ProfileDetailsWidget(),
  'S1_EventName': (data) async => S1EventNameWidget(),
  'S2_EventDate': (data) async => S2EventDateWidget(),
  'S3_EventAddress': (data) async => S3EventAddressWidget(),
  'S4_EventSeats': (data) async => S4EventSeatsWidget(),
  'S5_BetweenHours': (data) async => S5BetweenHoursWidget(),
  'ModifyChunks': (data) async => ModifyChunksWidget(
        newEvent: await getDocumentParameter(
            data, 'newEvent', EventsRecord.fromSnapshot),
      ),
  'MyDonors': (data) async => MyDonorsWidget(
        donorName: getParameter(data, 'donorName'),
        donorGender: getParameter(data, 'donorGender'),
      ),
  'MyDonorsDetails': (data) async => MyDonorsDetailsWidget(),
  'DonorDetails': (data) async => DonorDetailsWidget(
        donor:
            await getDocumentParameter(data, 'donor', UsersRecord.fromSnapshot),
      ),
  'S6_PreviewEvent': (data) async => S6PreviewEventWidget(
        isNewState: getParameter(data, 'isNewState'),
      ),
  'DonorDetailsAppointment': (data) async => DonorDetailsAppointmentWidget(
        userAppointment: await getDocumentParameter(
            data, 'userAppointment', UsersRecord.fromSnapshot),
        currentAppointment: getParameter(data, 'currentAppointment'),
        curreentEvent: getParameter(data, 'curreentEvent'),
      ),
  'EventDetails': (data) async => EventDetailsWidget(),
  'EventUnderConstruction': (data) async => EventUnderConstructionWidget(),
  'MyDonorWithDetails': (data) async => MyDonorWithDetailsWidget(
        donorName: getParameter(data, 'donorName'),
        donorGender: getParameter(data, 'donorGender'),
      ),
  'ModifyChunksCopy': (data) async => ModifyChunksCopyWidget(
        newEvent: getParameter(data, 'newEvent'),
      ),
  'BetweenHoursCopy': (data) async => BetweenHoursCopyWidget(),
  'OldEvents': (data) async => OldEventsWidget(),
  'Verifying': (data) async => VerifyingWidget(),
  'BulkUpdateEvent': (data) async => BulkUpdateEventWidget(
        fieldToModify: getParameter(data, 'fieldToModify'),
      ),
  'CancelingEvent': (data) async => CancelingEventWidget(
        fieldToModify: getParameter(data, 'fieldToModify'),
      ),
  'NewEditAppointments': (data) async => NewEditAppointmentsWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
