# Dockerfile para Jenkins con volumen persistente
Este repositorio contiene un Dockerfile que permite crear una imagen de Jenkins con un volumen persistente para almacenar los datos de Jenkins.

## Uso
Para construir la imagen, ejecuta el siguiente comando en la misma carpeta donde se encuentra el Dockerfile:

```
docker build -t mi-jenkins .
```

Esto creará una imagen llamada "jenkins" a partir del Dockerfile.

Para ejecutar un contenedor a partir de esta imagen, usa el siguiente comando:

```
docker run -p 8080:8080 -v jenkins_home:/var/jenkins_home mi-jenkins
```

Esto iniciará un contenedor con Jenkins en el puerto 8080 de tu máquina. Puedes acceder a la interfaz de usuario de Jenkins a través de un navegador web en la dirección `http://localhost:8080`.

## Dockerfile
Este es el contenido del Dockerfile:

```yaml
FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y sudo && \
    rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

VOLUME /var/jenkins_home

RUN chown -R jenkins:jenkins /var/jenkins_home

USER jenkins
```

Se utiliza la imagen de Jenkins de la versión LTS (Long-Term Support) desde el repositorio oficial de Docker Hub. Además, se instala el paquete sudo y se añade la línea jenkins ALL=NOPASSWD: ALL al archivo /etc/sudoers para permitir que el usuario jenkins ejecute comandos con sudo sin tener que introducir una contraseña. Adicionalmente, se añade una línea de comando para permitir la persistencia de la data luego de que el contenedor sea detenido o eliminado.

La primera vez que accedas a Jenkins, se te pedirá una contraseña para iniciar sesión. Esta contraseña se encuentra en la consola donde ejecutaste el comando `docker run` y se muestra en el mensaje "Please use the following password to proceed to installation:". Sigue las instrucciones en pantalla para completar la instalación de Jenkins.
