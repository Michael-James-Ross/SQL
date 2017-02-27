insert into employee values(25348, 'Matthew', 'Smith','d3'),
						   (10102, 'Ann', 'Jones','d3'),
						   (18316, 'John', 'Barrimore', 'd1'),
						   (29346, 'James', 'James', 'd2'),
						   (9031, 'Elsa', 'Bertoni', 'd2'),
						   (2581, 'Elke', 'Hansel', 'd2'),
						   (28559, 'Sybill', 'Moser', 'd1')

insert into department values ('d1', 'research','Dallas'),
							  ('d2', 'accounting', 'Seattle'),
						      ('d3', 'marketing', 'Dallas')

insert into project values ('p1', 'Apollo', 120000.00),
						   ('p2', 'Gemini', 95000.00),
						   ('p3', 'Mercury', 186500.00)

insert into works_on values (10102,'p1', 'analyst', '2006.10.1'),
							(10102, 'p3', 'manager', '2008.1.1'),
							(25348, 'p2', 'clerk', '2007.2.15'),
							(18316, 'p2', NULL, '2007.6.1'),
							(29346, 'p2', NULL, '2006.12.15'),
							(2581, 'p3', 'analyst', '2007.10.15'),
							(9031, 'p1', 'manager', '2007.4.15'),
							(28559, 'p1', NULL, '2007.8.1'),
							(28559, 'p2', 'clerk', '2008.2.1'),
							(9031, 'p3', 'clerk', '2006.11.15'),  
							(29346, 'p1','clerk', '2007.1.4')