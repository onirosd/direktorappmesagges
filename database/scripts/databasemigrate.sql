

CREATE TABLE Serv_TipoAlertaCorreo (
  codServTipoAlertaCorreo INT PRIMARY KEY,
  desNombre VARCHAR(50) NOT NULL,
  desAbrev VARCHAR(10) NOT NULL,
  desDescripcion VARCHAR(250),
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

-- Insertar registros de prueba en la tabla Serv_TipoAlertaCorreo

INSERT INTO Serv_TipoAlertaCorreo (
  codServTipoAlertaCorreo,
  desNombre,
  desAbrev,
  desDescripcion,
  created_at,
  updated_at
) VALUES
(
  1,
  'Alerta Diaria',
  'AD',
  'Envía alertas de eventos diarios',
  NOW(),
  NOW()
),
(
  2,
  'Alerta Semanal',
  'AS',
  'Envía alertas de eventos semanales',
  NOW(),
  NOW()
),
(
  3,
  'Alerta Quincenal',
  'QU',
  'Envía alertas de eventos quincenales',
  NOW(),
  NOW()
),
(
  4,
  'Alerta Mensual',
  'ME',
  'Envía alertas de eventos mensuales',
  NOW(),
  NOW()
),
(
  5,
  'Alerta Previa Vencimiento',
  'AP',
  'Notifica sobre vencimientos próximos',
  NOW(),
  NOW()
);



CREATE TABLE Serv_AlertaProgramacionCorreo (
  codServAlertaProgramacionCorreo BIGINT AUTO_INCREMENT PRIMARY KEY,
  codProyecto BIGINT NOT NULL,
  codElementoControl INT NOT NULL,
  codModulo INT NOT NULL,
  desColumnaFecha VARCHAR(50) NOT NULL,
  codServTipoAlertaCorreo BIGINT NOT NULL,
  codDia INT NULL,
  desDia VARCHAR(50) NULL,
  numDias INT NULL,
  flgInicio BOOLEAN NOT NULL DEFAULT FALSE,
  dayFechaInicio DATE NULL,
  dayFechaFin DATE NULL,
  horaEnvio VARCHAR(10) NOT NULL,
  flgUsuario BOOLEAN NOT NULL DEFAULT FALSE,
  arrUsuarios TEXT NULL,
  codEstado INT NOT NULL,
  codNewReg BOOLEAN NOT NULL DEFAULT TRUE,
  dayFechaCreacion DATETIME NOT NULL,
  codUsuarioCreacion VARCHAR(100) NOT NULL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL,
  FOREIGN KEY (codServTipoAlertaCorreo) REFERENCES Serv_TipoAlertaCorreo(codServTipoAlertaCorreo)
);

INSERT INTO Serv_AlertaProgramacionCorreo (
  codProyecto,
  codElementoControl,
  codModulo,
  desColumnaFecha,
  codServTipoAlertaCorreo,
  codDia,
  desDia,
  numDias,
  flgInicio,
  dayFechaInicio,
  dayFechaFin,
  horaEnvio,
  flgUsuario,
  arrUsuarios,
  codEstado,
  codNewReg,
  dayFechaCreacion,
  codUsuarioCreacion
) VALUES (
  20,                -- codProyecto
  1,                 -- codElementoControl
  1,                 -- codModulo
  'FecDia',          -- desColumnaFecha
  2,                 -- codServTipoAlertaCorreo
  1,                 -- codDia
  'Lunes',           -- desDia
  NULL,              -- numDias
  FALSE,             -- flgInicio
  NULL,              -- dayFechaInicio
  NULL,              -- dayFechaFin
  '10:00',           -- horaEnvio
  FALSE,             -- flgUsuario
  '[]',              -- arrUsuarios
  1,                 -- codEstado
  1,                 -- codNewReg
  '2020-10-15 10:10:00', -- dayFechaCreacion
  '10'               -- codUsuarioCreacion
),
(
  20,                -- codProyecto
  2,                 -- codElementoControl
  1,                 -- codModulo
  'FecAgregacion',          -- desColumnaFecha
  5,                 -- codServTipoAlertaCorreo
  NULL,                 -- codDia
  '',           -- desDia
  10,              -- numDias
  FALSE,             -- flgInicio
  NULL,              -- dayFechaInicio
  NULL,              -- dayFechaFin
  '10:00',           -- horaEnvio
  TRUE,             -- flgUsuario
  '[diegowarthon1190@gmail.com]',              -- arrUsuarios
  1,                 -- codEstado
  1,                 -- codNewReg
  '2020-10-15 10:10:00', -- dayFechaCreacion
  '10'               -- codUsuarioCreacion

);




-- Creación de la tabla Serv_AlertaCorreoEnvioDiario
CREATE TABLE Serv_AlertaCorreoEnvioDiario (
  codServAlertaCorreoEnvioDiario BIGINT AUTO_INCREMENT PRIMARY KEY,
  codServAlertaProgramacionCorreo BIGINT NOT NULL,
  desDia VARCHAR(50) NOT NULL,
  codEstadoEnvio INT NOT NULL DEFAULT 0,
  dayFechaProgramada DATE NOT NULL,
  horaEnvio VARCHAR(10) NOT NULL,
  correoPara VARCHAR(100) NOT NULL,
  correoCopia TEXT NULL,
  dayFechaEnvio DATETIME NULL,
  dayFechaCreacion DATETIME NOT NULL,
  codUsuarioCreacion VARCHAR(100) NOT NULL,
  CONSTRAINT fk_alerta_programacion_correo
    FOREIGN KEY (codServAlertaProgramacionCorreo)
    REFERENCES Serv_AlertaProgramacionCorreo(codServAlertaProgramacionCorreo)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insertar registros de prueba en la tabla Serv_AlertaCorreoEnvioDiario

INSERT INTO Serv_AlertaCorreoEnvioDiario (
  codServAlertaProgramacionCorreo,
  desDia,
  codEstadoEnvio,
  dayFechaProgramada,
  horaEnvio,
  correoPara,
  correoCopia,
  dayFechaEnvio,
  dayFechaCreacion,
  codUsuarioCreacion
) VALUES
(
  1,                         -- codServAlertaProgramacionCorreo
  'Lunes',                   -- desDia
  0,                         -- codEstadoEnvio (0 = pendiente)
  '2024-11-25',              -- dayFechaProgramada
  '10:00',                   -- horaEnvio
  'juan@gmail.com',          -- correoPara
  '["huaman@gmail.com", "sanchez@gmail.com"]', -- correoCopia (almacenado como JSON)
  NULL,                      -- dayFechaEnvio (aún no enviado)
  '2020-10-15 10:10:00',     -- dayFechaCreacion
  '10'                       -- codUsuarioCreacion
),
(
  1,                         -- codServAlertaProgramacionCorreo
  'Lunes',                   -- desDia
  0,                         -- codEstadoEnvio (0 = pendiente)
  '2024-11-25',              -- dayFechaProgramada
  '10:00',                   -- horaEnvio
  'diego@gmail.com',         -- correoPara
  NULL,                      -- correoCopia
  NULL,                      -- dayFechaEnvio (aún no enviado)
  '2020-10-15 10:10:00',     -- dayFechaCreacion
  '10'                       -- codUsuarioCreacion
);





CREATE INDEX idx_estado_envio ON Serv_AlertaCorreoEnvioDiario (codEstadoEnvio);
CREATE INDEX idx_fecha_programada ON Serv_AlertaCorreoEnvioDiario (dayFechaProgramada);
