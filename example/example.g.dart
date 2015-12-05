// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-12-05T12:28:51.826Z

part of csv_literal.example.person;

// **************************************************************************
// Generator: CSVSerializableGenerator
// Target: class Person
// **************************************************************************

abstract class _$PersonCSVSerializerMixin {
  String get name;
  int get age;
  String toCSV() {
    return "${name},${age}";
  }
}
