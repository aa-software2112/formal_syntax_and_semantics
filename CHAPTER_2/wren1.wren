	program switch is
		var sum,k : integer;
		var switch : boolean;
	begin
		switch := true; sum := 0; k := 1;
		while k<10 do
			switch := not(switch);
			if switch then sum := sum+k end if;
			k := k+1
		end while;
		write sum
	end