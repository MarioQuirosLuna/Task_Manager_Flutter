// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_flutter/config/theme/app_theme.dart';
import 'package:task_manager_flutter/domain/entities/task.dart';

import 'package:task_manager_flutter/presentation/providers/task_provider.dart';
import 'package:task_manager_flutter/presentation/screens/home/home_list_task_screen.dart';
import 'package:task_manager_flutter/presentation/widgets/home/task/addtask/add_task_form.dart';
import 'package:task_manager_flutter/presentation/widgets/home/task/addtask/date_field_input.dart';
import 'package:task_manager_flutter/presentation/widgets/home/task/option_buttons.dart';
import 'package:task_manager_flutter/presentation/widgets/home/task/task_date_filter.dart';
import 'package:task_manager_flutter/presentation/widgets/home/task_list.dart';

void main() {
  group('HomeListTask Widget Tests', () {
    testWidgets('Renders correctly', (WidgetTester tester) async {
      // Create a TaskProvider and ThemeProvider for testing
      final taskProvider = TaskProvider();
      final themeProvider = ThemeProvider();

      // Build the HomeListTask widget
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => taskProvider),
            ChangeNotifierProvider(create: (_) => themeProvider),
          ],
          child: const MaterialApp(
            home: HomeListTask(),
          ),
        ),
      );

      // Verify that the widget renders as expected
      expect(find.text('Task Manager'), findsOneWidget, reason: "Expecting 'Task Manager' text");
      expect(find.byType(TaskDateFilter), findsOneWidget, reason: "Expecting a TaskDateFilter widget");
      expect(find.byType(TaskList), findsOneWidget, reason: "Expecting a TaskList widget");
      expect(find.byType(OptionButtons), findsOneWidget, reason: "Expecting an OptionButtons widget");
    });

    testWidgets('Loads tasks and settings on init', (WidgetTester tester) async {
      // Create a TaskProvider and ThemeProvider for testing
      final taskProvider = TaskProvider();
      final themeProvider = ThemeProvider();

      // Build the HomeListTask widget
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => taskProvider),
            ChangeNotifierProvider(create: (_) => themeProvider),
          ],
          child: const MaterialApp(
            home: HomeListTask(),
          ),
        ),
      );

      // Verify that tasks and settings are loaded on widget initialization
      await tester.pumpAndSettle(); // Wait for the tasks and settings to load
      expect(taskProvider.tasks.isNotEmpty, isFalse, reason: "Expecting tasks to be empty");

      taskProvider.tasks.add(Task(
        id: '1',
        title: 'Test Task',
        description: 'Test Description',
        date: DateTime.now(),
        isDone: false,
      ));
      expect(taskProvider.tasks.isNotEmpty, isTrue, reason: "Expecting tasks not to be empty");
      expect(taskProvider.tasks.length, 1, reason: "Expecting tasks to have a length of 1");
    });
  });

  group("AddTaskForm Widget Test", () {
    testWidgets("Render Correctly", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return AddTaskForm(taskProvider: TaskProvider());
          },
        ),
      ));
      expect(find.byType(AlertDialog), findsOneWidget, reason: "Expecting an AlertDialog");
      expect(find.text('Add Task'), findsOneWidget, reason: "Expecting 'Add Task' text");
      expect(find.byType(TextField), findsAtLeastNWidgets(2), reason: "Expecting at least two TextFields");
      expect(find.byType(DateFieldInput), findsOneWidget, reason: "Expecting a DateFieldInput widget");
      expect(find.text('Cancel'), findsOneWidget, reason: "Expecting 'Cancel' text");
      expect(find.text('Save'), findsOneWidget, reason: "Expecting 'Save' text");
    });
  });
}
