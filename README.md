# Proyecto-B-IIC3745 🎬

Repositorio usado para la entrega y construcción del proyecto B del curso 'IIC3745-Testing', consistente en un sistema de muestra de cartelera y reseva de asientos para DCCinema.

## Índice
  
-  [Descarga](#id1)
-  [Ejecución](#id2)
-  [Testing](#id3)
-  [Demo](#id4)
-  [Integrantes](#id5)

## Descarga<a name="id1"></a>

Se debe descargar el repositorio en la máquina a elección usando el siguiente comando en la consola:

```git clone https://github.com/grupo-testing/Proyecto-B.git```

En caso de tener una llave ssh, utilizar el siguiente comando:

```git@github.com:grupo-testing/Proyecto-B.git```

O descargar el repositorio como zip en el siguiente [enlace](https://github.com/grupo-testing/Proyecto-B/archive/refs/heads/main.zip).

## Ejecución<a name="id2"></a>

Para poder ejecutar el programa, se debe tener la versión 3.0.2 de ruby instalada en la máquina en la que se descargó el repositorio.

Para ejecutar el programa, se debe situar en la carpeta del proyecto *.../Proyecto-B/cinema*.

A continuación se detallan los pasos a seguir para ejecutar el programa utilizando ruby:

1. Instalar las dependendecias:

    ``` bundle install ```

2. Ejecutar la aplicación:

    ``` 
      # Correr las migraciones
      rails db:migrate
      
      # Correr las seed
      rails db:seed
      
      # Correr la aplicación
      rails server 
    ```
3. Una vez se encuentre corriendo el servidor, la aplicación se puede ver en el siguiente [link](http://localhost:3000/)
    
* En caso de ocurrir el siguiente error: 
  ![image](https://user-images.githubusercontent.com/42227724/143793854-1dc90d09-e678-4a08-b944-7c60b00ac760.png)
  
  Se debe correr el comando ```bundle exec rake webpacker:install```

## Testing<a name="id3"></a>



## Demo<a name="id4"></a>

En el siguiente [link](https://www.youtube.com/watch?v=8XUewrWYYB8) se encuentra una demo donde se puede ver el funcionamiento de`la aplicación.

## Integrantes<a name="id5"></a>

* Juan Pablo Chacón
* Macarena Concha
* Diego Echeverría
* Cristobal Muñoz
* Marcelo Saldías
