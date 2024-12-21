# SaboresdelMundo_CPModulo2


# Análisis de las ordenes del restaurante “Sabores del Mundo” de enero a marzo del 2023.


## Introducción.


El restaurante "Sabores del Mundo", es conocido por su auténtica cocina y su ambiente acogedor.

Este restaurante lanzó un nuevo menú a principios de año y ha estado recopilando información detallada sobre las transacciones de los clientes para identificar áreas de oportunidad y aprovechar al máximo sus datos para optimizar las ventas.


## Objetivo.


Identificar cuáles son los productos del menú que han tenido más éxito y cuales son los que
menos han gustado a los clientes.


## Desarrollo de preguntas.


### 1. **Crear la base de datos con el archivo create_restaurant_db.sql.**
   
Se crearon las dos bases de datos con los códigos proporcionados, una llamada menu_items, que contiene datos del menú, como son nombre del platillo, categoría, id y precio, y la segunda llamada orders_details, conteniendo datos detallados de cada una de las ordenes, como fecha, platillo, cantidad de platillos, etc.

### 2. **Explorar la tabla “menu_items” para conocer los productos del menú, realizando las consultas para contestar las siguientes preguntas:**

  - **Encontrar el número de artículos en el menú.**

El menú contiene 32 artículos en total.

  + __¿Cuál es el artículo menos caro y el más caro en el menú?__

El platillo de menor costo en el menú es el “Edemame” ($5.00) y el de mayor costo el “Shrimp Scampi” (19.95).

  - **¿Cuántos platos americanos hay en el menú?**

El menú contiene  seis platillos de la categoría “American”.

  - **¿Cuál es el precio promedio de los platos?**

El precio promedio de los platillos dentro del restaurante es de 13.29 dólares.

### 3. **Explorar la tabla “order_details” para conocer los datos que han sido recolectados realizando consultas para contestar las siguientes preguntas:**

- **¿Cuántos pedidos únicos se realizaron en total?**

En total se registraron 5 mil 370 pedidos únicos.

- **¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?**

La cantidad máxima de artículos en un mismo pedido fue de 14, y se tuvieron un total de 7 pedidos con esta cantidad de artículos (330, 440, 443, 1957, 2675, 3473 y 4305).

- **¿Cuándo se realizó el primer pedido y el último pedido?**

El primer pedido del que se tiene registro en nuestra base de datos fue del 01 de enero del 2023, mientras que el ultimo fue del 31 de marzo del 2023.

- **¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?**

Durante los cinco primeros días de los que se tienen registro, se atendieron un total de 308 pedidos distintos.

### 4. **Usar ambas tablas para conocer la reacción de los clientes respecto al menú.**

- **Realizar un left join entre entre order_details y menu_items con el identificador item_id(tabla order_details) y menu_item_id(tabla menu_items).**

Logramos visualizar la relación entre las ordenes y los platillos, categorías y precios de los artículos comprados. De igual forma se logró apreciar que existían un total de 137 ordenes distintas que no habían comprado ningún artículo.

### 5. **Realiza un análisis adicional utilizando este join entre las tablas. Identificando 5 puntos clave que puedan ser de utilidad para el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y utiliza los resultados obtenidos para llegar a estas conclusiones.**

- **¿Cuáles fueron los 5 platillos más vendidos?**

    ![Top5 _ventas](https://github.com/user-attachments/assets/f3abd277-a051-4c46-9c33-77c3ccd35df7)

- **¿Cuáles fueron los 3 platillos menos vendidos?**

    ![Top3_menoresvtas](https://github.com/user-attachments/assets/a035fc4b-88a7-4f6b-957a-24045a3a0b00)

- **¿Cuáles fueron los 5 platillos con mayores ventas totales?**

    ![Top5 _ventasT](https://github.com/user-attachments/assets/cb806b1a-6bbf-46bc-8468-467f1dcf943e)

- **¿Cuáles fueron los 3 platillos con menores ventas totales?**

    ![Top3_menoresvtasT](https://github.com/user-attachments/assets/c4d8a36e-4735-442b-8343-0e920f0e5d6d)

- **¿Que categorías vendierón mas platillos y acumularon la mayor cantidad de ventas totales?**

    ![Categorias_VT](https://github.com/user-attachments/assets/7431e04b-0b5c-431d-8e68-b910b6fd59a3)    ![Categorias_V](https://github.com/user-attachments/assets/c1fb7983-7dac-466a-8787-01b9286138e5)


## Conclusiones:


Derivado de la información obtenida en las tablas y consultas anteriores, se puede recomendar aumentar la cantidad de platillos y/o enfocarse en la categoría “Italian” (1er lugar en ventas totales y 2do en platillos vendidos), ya que con 522 platillos menos vendidos que la categoría “Asian” (1er lugar en platillos vendidos y 2do en ventas totales), registro 2,742.05 dólares más en ventas totales. 

De igual forma; la categoría “Asian” contine el segundo y tercer platillo con mayor cantidad de ventas y el primer y tercer platillo con mayores ventas totales registradas.

Dentro del top tres de platillos menos vendidos y con menor registro de ventas totales coinciden los Chicken Tacos y los Potstickers, por lo que se podría considerar su sustitución por algún otro platillo ya sea de las categorías con mayor utilidad o mayores ventas.

Aunque la comida de la categoría “American” es la que registra la menor cantidad de platillos vendidos y la menor cantidad en ventas totales, tres de sus platillos se encuentran en el top 5 de platillos más vendidos (1er, 4to y 5to)  así como en el top 5 de mayores ventas totales (4to y 5to), por lo que podría ser una opción viable intentar explotar más esos platillos y/o la categoría.
