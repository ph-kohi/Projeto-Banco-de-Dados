Projeto desenvolvido para modelar, estruturar e testar um banco de dados completo para gerenciamento de um laboratório de próteses odontológicas.
Este projeto implementa um banco de dados relacional voltado ao controle de pedidos de próteses, etapas de produção, profissionais envolvidos (dentistas e protéticos) e informações de clientes.

Foram criadas:
- Tabelas com relacionamentos e restrições;
- Constraints para garantir integridade dos dados;
- Triggers para controle automático de regras de negócio;
- Stored Procedure para facilitar operações;
- Views para consultas otimizadas;
- Papéis (Roles) para gerenciamento de permissões;
- Script de Testes para validar todo o funcionamento.

Tecnologias Utilizadas:
MySQL 8+
SQL padrão (DDL, DML, DCL, TCL)
Recursos avançados:
CHECK Constraints
Procedures
Views
Triggers
Roles e permissões

Rodando o projeto:
Execute o comando SOURCE nos arquivos na seguinte ordem: tabelas.sql, constraints.sql, triggers.sql, procedures.sql, roles.sql e script.sql. Vale ressaltar que o arquivo Script.sql é somente um script básico para teste rapido com dados já definidos, sendo opcional.
