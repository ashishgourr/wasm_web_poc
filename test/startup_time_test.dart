// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:wasm_web_poc/main.dart';

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   testWidgets('List scrolling performance', (WidgetTester tester) async {
//     // Launch your app
//     await tester.pumpWidget(MyHomePage());

//     // Find the list widget
//     final listFinder = find.byType(ListView);

//     // Start recording performance timeline with a custom key
//     final timeline = await tester.traceAction(
//       reportKey: 'list_scrolling',
//       () async {
//         // Simulate scrolling
//         await tester.fling(listFinder, Offset(0, -500), 1000); // Scroll down
//         await tester.pump(); // Rebuild the widget tree
//       },
//     );

//     // Analyze the timeline data (e.g., save it to a file or print metrics)
//     print(timeline.summary);
//   });
// }
