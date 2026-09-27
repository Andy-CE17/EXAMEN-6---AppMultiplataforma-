# Calendario académico en Flutter

Interfaz visual de un calendario académico para septiembre de 2026, desarrollada principalmente con `Row` y `Column`.

## Características

- Calendario mensual con fecha seleccionada e indicadores de eventos.
- Tres tarjetas con fecha, hora, ubicación e iconos.
- Diseño adaptable para Flutter Web.
- Componentes organizados en modelos, pantallas y widgets reutilizables.

## Estructura principal

```text
lib/
├── models/
├── screens/
├── theme/
├── widgets/
└── main.dart
```

## Ejecución

```bash
flutter pub get
flutter run -d chrome
```

## Validación

```bash
flutter analyze
flutter test
flutter build web
```
