
-- Gerando uma tabuada com WHILE

declare @tab int = 1
declare @multiplicado int
declare @resultado int

while(@tab <= 10)
	begin
		set @multiplicado = 1
		while(@multiplicado <= 10)
		begin
			set @resultado = @tab * @multiplicado
			print cast(@tab as nvarchar) + ' x ' + cast(@multiplicado as nvarchar) + ' = ' + cast(@resultado as nvarchar)
			set @multiplicado = @multiplicado + 1
		end
		set @tab = @tab + 1
	end