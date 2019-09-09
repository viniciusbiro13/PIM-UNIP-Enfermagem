create database SistemaPim
go
use SistemaPim
go

CREATE TABLE Consulta (
idConsulta INT PRIMARY KEY identity (1,1),
nomeAcampanhante VARCHAR(50),
horarioAtendimento DATETIME,
fk_idAgendamento_Agendamento INT
)

CREATE TABLE Agendamento (
idAgendamento INT PRIMARY KEY identity (1,1),
horarioMarcado DATETIME,
tipo VARCHAR(15),
statusAtendimento VARCHAR(20),
fk_codigoPaciente_Paciente INT,
fk_idFuncionario_Funcionario INT
)

CREATE TABLE Funcionario (
idFuncionario INT PRIMARY KEY identity (1,1),
senha VARCHAR(100),
tipo VARCHAR(30),
RA VARCHAR(7),
login VARCHAR(20),
coren VARCHAR(11),
funcional VARCHAR(11),
fk_idPessoa_Pessoa INT
)

CREATE TABLE Telefone (
idTelefone INT PRIMARY KEY identity (1,1),
numero VARCHAR(11),
tipo VARCHAR(15),
fk_idPessoa_Pessoa INT
)

CREATE TABLE Endereço (
idEndereco INT PRIMARY KEY identity (1,1),
cidade VARCHAR(50),
cep INT,
rua VARCHAR(100),
complemento VARCHAR(50),
bairro VARCHAR(50),
numero INT,
estado VARCHAR(2),
fk_idPessoa_Pessoa INT
)

CREATE TABLE Anamnese (
idAnamnese INT PRIMARY KEY identity (1,1),
atividadeFisica BIT,
moradia VARCHAR(30),
drogas BIT,
atividadeFisicaDesc VARCHAR(100),
drogasDesc VARCHAR(100),
atividadeFisicaFreq VARCHAR(30),
drogasFreq VARCHAR(30),
trabalhadoresMoradia TEXT,
pessoasMoradia TEXT,
descanco BIT,
descancoHoras INT,
PN INT,
DUM DATETIME,
G INT,
PC INT,
A INT,
alimentacao TEXT,
examePreventivoData DATETIME,
examePreventivo BIT,
engravidou BIT,
menarca INT,
virgindade INT,
fk_idConsulta_Consulta INT,
)

CREATE TABLE Paciente (
codigoPaciente INT PRIMARY KEY identity (1,1),
filiacaoMae VARCHAR(50),
conjuge VARCHAR(50),
filiacaoPai VARCHAR(50),
profissao VARCHAR(10),
escolaridade VARCHAR(50),
observacoes TEXT,
fk_idPessoa_Pessoa INT
)

CREATE TABLE Pessoa (
idPessoa INT PRIMARY KEY identity (1,1),
nome VARCHAR(30),
sobrenome VARCHAR(50),
naturalidade VARCHAR(40),
CPF VARCHAR(20),
email VARCHAR(100),
sexo VARCHAR(30),
estadoCivil VARCHAR(20),
dataNascimento DATETIME
)
go

ALTER TABLE Consulta ADD FOREIGN KEY(fk_idAgendamento_Agendamento) REFERENCES Agendamento (idAgendamento)
ALTER TABLE Agendamento ADD FOREIGN KEY(fk_codigoPaciente_Paciente) REFERENCES Paciente (codigoPaciente)
ALTER TABLE Agendamento ADD FOREIGN KEY(fk_idFuncionario_Funcionario) REFERENCES Funcionario (idFuncionario)
ALTER TABLE Funcionario ADD FOREIGN KEY(fk_idPessoa_Pessoa) REFERENCES Pessoa (idPessoa)
ALTER TABLE Telefone ADD FOREIGN KEY(fk_idPessoa_Pessoa) REFERENCES Pessoa (idPessoa)
ALTER TABLE Endereço ADD FOREIGN KEY(fk_idPessoa_Pessoa) REFERENCES Pessoa (idPessoa)
ALTER TABLE Paciente ADD FOREIGN KEY(fk_idPessoa_Pessoa) REFERENCES Pessoa (idPessoa)
ALTER TABLE Anamnese ADD FOREIGN KEY(fk_idConsulta_Consulta) REFERENCES Consulta (idConsulta)
go

Insert into Pessoa
values ('Sandro', 'Somogyi', 'Brasileiro', '0000000', 'sandro@teste.com', 'Masculino', 'Solteiro', '19980429')
go



Insert into Funcionario
values('admin', 'Admin', '000000', 'admin', '0000000', '0000000', '1')
go

select * from Funcionario

select * from Pessoa