# GeObras-EVA
Plataforma web de seguimiento de proyectos de agua potable y saneamiento básico – Proyecto final Geoinformación en la Web - Especialización en Geomática.

# GeObras-EVA – Geovisor de obras de agua potable y saneamiento básico

Plataforma web para reportar novedades y hacer seguimiento a las obras de agua potable y saneamiento básico de **Vallecaucana de Aguas S.A. E.S.P.** en los municipios del Valle del Cauca.

Proyecto final del curso **Geoinformación en la Web** – Especialización en Geomática, Universidad del Valle, Año 2026.

## Temática

Gestión, seguimiento y reporte de novedades de obras de acueducto, alcantarillado y plantas de tratamiento (PTAR). La comunidad y los equipos de campo reportan información georreferenciada, y la supervisión la revisa, corrige y analiza en mapas, tablas y gráficos.

## Roles

| Rol | Perfiles | Qué hace |
| --- | --- | --- |
| Usuario | Comunidad, fontanero, profesional social/ambiental/aseguramiento | Reporta novedades y diligencia encuestas de campo |
| Administrador | Director técnico, apoyo a la supervisión, contratista/interventor | Revisa, corrige, cambia el estado y analiza los reportes |

## Tecnologías (código libre)

- **Base de datos:** PostgreSQL + PostGIS
- **Servidor de mapas:** GeoServer (WMS)
- **Servidor de aplicación:** Python + Flask
- **Cliente web:** HTML, CSS, JavaScript, Leaflet, Chart.js
- **Geocodificación:** Nominatim (OpenStreetMap)
- **Entorno:** OSGeoLive en VirtualBox

Arquitectura cliente-servidor: navegador → Flask y GeoServer → PostgreSQL/PostGIS.

## Estructura del repositorio

| Carpeta | Contenido |
| --- | --- |
| `app/` | Aplicación web en Flask, plantillas HTML y visor Leaflet |
| `sql/` | Scripts de creación de tablas, carga de datos, funciones y triggers |
| `datos/` | Inventario de proyectos, puntos GNSS y municipios |
| `docs/` | Memoria, diagramas (ER y UML) y presentación |

## Metodología

Scrum + Kanban (Scrumban) con sprints cortos y tablero en GitHub Projects.

## Estado

En desarrollo – Sprint 0 (planeación y modelo de datos). Entrega final: 12 de diciembre de 2026.

## Autora

Luisa Fernanda Carvajal R. – Ingeniera Topográfica
