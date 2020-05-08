CREATE TABLE Sede (
  SedeID INT NOT NULL AUTO_INCREMENT,
  UsuarioID INT NULL,
  NombreSede VARCHAR(20) NULL,
  Direccion  VARCHAR(20) NULL,
  Telefono VARCHAR(20) NULL,
  AmbienteID INT NULL,
  PRIMARY KEY(SedeID)
);

CREATE TABLE Rol (
  RolID INT NOT NULL AUTO_INCREMENT,
  Especialidad VARCHAR(255) NULL,
  Descripcion  VARCHAR(255) NULL,
  PRIMARY KEY(RolID)
);

CREATE TABLE Usuario (
  UsuarioID INT NOT NULL AUTO_INCREMENT,
  Cedula INT NULL,
  Nombre VARCHAR(20) NULL,
  Apellido VARCHAR(20) NULL,
  Contraseña VARCHAR(20) NULL,
  PRIMARY KEY(UsuarioID)
);

CREATE TABLE TipoElemento (
  TipoElementoID INT NOT NULL AUTO_INCREMENT,
  TipoElemento VARCHAR(20) NULL,
  PRIMARY KEY(TipoElementoID)
);

CREATE TABLE Estado (
  EstadoID INT NOT NULL AUTO_INCREMENT,
  TipoEstado VARCHAR(20) NULL,
  Descripcion VARCHAR(20) NULL,
  PRIMARY KEY(EstadoID)
);

CREATE TABLE Usuario_has_Sede (
  Usuario_UsuarioID INT NOT NULL,
  Sede_SedeID INT NOT NULL,
  PRIMARY KEY(Usuario_UsuarioID, Sede_SedeID),
  INDEX Usuario_has_Sede_FKIndex1(Usuario_UsuarioID),
  INDEX Usuario_has_Sede_FKIndex2(Sede_SedeID),
  FOREIGN KEY(Usuario_UsuarioID)
    REFERENCES Usuario(UsuarioID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Sede_SedeID)
    REFERENCES Sede(SedeID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Rol_has_Usuario (
  Rol_RolID INT NOT NULL,
  Usuario_UsuarioID INT NOT NULL,
  Estado VARCHAR(20) NULL,
  PRIMARY KEY(Rol_RolID, Usuario_UsuarioID),
  INDEX Rol_has_Usuario_FKIndex1(Rol_RolID),
  INDEX Rol_has_Usuario_FKIndex2(Usuario_UsuarioID),
  FOREIGN KEY(Rol_RolID)
    REFERENCES Rol(RolID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Usuario_UsuarioID)
    REFERENCES Usuario(UsuarioID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Elemento (
  ElementoID INT NOT NULL AUTO_INCREMENT,
  TipoElemento_TipoElementoID INT NOT NULL,
  Estado_EstadoID INT NOT NULL,
  Marca VARCHAR(20) NULL,
  Descripcion VARCHAR(20) NULL,
  PRIMARY KEY(ElementoID),
  INDEX Elemento_FKIndex1(Estado_EstadoID),
  INDEX Elemento_FKIndex2(TipoElemento_TipoElementoID),
  FOREIGN KEY(Estado_EstadoID)
    REFERENCES Estado(EstadoID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(TipoElemento_TipoElementoID)
    REFERENCES TipoElemento(TipoElementoID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Ambiente (
  AmbienteID INT NOT NULL AUTO_INCREMENT,
  Elemento_ElementoID INT NOT NULL,
  Especialidad VARCHAR(20) NULL,
  ElementoID INT NULL,
  PRIMARY KEY(AmbienteID),
  INDEX Ambiente_FKIndex1(Elemento_ElementoID),
  FOREIGN KEY(Elemento_ElementoID)
    REFERENCES Elemento(ElementoID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Ambiente_has_Sede (
  Ambiente_AmbienteID INT NOT NULL,
  Sede_SedeID INT NOT NULL,
  PRIMARY KEY(Ambiente_AmbienteID, Sede_SedeID),
  INDEX Ambiente_has_Sede_FKIndex1(Ambiente_AmbienteID),
  INDEX Ambiente_has_Sede_FKIndex2(Sede_SedeID),
  FOREIGN KEY(Ambiente_AmbienteID)
    REFERENCES Ambiente(AmbienteID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Sede_SedeID)
    REFERENCES Sede(SedeID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


