CREATE ROLE protetico_role;

GRANT SELECT, INSERT, UPDATE ON laboratorio_protese.ETAPA_PRODUCAO TO protetico_role;
GRANT SELECT ON laboratorio_protese.vw_andamento_producao TO protetico_role;
GRANT protetico_role TO 'usuario_protetico'@'localhost';
SET DEFAULT ROLE protetico_role TO 'usuario_protetico'@'localhost';
