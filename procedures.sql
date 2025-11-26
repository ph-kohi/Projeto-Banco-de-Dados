DELIMITER $$

CREATE PROCEDURE registrar_pedido(
    IN p_id_cliente INT,
    IN p_id_dentista INT
)
BEGIN
    INSERT INTO PEDIDO (data_pedido, status_pedido, id_cliente, id_dentista)
    VALUES (CURDATE(), 'ABERTO', p_id_cliente, p_id_dentista);
END$$

DELIMITER ;
