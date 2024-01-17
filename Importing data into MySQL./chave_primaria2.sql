use projetoembraer;

select * from bd_aumentado_comercial;

ALTER TABLE bd_aumentado_comercial
	ADD id_comercial  int not null AUTO_INCREMENT primary key
    FIRST;
    
select * from bd_aumentado_comercial_exec;    

ALTER TABLE bd_aumentado_comercial_exec
	ADD id_comercial_exec  int not null AUTO_INCREMENT primary key
    FIRST;