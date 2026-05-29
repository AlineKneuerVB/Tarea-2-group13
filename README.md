# Tarea 2 — Manejo de un Workload en un entorno realista
## IIC2413 – Bases de Datos · Primer Semestre 2026

---

## Integrantes
Grupo 13

| Nombre | Número de alumno |
|--------|-----------------|
| Catalina Alegría Klocker | 21203733 |
| Anais Bocaz Melillan | 21205620 |
| Aline Kneuer Van Baal | 23644621 |

---

## Versión de PostgreSQL
PostgreSQL 18 --> En el caso de Aline
PostgreSQ 18.3 --> En el caso de Anais
PostgreSQ X --> En el caso de Catalina

## Comandos para reproducir

> Nota: `schema.sql` y `load.sql` corresponden a los archivos base entregados por el curso para crear y cargar la base de datos. No están incluidos en este repositorio.

### 1. Crear y cargar la base de datos
```bash
createdb bookstore_g13
psql -d bookstore_g13 -f schema.sql
psql -d bookstore_g13 -f load.sql
```

### 2. Medir línea base
La línea base se mide antes de aplicar optimizaciones. Los tiempos obtenidos se guardaron en `times_baseline.csv`.

```bash
# Ejecutar el workload original con el runner de la tarea
# y guardar los tiempos en times_baseline.csv
```

### 3. Aplicar índices y vista materializada
```bash
psql -d bookstore_g13 -f indexes.sql
psql -d bookstore_g13 -f matview.sql
psql -d bookstore_g13 -c "ANALYZE;"
```

Los índices creados están en `indexes.sql` y la vista materializada está en `matview.sql`.

### 4. Medir resultado final
Después de aplicar las optimizaciones, se ejecuta el workload optimizado:

```bash
psql -d bookstore_g13 -f workload_after.sql
```

Los tiempos obtenidos se guardaron en `times_after.csv`.

### 5. Recalcular totales
```bash
awk -F, 'NR > 1 {s += $2} END {printf "%.3f\n", s}' times_baseline.csv
awk -F, 'NR > 1 {s += $2} END {printf "%.3f\n", s}' times_after.csv
```

## Resultados
| Corrida | Tiempo total (ms) |
|---------|-------------------|
| Línea base | 36.652 |
| Final optimizado | 1.787 |
| Speedup | 20.51x |

El speedup se calcula como:

```text
36.652 / 1.787 = 20.51x
```

## Optimizaciones realizadas
- Se agregaron índices para acelerar filtros por fecha, búsquedas por email, consultas por libro y filtros sobre libros.
- Se creó la vista materializada `mv_verified_reviews` para evitar recalcular repetidamente la relación entre reviews, órdenes e ítems de órdenes.
- Se ejecutó `ANALYZE` después de crear los índices y la vista materializada para actualizar las estadísticas del optimizador.
