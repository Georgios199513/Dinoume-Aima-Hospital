import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double? returnDistanceBetweenTwoPoints(
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  // calculate the distance between two points on a spheroid and return distance as double
  var p = 0.017453292519943295;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));
  // uncomment the line below if you want the result to be rounded
  // double finalResult = result.roundToDouble();
  // if you uncommented the line above, you have to replace result in the line below with finalResult
  return result;
}

int? getLength(
  List<DocumentReference>? myList,
  bool isActive,
  int numberSeats,
) {
  // How to get the number of Firestore documents
  if (myList == null || myList.isEmpty) {
    return 0;
  }

  return myList
      .where((x) => isActive == true && numberSeats > 0)
      .toList()
      .length;
}

bool showSearchResult(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

int availableSeats(
  int totalSeatsPerChunk,
  int bookedSeats,
  int numberOfChunks,
) {
  // Add your function code here!
  return ((totalSeatsPerChunk * numberOfChunks) - bookedSeats);
}

int totalSeatsEvent(
  int totalSeatsPerChunk,
  int numberOfChunks,
) {
  // Add your function code here!
  return (totalSeatsPerChunk * numberOfChunks);
}

bool testDaysBetween2DatesLess90(
  DateTime lasteEventDate,
  DateTime currenrDate,
) {
  // test if the number between 2 dates is less than 90 days
  final result = currenrDate.difference(lasteEventDate);
  if (result.inDays.abs() < 90) {
    return true;
  } else {
    return false;
  }
}

int daysBetween2Dates(
  DateTime dateFrom,
  DateTime dateTo,
) {
  // if negative return 0
  final diff = dateTo.difference(dateFrom);

  if (diff.isNegative) return 0;

  return diff.inDays + 1;
}

double convertToPercentage(
  double value,
  double maxValue,
) {
  // convert to percentage
  final result = (value / maxValue) * 1;
  if (result > 1) {
    return -1;
  } else {
    return result;
  }
}

int addXPerCent(
  double percentageToAdd,
  int numberToAddTo,
) {
  // add 10% to 100
  return (numberToAddTo + ((percentageToAdd / 100) * numberToAddTo)).round();
}

LatLng convertToGeopoint(
  double latitude,
  double longitude,
) {
  // convert latitude and longitude to geopoint
  return LatLng(
    latitude,
    longitude,
  );
}

DocumentReference returnFirstUserElement(List<DocumentReference> listOfUsers) {
  return listOfUsers[0];
}

int numberBetween2TimeChunks(
  int from,
  int to,
  int deletedTimeChunks,
) {
  // Add your function code here!

  return (to - from) - deletedTimeChunks + 1;
}

DocumentReference returnFirstElement(
    List<DocumentReference> listOfAppointments) {
  return listOfAppointments[0];
}

double returnProgress(
  int total,
  int remaining,
) {
  return ((total - remaining) / total);
}

String returnPercent(double doubleValue) {
  return (doubleValue * 100).toString() + "%";
}

DateTime getTodayDate() {
  // get today date
  var now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

String? translateDayToGreek(DateTime? dateToTranslate) {
  // translate Friday in greek
  if (dateToTranslate == null) {
    return null;
  }
  final String? day = dateToTranslate.weekday.toString();
  switch (day) {
    case '1':
      return 'Δευτέρα';
    case '2':
      return 'Τρίτη';
    case '3':
      return 'Τετάρτη';
    case '4':
      return 'Πέμπτη';
    case '5':
      return 'Παρασκευή';
    case '6':
      return 'Σάββατο';
    case '7':
      return 'Κυριακή';
    default:
      return null;
  }
}

bool? testIfUpdate(
  int? input,
  int? database,
) {
  // I want a code that return true when input is different to database
  if (input == null && database == null) {
    return false;
  } else if (input == null && database != null) {
    return false;
  } else if (input != null && database == null) {
    return true;
  } else if (input != database) {
    return true;
  } else {
    return false;
  }
}

bool? isInputBiggerThanData(
  int inputValue,
  int databaseValue,
) {
  // test if inputValue is bugger than databseValue
  if (inputValue >= databaseValue) {
    return true;
  } else {
    return false;
  }
}

DateTime? addTime(
  DateTime? currentTime,
  int? hourToAdd,
  int? minutesToAdd,
) {
  // substract hourToSubstract and minutesToSubstract to currentTime and return the new time
  if (currentTime == null || hourToAdd == null || minutesToAdd == null) {
    return null;
  }

  final Duration durationToAdd = Duration(
    minutes: (hourToAdd * 60) + minutesToAdd,
  );

  return currentTime.add(durationToAdd);
}

int? toInt(String? valueInString) {
  // string to int
  if (valueInString == null) {
    return null;
  } else {
    return int.tryParse(valueInString);
  }
}

DateTime? substructTime(
  DateTime? date,
  int? hour,
  int? min,
  int? sec,
  int? days,
) {
  if (date == null) return null;
  final Duration duration = Duration(
    hours: hour ?? 0,
    minutes: min ?? 0,
    seconds: sec ?? 0,
    days: days ?? 0,
  );
  return date.subtract(duration);
}
