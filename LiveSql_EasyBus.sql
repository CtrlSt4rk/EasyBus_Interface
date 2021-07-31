create table Pessoa (
    cpf                 number(11)      constraint Pessoa_cpf_pk primary key,
    nome                varchar2(100)   constraint Pessoa_nome_nu not null,
    celular             number(11)      constraint Pessoa_celular_nu not null,
    email               varchar2(100)   constraint Pessoa_email_nu not null,
    senha               varchar2(25)    constraint Pessoa_senha_nu not null,
    cartaoCredito       number(16),
    saldo               number(20,2)    default 0
);

create table Onibus (
    idOnibus            number(5)       constraint Onibus_idOnibus_pk primary key,
    scannerQrCode       varchar2(30)    constraint Onibus_scannerQrCode_nu not null
);

create table Passagem (
    comprovanteCompra   number(10)      constraint Passagem_comprovanteCompra_pk primary key,
    valor               number(5,2)     constraint Passagem_valor_nu not null,
    horario             number(6)       constraint Passagem_horario_nu not null,
    dia                 number(2)       constraint Passagem_dia_nu not null,
    mes                 number(2)       constraint Passagem_mes_nu not null,
    ano                 number(4)       constraint Passagem_ano_nu not null,
    cpf                 number(11)      constraint Passagem_cpf_fk references Pessoa(cpf),
    idOnibus            number(5)       constraint Passagem_idOnibus_fk references Onibus(idOnibus)
);

create table Recarga (
    comprovanteRecarga  number(10)      constraint Recarga_comprovanteRecarga_pk primary key,
    valor               number(5,2)     constraint Recarga_valor_nu not null,
    tipo                varchar2(1)     constraint Recarga_tipo_nu not null,
    horario             number(6)       constraint Recarga_horario_nu not null,
    dia                 number(2)       constraint Recarga_dia_nu not null,
    mes                 number(2)       constraint Recarga_mes_nu not null,
    ano                 number(4)       constraint Recarga_ano_nu not null,
    cpf                 number(11)      constraint Recarga_cpf_fk references Pessoa(cpf)
);

create table GiftCard (
    giftCode            varchar2(12)    constraint GiftCard_giftCode_pk primary key,
    valor               number(5,2)     constraint GiftCard_valor_nu not null
);

create or replace trigger Atualiza_Saldo_Recarga
after insert on Recarga
for each row
begin
update Pessoa
set saldo = saldo + :new.valor
where cpf = :new.cpf;
end;
/

create or replace trigger Atualiza_Saldo_Passagem
after insert on Passagem
for each row
begin
update Pessoa
set saldo = saldo - :new.valor
where cpf = :new.cpf;
end;
/
################################################################################

insert into Pessoa values ('12345678913', 'Josinei da Silva', 14900005678,
    'josinei.silva@gmail.com', '123456789', 1456456962541458, 0);
insert into Pessoa values ('12365895478', 'Maria da Silva', 14900005478, 
    'maria.silva@gmail.com', '1234', 5968456962541728, 5);
insert into Pessoa values ('12345676325', 'Rafael Ferreira', 14900004582, 
    'rafaelferreira@bol.com', 'qwerty123', 1456413252541458, 63.5);
insert into Pessoa values ('12345677856', 'Denis Coutinho', 14900001234, 
    'denis.coutinho@gmail.com', 'poo9', 1456456962548523, 10);
insert into Pessoa values ('12345668973', 'Matheus dos Santos', 14900005678, 
    'mateus.santos@gmail.com', 'isaac123', 1416456962548698, 6.9);

insert into Onibus values(12342, '100000000075000000000000000400');
insert into Onibus values(12349, '200000000000000096000000000007');
insert into Onibus values(12346, '700056000000000009600000000009');
insert into Onibus values(12323, '200000000000000096000000000007');
insert into Onibus values(12332, '500000000000000096000050000007');

insert into Passagem values(1234512345, 4.2, 124056, 26, 
    07, 2022, 12345678913, 12342);
insert into Passagem values(1234512365, 2.1, 124057, 27, 
    07, 2022, 12365895478, 12342);
insert into Passagem values(1234512389, 4.2, 124058, 28, 
    07, 2022, 12345676325, 12332);
insert into Passagem values(1234512377, 8.4, 124046, 29, 
    07, 2023, 12345677856, 12342);
insert into Passagem values(1234512323, 4.2, 114056, 29, 
    07, 2022, 12345668973, 12346);

insert into Recarga values(1234554321, 4.2, 'I', 
    124056, 26, 07, 2022, 12345678913);
insert into Recarga values(1234512365, 2.1, 'D', 
    124057, 27, 07, 2022, 12365895478);
insert into Recarga values(1234512389, 4.2, 'M', 
    124058, 28, 07, 2022, 12345676325);
insert into Recarga values(1234512377, 8.4, 'F', 
    124046, 29, 07, 2023, 12345677856);
insert into Recarga values(1234512323, 4.2, 'F', 
    114056, 29, 07, 2022, 12345668973);

insert into GiftCard values('AAAAAAAAAAAA', 50);
insert into GiftCard values('BBBBBBBBBBBB', 10);
insert into GiftCard values('CCCCCCCCCCCC', 25);
insert into GiftCard values('DDDDDDDDDDDD', 5);
insert into GiftCard values('EEEEEEEEEEEE', 4.2);


update pessoa
set saldo = 10
where  cpf = 12345678913;
update Onibus
set scannerQrCode = '999000000075000000090000000400'
where  idOnibus = 12342;
update GiftCard
set valor = 5
where  giftCode = 'AAAAAAAAAAAA';
insert into Passagem values(1234517305, 5, 124056, 26, 07, 
    2022, 12345678913, 12342);
insert into Recarga values(1234554021, 8, 'I', 124056, 26, 
    07, 2022, 12345678913);


select Pessoa.CPF, Pessoa.Nome, Recarga.Comprovanterecarga 
from Pessoa, Recarga 
where Recarga.CPF=Pessoa.CPF

select CPF, Email, Nome, Senha 
from Pessoa

select Pessoa.CPF, Pessoa.saldo, Passagem.valor, Passagem.comprovanteCompra 
from Pessoa, Passagem 
where Pessoa.CPF=Passagem.CPF and Pessoa.saldo>Passagem.valor

select p.saldo
from pessoa p
where p.cpf = 12345678913;''

select p.nome
from pessoa p, passagem pa
where p.cpf = 12365895478 and p.cpf = pa.cpf and ano = 2023;


delete from GiftCard where giftCode = 'BBBBBBBBBBBB';
delete from Passagem where cpf = 12345668973;
delete from Recarga where cpf = 12345668973;
delete from Pessoa where cpf = 12345668973;
