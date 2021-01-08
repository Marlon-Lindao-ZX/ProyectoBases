use proyecto;
create index Facturacion on factura(fecha);

create user 'k_quintero'@'localhost' identified by 'zeke414';
GRANT SELECT, UPDATE, DELETE,INSERT ON proyecto.* TO 'k_quintero'@'localhost';
FLUSH privileges; 