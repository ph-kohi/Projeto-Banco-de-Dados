-- View 1 --
CREATE VIEW vw_pedidos_completos AS
SELECT 
    p.id_pedido,
    c.nome AS cliente,
    d.nome AS dentista,
    p.data_pedido,
    p.status_pedido
FROM PEDIDO p
JOIN CLIENTE c ON p.id_cliente = c.id_cliente
JOIN DENTISTA d ON p.id_dentista = d.id_dentista;

-- View 2 --
CREATE VIEW vw_andamento_producao AS
SELECT 
    e.id_etapa,
    e.nome_etapa,
    e.status_etapa,
    p.id_pedido,
    c.nome AS cliente
FROM ETAPA_PRODUCAO e
JOIN PEDIDO p ON e.id_pedido = p.id_pedido
JOIN CLIENTE c ON p.id_cliente = c.id_cliente;
