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

## Comandos para reproducir

### 1. Crear y cargar la base de datos
```bash
createdb bookstore_g13
psql -d bookstore_g13 -f schema.sql
psql -d bookstore_g13 -f load.sql
```

### 2. Aplicar índices y vista materializada


### 3. Medir línea base


### 4. Medir resultado final


## Resultados
| Corrida | Tiempo total (ms) |
|---------|-------------------|
| Línea base | 36.652 |
| Final optimizado | 1.787 |
| Speedup | 20.51x |
