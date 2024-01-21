import 'package:rashydov_pmp_laba_1/weather.dart';
import 'package:test/test.dart';

void main() {
  test('Conversion from JSON.', () {
    final w = WeatherInfo.fromJson("Kiev", {
      "temperature": "10C",
      "wind": "20KM",
      "description": "test"
    });

    expect(w.id, "Kiev");
    expect(w.temperature, "10C");
    expect(w.wind, "20KM");
    expect(w.description, "test");
  });

  test('Conversion to JSON.', () {
    final w = WeatherInfo(id: "Kiev", temperature: "10C", wind: "20KM", description: "test");

    final json = w.toMap();

    expect(json, {
      "id": "Kiev",
      "temperature": "10C",
      "wind": "20KM",
      "description": "test"
    });
  });
}
