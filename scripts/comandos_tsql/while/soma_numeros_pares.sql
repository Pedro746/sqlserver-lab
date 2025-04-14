-- Soma de numeros pares

declare @num int = 1
declare @soma int = 0
while(@num <= 1000)
	begin
		if(@num % 2 = 0)
			set @soma = @soma + @num		
		set @num = @num + 1
	end


print 'A soma de todos os numero pares de 1 a 100 e ' + cast(@soma as nvarchar)