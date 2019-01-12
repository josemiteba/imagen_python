##Descargamos una versión concreta de UBUNTU, a través del tag
FROM ubuntu:12.04
MAINTAINER Apasoft Formacion "apasoft.formacion@gmail.com"

##Actualizamos el sistema
RUN apt-get update
##Instalamos el sistema
RUN apt-get install -y nginx

##Creamos un fichero index.html en el directorio por defecto de nginx
ADD web/* /usr/share/nginx/www/

##Arrancamos NGINX a través de ENTRYPOINT para que no pueda ser
##modificado en la creación del contenedor
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

##Exponemos el puerto 80
EXPOSE 80

##Añadimos un volumen que nos permite compartir el directorio www con el host principal
VOLUME /usr/share/nginx/www

