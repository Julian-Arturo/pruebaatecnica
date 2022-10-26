import 'package:prueba_tecnica/domain/Models/screen_size.dart';

class UiUtils {
  UiUtils._privateConstructor();

  static final UiUtils _instanceUtils = UiUtils._privateConstructor();

  factory UiUtils() => _instanceUtils;

  ScreenSize screenSize = ScreenSize(width: 0, height: 0, absoluteHeight: 0);
}
