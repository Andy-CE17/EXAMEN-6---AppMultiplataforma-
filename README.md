# Examen 6 · Calendario Flutter

Diseño visual de un calendario académico para septiembre de 2026. La interfaz
está construida principalmente con `Row` y `Column`, siguiendo los requisitos
del laboratorio y adaptándose a web, Android y Windows.

## Contenido

- Encabezado con mes, año y mensaje principal.
- Cuadrícula de cinco semanas con siete columnas.
- Días 5, 12 y 21 marcados como fechas con eventos.
- Día 12 seleccionado visualmente.
- Tres tarjetas de eventos académicos.
- Barra de navegación inferior.
- Fondo original y paneles con efecto translúcido.

## Ejecutar en la web

```bash
flutter pub get
flutter run -d chrome
```

## Verificaciones

```bash
flutter analyze
flutter test
flutter build web
```

El proyecto no necesita base de datos ni servicios externos. Todo el contenido
es estático porque el objetivo del examen es evaluar el diseño visual.
