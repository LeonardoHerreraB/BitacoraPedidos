-- auto-generated definition
-- create schema public;

-- comment on schema public is 'standard public schema';

-- alter schema public owner to pg_database_owner;

--public."HrBitPed" definition

-- Drop table
DROP  TABLE if exists "HrBitPed" CASCADE ;
DROP TABLE if exists  public.ZonaBtPe CASCADE;
DROP TABLE if exists  public.VenBtPe CASCADE;
DROP TABLE if exists  public.SucuBtPe CASCADE;
DROP TABLE if exists  public.PaisBtPe CASCADE;
DROP TABLE if exists  public.OfiBtPe CASCADE;
DROP TABLE if exists  public.GrupBtPe CASCADE;
DROP TABLE if exists  public.CiudBtPe CASCADE;
DROP TABLE if exists  public.ClieBtPe CASCADE;
DROP TABLE if exists  public.PrdBtPe CASCADE;
DROP TABLE if exists public.ClasBtPe CASCADE;


-- Creación de tables
CREATE TABLE public."HrBitPed" (
	PAIS int4 NOT NULL,
	stamp_fecha date NOT NULL,
	tasa float,
	usuario varchar(8),
	Nacional_NDocumentos int4,
	Nacional_Kilos float,
	Nacional_UnidadesE int4,
	Nacional_Valor money,
	Exterior_NDocumentos int4,
	Exterior_Kilos float,
	Exterior_UnidadesE int4,
	Exterior_Valor money,
	ProformasN_NDocumentos int4,
	ProformasN_Kilos float,
	ProformasN_UnidadesE int4,
	ProformasN_Valor money,
	ProformasE_NDocumentos int4,
	ProformasE_Kilos float,
	ProformasE_UnidadesE int4,
	ProformasE_Valor money,
	CONSTRAINT hrbitped_pk PRIMARY KEY (PAIS, stamp_fecha)
); --header
CREATE INDEX IF NOT EXISTS "si_Fecha" ON public."HrBitPed"("stamp_fecha");

CREATE TABLE public."ClasBtPe" (
    PAIS                int4 NOT NULL,
    stamp_fecha           date NOT NULL,
    familia               int4,
    codigo                int4,
    Nombre                varchar(30),
    Pedidos_NDocumentos   int4,
    Pedidos_Kilos         float,
    Pedidos_UnidadesE     int4,
    Peidos_Valor          money,
    Proformas_NDocumentos int4,
    Proformas_Kilos       float,
    Proformas_UnidadesE   int4,
    Proformas_Valor       money,
    CONSTRAINT Clasbtpe_pk PRIMARY KEY (PAIS, stamp_fecha, familia, codigo),
    CONSTRAINT "fk_DeBitacoraHDR" FOREIGN KEY (PAIS, "stamp_fecha")
        REFERENCES public."HrBitPed" (PAIS, "stamp_fecha") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
); --Clase
CREATE INDEX IF NOT EXISTS "fki_ClaseHdr" ON public."ClasBtPe"(PAIS, "stamp_fecha", familia, codigo);
CREATE INDEX IF NOT EXISTS "si_FechaClase" ON public."ClasBtPe"("stamp_fecha");
CREATE INDEX IF NOT EXISTS "si_Clase" ON public."ClasBtPe"(familia,codigo, stamp_fecha);


CREATE TABLE public."PrdBtPe" (
    PAIS                  int4 NOT NULL,
    stamp_fecha             date NOT NULL,
    Codigo                  int4,
    Referencia              varchar(20),
    Nacional_NDocumentos    int4,
	Nacional_Kilos          float,
	Nacional_UnidadesE      int4,
	Nacional_Valor          money,
	Exterior_NDocumentos    int4,
	Exterior_Kilos          float,
	Exterior_UnidadesE      int4,
	Exterior_Valor          money,
	ProformasN_NDocumentos  int4,
	ProformasN_Kilos        float,
	ProformasN_UnidadesE    int4,
	ProformasN_Valor        money,
	ProformasE_NDocumentos  int4,
	ProformasE_Kilos        float,
	ProformasE_UnidadesE    int4,
	ProformasE_Valor        money,
    CONSTRAINT "ProductoBte_pk" PRIMARY KEY (PAIS, stamp_fecha, codigo),
    CONSTRAINT "fk_PrdABitacoraHDR" FOREIGN KEY (PAIS, "stamp_fecha")  REFERENCES public."HrBitPed" (PAIS, "stamp_fecha") MATCH SIMPLE  ON UPDATE CASCADE ON DELETE CASCADE
); -- producto
CREATE INDEX IF NOT EXISTS "fki_ProductoHdr" ON public."PrdBtPe"(PAIS, "stamp_fecha", Codigo);
CREATE INDEX IF NOT EXISTS "si_Fecha" ON public."PrdBtPe"("stamp_fecha");
CREATE INDEX IF NOT EXISTS "si_Producto_Codigo" ON public."PrdBtPe"(codigo, stamp_fecha);
CREATE INDEX IF NOT EXISTS "si_Producto_Referencia" ON public."PrdBtPe"(Referencia,stamp_fecha);


CREATE TABLE public."ClieBtPe" (
    PAIS                int4 NOT NULL,
    stamp_fecha           date NOT NULL,
    RFC                   varchar(13),
    RazonSocial           varchar(75),
    DiasAlPago            int4,
    DiasCredito           int4,
    Pedidos_NDocumentos   int4,
    Pedidos_Kilos         float,
    Pedidos_UnidadesE     int4,
    Peidos_Valor          money,
    Proformas_NDocumentos int4,
    Proformas_Kilos       float,
    Proformas_UnidadesE   int4,
    Proformas_Valor       money,
    CONSTRAINT "ClieBtPe_pk" PRIMARY KEY (PAIS, stamp_fecha, RFC),
    CONSTRAINT "fk_Cli_a_BitacoraHDR" FOREIGN KEY (PAIS, "stamp_fecha")
        REFERENCES public."HrBitPed" (PAIS, "stamp_fecha") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);--Cliente
CREATE INDEX IF NOT EXISTS "fki_clienteHdr" ON public."ClieBtPe"(PAIS, "stamp_fecha",RFC);
CREATE INDEX IF NOT EXISTS "si_FechaCliente" ON public."ClieBtPe"("stamp_fecha");
CREATE INDEX IF NOT EXISTS "si_RFC" ON public."ClieBtPe"(RFC, stamp_fecha);
CREATE INDEX IF NOT EXISTS "si_ClienteRZ" ON public."ClieBtPe"(RazonSocial,stamp_fecha);


CREATE TABLE public."CiudBtPe" (
    PAIS                int4 NOT NULL,
    stamp_fecha           date NOT NULL,
    sPais                 int4,
    Provincia             int4,
    Codigo                int4,
    Nombre                varchar(30),
    Pedidos_NDocumentos   int4,
    Pedidos_Kilos         float,
    Pedidos_UnidadesE     int4,
    Peidos_Valor          money,
    Proformas_NDocumentos int4,
    Proformas_Kilos       float,
    Proformas_UnidadesE   int4,
    Proformas_Valor       money,
    CONSTRAINT "CiudBtPe_pk" PRIMARY KEY (PAIS, stamp_fecha, sPais, provincia, codigo),
    CONSTRAINT "fk_CiudadABitacoraHDR" FOREIGN KEY (PAIS, "stamp_fecha") REFERENCES "HrBitPed" (PAIS, "stamp_fecha") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);--Ciudad
CREATE INDEX IF NOT EXISTS "fki_Ciudad_Hdr" ON public."CiudBtPe"(PAIS, "stamp_fecha",sPais, provincia, codigo);
CREATE INDEX IF NOT EXISTS "si_FechaCiudad" ON public."CiudBtPe"("stamp_fecha");
CREATE INDEX IF NOT EXISTS "si_CiudadNm" ON public."CiudBtPe"(Nombre,stamp_fecha);



CREATE TABLE public."GrupBtPe" (
    PAIS                  int4 NOT NULL,
    stamp_fecha           date NOT NULL,
    Codigo                int4,
    Nombre                varchar(30),
    Pedidos_NDocumentos   int4,
    Pedidos_Kilos         float,
    Pedidos_UnidadesE     int4,
    Peidos_Valor          money,
    Proformas_NDocumentos int4,
    Proformas_Kilos       float,
    Proformas_UnidadesE   int4,
    Proformas_Valor       money,
    CONSTRAINT "GrupBtPe_pk" PRIMARY KEY (PAIS, stamp_fecha, codigo),
    CONSTRAINT "fk_GrupoABitacoraHDR" FOREIGN KEY (PAIS, "stamp_fecha")
        REFERENCES public."HrBitPed" (PAIS, "stamp_fecha") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);--Grupo
CREATE INDEX IF NOT EXISTS "fki_Grupo_Hdr" ON public."GrupBtPe"(PAIS, "stamp_fecha", codigo);
CREATE INDEX IF NOT EXISTS "si_FechaGrupo" ON public."GrupBtPe"("stamp_fecha");
CREATE INDEX IF NOT EXISTS "si_GrupoNm" ON public."GrupBtPe"(Nombre,stamp_fecha);


CREATE TABLE public."OfiBtPe" (
    PAIS                  int4 NOT NULL,
    stamp_fecha           date NOT NULL,
    Codigo                int4,
    Nombres               varchar(30),
    Pedidos_NDocumentos   int4,
    Pedidos_Kilos         float,
    Pedidos_UnidadesE     int4,
    Peidos_Valor          money,
    Proformas_NDocumentos int4,
    Proformas_Kilos       float,
    Proformas_UnidadesE   int4,
    Proformas_Valor       money,
    CONSTRAINT "OfiBtPe_pk" PRIMARY KEY (PAIS, stamp_fecha, codigo),
    CONSTRAINT "fk_OficinaABitacoraHDR" FOREIGN KEY (PAIS, "stamp_fecha")
        REFERENCES public."HrBitPed" (PAIS, "stamp_fecha") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);--Oficina
CREATE INDEX IF NOT EXISTS "fki_Oficina_Hdr" ON public."OfiBtPe"(PAIS, "stamp_fecha", codigo);
CREATE INDEX IF NOT EXISTS "si_FechaOficina" ON public."OfiBtPe"("stamp_fecha");
CREATE INDEX IF NOT EXISTS "si_OficinaNm" ON public."OfiBtPe"(Nombres,stamp_fecha);

CREATE TABLE public."PaisBtPe" (
    PAIS                  int4 NOT NULL,
    stamp_fecha           date NOT NULL,
    Codigo                int4,
    Nombres               varchar(30),
    Pedidos_NDocumentos   int4,
    Pedidos_Kilos         float,
    Pedidos_UnidadesE     int4,
    Peidos_Valor          money,
    Proformas_NDocumentos int4,
    Proformas_Kilos       float,
    Proformas_UnidadesE   int4,
    Proformas_Valor       money,
    CONSTRAINT "PaisBtPe_pk" PRIMARY KEY (PAIS, stamp_fecha, codigo),
    CONSTRAINT "fk_PaisABitacoraHDR" FOREIGN KEY (PAIS, "stamp_fecha")
        REFERENCES public."HrBitPed" (PAIS, "stamp_fecha") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);--Pais
CREATE INDEX IF NOT EXISTS "fki_Pais_Hdr" ON public."PaisBtPe"(PAIS, "stamp_fecha", codigo);
CREATE INDEX IF NOT EXISTS "si_FechaPais" ON public."PaisBtPe"("stamp_fecha");
CREATE INDEX IF NOT EXISTS "si_PaisNm" ON public."PaisBtPe"(Nombres,stamp_fecha);

CREATE TABLE public."SucuBtPe"(
    PAIS                  int4 NOT NULL,
    stamp_fecha           date NOT NULL,
    ClienteId             int4,
    Codigo                int4,
    Nombres               varchar(30),
    Pedidos_NDocumentos   int4,
    Pedidos_Kilos         float,
    Pedidos_UnidadesE     int4,
    Peidos_Valor          money,
    Proformas_NDocumentos int4,
    Proformas_Kilos       float,
    Proformas_UnidadesE   int4,
    Proformas_Valor       money,
    CONSTRAINT "SucursalBtPe_pk" PRIMARY KEY (PAIS, stamp_fecha, ClienteId, Codigo),
    CONSTRAINT "fk_SucursalABitacoraHDR" FOREIGN KEY (PAIS, "stamp_fecha")
        REFERENCES public."HrBitPed" (PAIS, "stamp_fecha") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);--Sucursal
CREATE INDEX IF NOT EXISTS "fki_Sucursal_Hdr" ON public."SucuBtPe"(PAIS, "stamp_fecha", ClienteId,codigo);
CREATE INDEX IF NOT EXISTS "si_FechaSucursal" ON public."SucuBtPe"("stamp_fecha");
CREATE INDEX IF NOT EXISTS "si_SucursalNm" ON public."SucuBtPe"(Nombres,stamp_fecha);
CREATE INDEX IF NOT EXISTS "si_ClienteDeSucursal" ON public."SucuBtPe"(ClienteId,stamp_fecha);

CREATE TABLE public."VenBtPe"(
    PAIS                  int4 NOT NULL,
    stamp_fecha           date NOT NULL,
    Identificacion        varchar(13),
    Nombres               varchar(50),
    Pedidos_NDocumentos   int4,
    Pedidos_Kilos         float,
    Pedidos_UnidadesE     int4,
    Peidos_Valor          money,
    Proformas_NDocumentos int4,
    Proformas_Kilos       float,
    Proformas_UnidadesE   int4,
    Proformas_Valor       money,
    CONSTRAINT "VendedorBtPe_pk" PRIMARY KEY (PAIS, stamp_fecha, Identificacion),
    CONSTRAINT "fk_VendedorABitacoraHDR" FOREIGN KEY (PAIS, "stamp_fecha")
        REFERENCES public."HrBitPed" (PAIS, "stamp_fecha") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);--Vendedores
CREATE INDEX IF NOT EXISTS "fki_Vendedor_Hdr" ON public."VenBtPe"(PAIS, "stamp_fecha", Identificacion);
CREATE INDEX IF NOT EXISTS "si_FechaVendedor" ON public."VenBtPe"("stamp_fecha");
CREATE INDEX IF NOT EXISTS "si_VendedorNm" ON public."VenBtPe"(Nombres,stamp_fecha);


CREATE TABLE public."ZonaBtPe"(
    PAIS                  int4 NOT NULL,
    stamp_fecha           date NOT NULL,
    Codigo                int4,
    Nombres               varchar(30),
    Pedidos_NDocumentos   int4,
    Pedidos_Kilos         float,
    Pedidos_UnidadesE     int4,
    Peidos_Valor          money,
    Proformas_NDocumentos int4,
    Proformas_Kilos       float,
    Proformas_UnidadesE   int4,
    Proformas_Valor       money,
    CONSTRAINT "ZonaBtPe_pk" PRIMARY KEY (PAIS, stamp_fecha, Codigo),
    CONSTRAINT "fk_ZonaABitacoraHDR" FOREIGN KEY (PAIS, "stamp_fecha")
        REFERENCES public."HrBitPed" (PAIS, "stamp_fecha") MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);--Zonas
CREATE INDEX IF NOT EXISTS "fki_Zona_Hdr" ON public."ZonaBtPe"(PAIS, "stamp_fecha", Codigo);
CREATE INDEX IF NOT EXISTS "si_FechaZona" ON public."ZonaBtPe"("stamp_fecha");
CREATE INDEX IF NOT EXISTS "si_ZonaNm" ON public."ZonaBtPe"(Nombres,stamp_fecha);
