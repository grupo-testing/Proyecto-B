# Proyecto-B-IIC3745 馃幀

Repositorio usado para la entrega y construcci贸n del proyecto B del curso 'IIC3745-Testing', consistente en un sistema de muestra de cartelera y reseva de asientos para DCCinema.

## 脥ndice
  
-  [Descarga](#id1)
-  [Ejecuci贸n](#id2)
-  [Testing](#id3)
-  [Demo](#id4)
-  [Integrantes](#id5)

## Descarga<a name="id1"></a>

Se debe descargar el repositorio en la m谩quina a elecci贸n usando el siguiente comando en la consola:

```git clone https://github.com/grupo-testing/Proyecto-B.git```

En caso de tener una llave ssh, utilizar el siguiente comando:

```git@github.com:grupo-testing/Proyecto-B.git```

O descargar el repositorio como zip en el siguiente [enlace](https://github.com/grupo-testing/Proyecto-B/archive/refs/heads/main.zip).

## Ejecuci贸n<a name="id2"></a>

Para poder ejecutar el programa, se debe tener la versi贸n 3.0.2 de ruby instalada en la m谩quina en la que se descarg贸 el repositorio.

Para ejecutar el programa, se debe situar en la carpeta del proyecto *.../Proyecto-B/cinema*.

A continuaci贸n se detallan los pasos a seguir para ejecutar el programa utilizando ruby:

1. Instalar las dependendecias:

    ``` bundle install ```

2. Ejecutar la aplicaci贸n:

    ``` 
      # Correr las migraciones
      rails db:migrate
      
      # Correr las seed
      rails db:seed
      
      # Correr la aplicaci贸n
      rails server 
    ```
3. Una vez se encuentre corriendo el servidor, la aplicaci贸n se puede ver en el siguiente [link](http://localhost:3000/)
    
* En caso de ocurrir el siguiente error: 
  ![image](https://user-images.githubusercontent.com/42227724/143793854-1dc90d09-e678-4a08-b944-7c60b00ac760.png)
  
  Se debe correr el comando ```bundle exec rake webpacker:install```

## Testing<a name="id3"></a>

Se crearon tests para el happy path de la aplicaci贸n usando Capybara, estos tests se pueden ejecutar con el siguiente comando:

  ```
  rspec
  ```

## Demo<a name="id4"></a>

En el siguiente [link](https://www.youtube.com/watch?v=8XUewrWYYB8) se encuentra una demo donde se puede ver el funcionamiento de la aplicaci贸n.

## Integrantes<a name="id5"></a>

* Juan Pablo Chac贸n
* Macarena Concha
* Diego Echeverr铆a
* Cristobal Mu帽oz
* Marcelo Sald铆as
