library csv_literal.generator;

import 'dart:async';

import 'package:analyzer/src/generated/element.dart';
import 'package:source_gen/source_gen.dart';

import 'csv_serializable.dart';

/// CSV SerializableGenerator Class
class CSVSerializableGenerator extends GeneratorForAnnotation<CSVSerializable> {
  const CSVSerializableGenerator();

  @override
  Future<String> generateForAnnotatedElement(
      Element element, CSVSerializable annotation) async {
    var classElement = element as ClassElement;
    var className = classElement.name;

    var fields =
        classElement.fields.fold(<String, FieldElement>{}, (map, field) {
      map[field.name] = field;
      return map;
    }) as Map<String, FieldElement>;

    var prefix = '_\$${className}';

    var buffer = new StringBuffer();

    buffer.writeln('abstract class ${prefix}CSVSerializerMixin {');

    fields.forEach((name, field) {
      buffer.writeln('  ${field.type.name} get $name;');
    });

    buffer.write('  String toCSV() {');
    buffer.write('    return \"');
    var values = <String>[];
    fields.forEach((name, fields) {
      values.add("\$\{${name}\}");
    });
    buffer.write(values.join(","));
    buffer.writeln('\";');
    buffer.writeln('  }');
    buffer.writeln('}');

    return buffer.toString();
  }
}
