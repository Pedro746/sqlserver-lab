-- Bloco para criar a tabela caso nao exista
if object_id('Testes.tabuada', 'U') is not null
	create table tabuada(
		id int identity primary key,
		multiplicando int,
		operacao char(1) default('x'),
		multiplicador int,
		resultado int
	)

else
	print 'Tabela existe'

-- Bloco para Truncar a tabela caso tenha dados
declare @count int 
set @count = (select count(*) from tabuada)

if (@count = 0)
	print 'Tabela nao continha dados pare ser truncada'
else
	print 'Tabela truncada'
	truncate table tabuada	


-- Bloco para inserir dados na tabela caso esteja vazia
declare @tabuada int = 1
declare @multiplicado int
declare @resultado int


while (@tabuada <= 10)

	begin
		set @multiplicado = 1
		while(@multiplicado <= 10)
			begin
				set @resultado = @tabuada * @multiplicado
				--print cast(@tabuada as nvarchar) + ' x ' + cast(@multiplicado as nvarchar) + ' = ' + cast(@resultado as nvarchar)
				
				insert into tabuada (
					multiplicando,
					multiplicador,
					resultado
				) values(
					@tabuada,
					@multiplicado,
					@resultado
				)

				set @multiplicado = @multiplicado + 1
			end
	set @tabuada = @tabuada + 1
	end

select 
	multiplicando,
	multiplicador,
	resultado
from 
	tabuada
