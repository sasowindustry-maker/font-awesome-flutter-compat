import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  test('accepts normal v11 FaIconData', () {
    const FaIcon icon = FaIcon(FontAwesomeIcons.accessibleIcon);

    expect(icon.icon, same(FontAwesomeIcons.accessibleIcon.data));
  });

  test('accepts ordinary Flutter IconData', () {
    const IconData materialIcon = Icons.add;
    const FaIcon icon = FaIcon(materialIcon);

    expect(icon.icon, same(materialIcon));
  });

  test('public getter exposes the underlying IconData for FaIconData', () {
    const FaIcon icon = FaIcon(FontAwesomeIcons.bullseye);

    expect(icon.icon, equals(FontAwesomeIcons.bullseye.data));
  });

  test('accepts null and exposes a null icon', () {
    const FaIcon icon = FaIcon(null);

    expect(icon.icon, isNull);
  });

  testWidgets('preserves normal v11 Font Awesome rendering', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: FaIcon(FontAwesomeIcons.accessibleIcon),
      ),
    );

    expect(find.byIcon(FontAwesomeIcons.accessibleIcon.data), findsOneWidget);
  });
}
