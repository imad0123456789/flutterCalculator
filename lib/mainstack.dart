import 'dart:io';
import 'package:fluttercalcolator/stack.dart';
import 'commands.dart';


final commands = [
  Enter(),
  Print(),
  Exit(),
  Clear(),
  Add(),
  Subtract(),
  Multiply(),
  Noop()
];

void mainStack() {
  final stack= Stack<num>();
  String? input;

  while (true) {
   // print('Type a command:');
    input = stdin.readLineSync();
    if (input == null) continue;
    commands
        .firstWhere((command) => command.accept(stack, input!))
        .execute(stack, input);

  }
}
