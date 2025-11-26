-- Trigger 1 --
ALTER TABLE CLIENTE
ADD CONSTRAINT chk_cpf CHECK (LENGTH(cpf) = 11);

ALTER TABLE PEDIDO
ADD CONSTRAINT chk_status_pedido 
CHECK (status_pedido IN ('ABERTO', 'EM PRODUCAO', 'FINALIZADO', 'CANCELADO'));

ALTER TABLE ETAPA_PRODUCAO
ADD CONSTRAINT chk_datas_etapa
CHECK (data_fim IS NULL OR data_fim >= data_inicio);

ALTER TABLE PROTESE
ADD CONSTRAINT chk_tipo_protese
CHECK (tipo IN ('FIXA','MOVEL','IMPLANTE','TOTAL'));

-- Trigger 2 --
DELIMITER $$

CREATE TRIGGER tg_bloquear_protese
BEFORE INSERT ON PROTESE
FOR EACH ROW
BEGIN
    DECLARE status_atual VARCHAR(30);

    SELECT status_pedido INTO status_atual
    FROM PEDIDO
    WHERE id_pedido = NEW.id_pedido;

    IF status_atual = 'CANCELADO' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Não é permitido inserir prótese em pedido cancelado.';
    END IF;
END$$

DELIMITER ;
