library csv_literal.example.person;
//TODO :
import 'package:csv_literal_generator/csv_serializable.dart';

part 'example.g.dart';

@CSVSerializable()
class Person extends Object with _$PersonCSVSerializerMixin {
  final String name;
  final int age;
  Person(this.name,this.age);
}
