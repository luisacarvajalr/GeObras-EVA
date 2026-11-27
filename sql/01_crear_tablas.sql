-- ===========================================
-- GeObras - Creación de tablas
-- ===========================================

CREATE TABLE municipios (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  cod_dane VARCHAR(5),
  geom GEOMETRY(MultiPolygon, 4326)
);

CREATE TABLE proyectos (
  id SERIAL PRIMARY KEY,
  codigo VARCHAR(10) UNIQUE,
  nombre VARCHAR(200) NOT NULL,
  contrato VARCHAR(50),
  tipo VARCHAR(30),
  fase VARCHAR(30),
  estado VARCHAR(30),
  valor NUMERIC(15,2),
  poblacion INTEGER,
  vereda VARCHAR(100),
  municipio_id INTEGER REFERENCES municipios(id),
  geom GEOMETRY(Point, 4326)
);

CREATE TABLE puntos_obra (
  id SERIAL PRIMARY KEY,
  proyecto_id INTEGER NOT NULL REFERENCES proyectos(id) ON DELETE CASCADE,
  nombre VARCHAR(50),
  descripcion VARCHAR(200),
  elevacion NUMERIC(8,3),
  rms NUMERIC(6,3),
  geom GEOMETRY(PointZ, 4326)
);

CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  correo VARCHAR(120) UNIQUE NOT NULL,
  contrasena_hash VARCHAR(255) NOT NULL,
  rol VARCHAR(15) NOT NULL CHECK (rol IN ('Usuario', 'Administrador')),
  perfil VARCHAR(50),
  fecha_registro TIMESTAMP DEFAULT now()
);

CREATE TABLE reportes (
  id SERIAL PRIMARY KEY,
  usuario_id INTEGER REFERENCES usuarios(id),
  proyecto_id INTEGER REFERENCES proyectos(id),
  municipio_id INTEGER REFERENCES municipios(id),
  tipo VARCHAR(40) NOT NULL,
  severidad VARCHAR(10) CHECK (severidad IN ('Baja', 'Media', 'Alta')),
  descripcion TEXT,
  foto VARCHAR(255),
  direccion VARCHAR(200),
  metodo_ingreso VARCHAR(15) CHECK (metodo_ingreso IN ('mapa', 'coordenadas', 'direccion', 'gps')),
  estado VARCHAR(20) DEFAULT 'Recibido' CHECK (estado IN ('Recibido', 'En atención', 'Resuelto')),
  fecha_creacion TIMESTAMP DEFAULT now(),
  fecha_modificacion TIMESTAMP DEFAULT now(),
  geom GEOMETRY(Point, 4326) NOT NULL
);

CREATE TABLE encuestas (
  id SERIAL PRIMARY KEY,
  usuario_id INTEGER REFERENCES usuarios(id),
  proyecto_id INTEGER REFERENCES proyectos(id),
  municipio_id INTEGER REFERENCES municipios(id),
  formato VARCHAR(20) CHECK (formato IN ('Social', 'Ambiental', 'Aseguramiento')),
  respuestas TEXT,
  fecha TIMESTAMP DEFAULT now(),
  geom GEOMETRY(Point, 4326) NOT NULL
);

-- Índices espaciales (como el -I de shp2pgsql en el Taller 1)
CREATE INDEX idx_municipios_geom ON municipios USING GIST (geom);
CREATE INDEX idx_proyectos_geom ON proyectos USING GIST (geom);
CREATE INDEX idx_puntos_obra_geom ON puntos_obra USING GIST (geom);
CREATE INDEX idx_reportes_geom ON reportes USING GIST (geom);
CREATE INDEX idx_encuestas_geom ON encuestas USING GIST (geom);