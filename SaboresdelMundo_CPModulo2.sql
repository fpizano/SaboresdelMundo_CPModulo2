/*Contexto*/

/*El restaurante "Sabores del Mundo", es conocido por su auténtica cocina y su ambiente
acogedor.*/

/*Este restaurante lanzó un nuevo menú a principios de año y ha estado recopilando
información detallada sobre las transacciones de los clientes para identificar áreas de
oportunidad y aprovechar al máximo sus datos para optimizar las ventas.*/


/*Objetivo*/


/*Identificar cuáles son los productos del menú que han tenido más éxito y cuales son los que
menos han gustado a los clientes.*/


/*Pasos a seguir*/


/*a) Crear la base de datos con el archivo create_restaurant_db.sql*/

/*b) Explorar la tabla “menu_items” para conocer los productos del menú.*/

select * from menu_items;

/*1.- Realizar consultas para contestar las siguientes preguntas:*/

/*● Encontrar el número de artículos en el menú.*/

select count (menu_item_id) from menu_items;

--R: 32 artículos en el menú.

/*● ¿Cuál es el artículo menos caro y el más caro en el menú?*/

select item_name, price from menu_items order by price asc limit 1;

select item_name, price from menu_items order by price desc limit 1;

--R: Shrimp Scampi - 19.95 y Edamame - 5.00.

/*● ¿Cuántos platos americanos hay en el menú?*/

select count (category) from menu_items where category = 'American';

--R: 6 platillos Americanos

/*● ¿Cuál es el precio promedio de los platos?*/

select round (avg (price),2) from menu_items;

--R: El precio promedio de los platillos es $13.29.

/*c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.*/

select * from order_details;

/*1.- Realizar consultas para contestar las siguientes preguntas:*/

/*● ¿Cuántos pedidos únicos se realizaron en total?*/

select count (distinct order_id) from order_details;

--R: 5,370 ordenes distintas.

/*● ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?*/

select distinct (order_id), count (item_id) from order_details 
group by distinct (order_id)
having count (item_id) = 14;

/*R: La cantidad máxima de artículos por pedido que se registro fue de 14, 
y se registraron un total de 7 pedidos con esta cantidad de artículos, 
siendo los siguientes: 330, 440, 443, 1957, 2675, 3473 y 4305*/

/*● ¿Cuándo se realizó el primer pedido y el último pedido?*/

select min (order_date) from order_details;

select max (order_date) from order_details;

select order_date from order_details order by order_date asc;
select order_date from order_details order by order_date desc;

/*R: El primer pedido se realizo el 01 de enero del 2023, mientras que; 
el ultimo el 31 de marzo del 2023.*/

/*● ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?*/

select count (distinct order_id) from order_details
where order_date between '2023-01-01' and '2023-01-05';

--R: 308 pedidos distintos. 

/*d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.*/

select * from order_details as od
inner join menu_items as mi
on od.item_id = mi.menu_item_id;

select * from order_details as od
left join menu_items as mi
on od.item_id = mi.menu_item_id
where price is null;

select * from order_details as od
right join menu_items as mi
on od.item_id = mi.menu_item_id
where order_id is null;

/*1.- Realizar un left join entre entre order_details y menu_items con el identificador
item_id(tabla order_details) y menu_item_id(tabla menu_items).*/

select * from order_details as od
left join menu_items as mi
on od.item_id = mi.menu_item_id;

select * from order_details as od
left join menu_items as mi
on od.item_id = mi.menu_item_id
where price is null;

select count (distinct order_id) from order_details as od
left join menu_items as mi
on od.item_id = mi.menu_item_id
where price is null;

/*e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las
preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas. 
El objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del
restaurante en el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y
utiliza los resultados obtenidos para llegar a estas conclusiones.*/

/* 1.- ¿Cuáles fueron los 5 platillos más vendidos?*/

select od.item_id, mi.item_name, mi.category, count (od.order_details_id) as total_platillos from order_details as od
left join menu_items as mi
on od.item_id = mi.menu_item_id
group by 1, 2, 3
order by 4 desc
limit 5;

/*101	"Hamburger"	"American"	622
113	"Edamame"	"Asian"	620
109	"Korean Beef Bowl"	"Asian"	588
102	"Cheeseburger"	"American"	583
106	"French Fries"	"American"	571*/


/*R: Los cinco platillos mas vendidos fueron Hamburguer (622), Edamame (620, 
Korean Beef Bowl (588), Cheeseburguer (583) y French Fries (571).*/

/* 2.- ¿Cuáles fueron los 3 platillos menos vendidos?*/

select od.item_id, mi.item_name, mi.category, count (od.order_details_id) as total_platillos from order_details as od
inner join menu_items as mi
on od.item_id = mi.menu_item_id
group by 1, 2, 3
order by 4 asc
limit 3;

/*R: Los tres platillos menos vendidos fueron Chicken Tacos (123), Potstickers (205) y
Cheese Lasagna (207).*/

/* 3.- ¿Cuáles fueron los 5 platillos con mayores ventas totales?*/

select od.item_id, mi.item_name, mi.category, sum (mi.price) as total_ventas from order_details as od
inner join menu_items as mi
on od.item_id = mi.menu_item_id
group by 1, 2, 3
order by 4 desc
limit 5;

/*	"Korean Beef Bowl"		"Asian"		10554.60
	"Spaghetti & Meatballs"	"Italian"	8436.50
	"Tofu Pad Thai"			"Asian"		8149.00
	"Cheeseburger"			"American"	8132.85
	"Hamburger"				"American"	8054.90*/

/*R: Los cinco platillos con mayores ventas totales fueron Korean Beef Bowl (10,554.60), 
Spaghetti and meatballs (8,436.50), Tofu Pad Thai (8,149.00), Cheeseburguer (8,132.85) 
y Hamburguer (8,054.00).*/ 

/* 4.- ¿Cuáles fueron los 3 platillos con menores ventas totales?*/

select od.item_id, mi.item_name, sum (mi.price) as total_ventas from order_details as od
inner join menu_items as mi
on od.item_id = mi.menu_item_id
group by 1, 2
order by 3 asc
limit 3;

/*R: Los tres platillos con menores ventas totales fueron Chicken Tacos (1,469.85), 
Potstickers (1,845.00) y Chips and Guacamole  (2,133.00).*/

/* 5.- ¿Que categorías vendierón mas platillos y acumularon la mayor cantidad 
de ventas totales?*/

select mi.category, sum (mi.price) as total_ventas from order_details as od
inner join menu_items as mi
on od.item_id = mi.menu_item_id
group by 1
order by 2 desc;

select mi.category, count (distinct od.order_details_id) as total_platillos from order_details as od
inner join menu_items as mi
on od.item_id = mi.menu_item_id
group by 1
order by 2 desc;


/*R: 	Ventas

		"Italian"	49,462.70
		"Asian"		46,720.65
		"Mexican"	34,796.80
		"American"	28,237.75

		Platillos

		"Asian"		3,470
		"Italian"	2,948
		"Mexican"	2,945
		"American"	2,734

/* Conclusiones:*/

/*En conclusión, es recomendable aumentar la cantidad de platillos y/o enfocarse 
en la categoría “Italian”, ya que con 522 platillos menos vendidos que la categoría 
“Asian”, registro 2,742.05 dólares más, posicionándose como la categoría número uno, 
mientras que en la posición dos, se colocó la categoría “Asian” la cual contine el 
segundo y tercer platillo con mayor cantidad de ventas y el primer y tercer platillo 
con mayores ventas totales registradas.*/

/*Dentro del top tres de platillos menos vendidos y con menor registro de ventas 
totales coinciden los Chicken Tacos y los Potstickers, por lo que se podría considerar 
su sustitución por algún otro platillo ya sea de las categorías con mayor utilidad o 
mayores ventas.*/

/*De igual forma, aunque la comida de la categoría “American” es la que registra 
la menor cantidad de platillos vendidos y la menor cantidad en ventas totales, tres 
de sus platillos se encuentran en el top 5 de platillos más vendidos (1er, 4to y 5to) 
así como en el top 5 de mayores ventas totales (4to y 5to), por lo que podría ser una 
opción viable intentar explotar más esos platillos y/o la categoría.*/

