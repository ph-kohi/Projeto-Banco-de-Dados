USE laboratorio_protese;

-- ================================
-- TESTE 1: Inserções básicas
-- ================================

INSERT INTO CLIENTE (nome, cpf, data_nascimento, telefone) VALUES
('Carlos Silva', '12345678901', '1990-05-10', '11999999999'),
('Ana Pereira', '98765432100', '1985-08-22', '11988888888');

INSERT INTO DENTISTA (nome, cro, telefone) VALUES
('Dr. João Almeida', 'CRO12345', '11977777777'),
('Dra. Marina Santos', 'CRO54321', '11966666666');

INSERT INTO PROTETICO (nome, especialidade) VALUES
('Roberto Lima', 'Coroa'),
('Paula Costa', 'Prótese Total');

-- ================================
-- TESTE 2: Criando pedidos
-- ================================

CALL registrar_pedido(1, 1);
CALL registrar_pedido(2, 2);

-- ================================
-- TESTE 3: Inserindo próteses
-- ================================

INSERT INTO PROTESE (tipo, material, cor, id_pedido) VALUES
('FIXA', 'Porcelana', 'A2', 1),
('IMPLANTE', 'Titânio', 'A3', 1),
('TOTAL', 'Resina', 'A1', 2);

-- ================================
-- TESTE 4: Associando protéticos aos pedidos
-- ================================

INSERT INTO PEDIDO_PROTETICO VALUES
(1, 1, 'Escultura'),
(1, 2, 'Finalização'),
(2, 2, 'Montagem');

-- ================================
-- TESTE 5: Criando etapas de produção
-- ================================

INSERT INTO ETAPA_PRODUCAO (nome_etapa, data_inicio, status_etapa, id_pedido) VALUES
('Moldagem', '2025-11-20', 'EM ANDAMENTO', 1),
('Estrutura', '2025-11-21', 'EM ANDAMENTO', 1),
('Acrilização', '2025-11-22', 'EM ANDAMENTO', 2);

-- ================================
-- TESTE 6: Testar trigger de finalização
-- ================================

UPDATE ETAPA_PRODUCAO 
SET status_etapa = 'CONCLUIDO', data_fim = CURDATE()
WHERE id_etapa = 1;

UPDATE ETAPA_PRODUCAO 
SET status_etapa = 'CONCLUIDO', data_fim = CURDATE()
WHERE id_etapa = 2;

-- Agora, pedido 1 deve virar FINALIZADO automaticamente
SELECT id_pedido, status_pedido FROM PEDIDO WHERE id_pedido = 1;

-- ================================
-- TESTE 7: Trigger de bloqueio de prótese
-- ================================

UPDATE PEDIDO
SET status_pedido = 'CANCELADO'
WHERE id_pedido = 2;

-- Essa inserção deve gerar ERRO
INSERT INTO PROTESE (tipo, material, cor, id_pedido)
VALUES ('FIXA', 'Cerâmica', 'B1', 2);

-- ================================
-- TESTE 8: Testando as Views
-- ================================

SELECT * FROM vw_pedidos_completos;

SELECT * FROM vw_andamento_producao;

-- ================================
-- TESTE 9: Consultas acadêmicas interessantes
-- ================================

-- Pedidos por dentista
SELECT 
    d.nome AS Dentista,
    COUNT(p.id_pedido) AS Total_Pedidos
FROM PEDIDO p
JOIN DENTISTA d ON p.id_dentista = d.id_dentista
GROUP BY d.nome;

-- Protéticos por pedido
SELECT 
    p.id_pedido,
    pr.nome AS Protetico,
    pp.funcao
FROM PEDIDO p
JOIN PEDIDO_PROTETICO pp ON p.id_pedido = pp.id_pedido
JOIN PROTETICO pr ON pp.id_protetico = pr.id_protetico;

-- Etapas em andamento
SELECT * 
FROM ETAPA_PRODUCAO
WHERE status_etapa = 'EM ANDAMENTO';
