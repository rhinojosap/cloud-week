
# Configuracion de Entorno


Es necesario instalar los componentes siguientes, con la finalidad de conectarse a los servicios de Kubernetes de GCP:

> gcloud 
> kubectl

#### gcloud:
Este paquete es para poder hacer la autenticacion a servicios de GCP

[Desde este link ](https://cloud.google.com/sdk/docs/quickstarts "google SDK cli install link")


#### kubectl:
Este es para conectarse a kubernetes

[Desde este link ](https://kubernetes.io/docs/tasks/tools/install-kubectl/ "Kubernetes cli install link")


## Stack de Autentication 

Anterior a la instalacion podemos continuar con la atenbticacion y la comprobacion 


### Iniciar el logging a GCP
gcloud init

Paso 1: [2] Create a new configuration

Paso 2: Configuration name: <optional>
	bbva-workshop-cloudweek

Paso 3: You must log in to continue. Would you like to log in (Y/n)?  Y

	Se abrira el explorador y debemos de autrenticarnos con la cuenta de BBVA

Paso 4: Regresamos a la terminal onde usamos el cli de gcloud y seleccionamos el proyecto: [X] cloud-week

Paso 5: Do you want to configure a default Compute Region and Zone? (Y/n)? Y

Paso 6: Which Google Compute Engine zone would you like to use as project default? 

	[7] us-central1-c

Paso 7: Ya debemos de estar autenticados, y ejecutamos el siguiemte comando con el siguiente resultado:

```bash
[rafael@rhinojosap gcp]$ kubectl get nodes 
NAME                                          STATUS   ROLES    AGE   VERSION
gke-workshop-api-default-pool-684124bb-6nnw   Ready    <none>   38m   v1.16.8-gke.15
gke-workshop-api-default-pool-684124bb-9r0l   Ready    <none>   38m   v1.16.8-gke.15
gke-workshop-api-default-pool-684124bb-sm06   Ready    <none>   38m   v1.16.8-gke.15
```


## Uso de comandos adicionales para controlar los componentes del cluster en GCP, sin embargo no se hara en generar un nuevo cluster.


### Revocar permisos de todo 
```bash
gcloud auth revoke
```

### Listar los cluster que estan Availables
```bash
gcloud container clusters list
```

### Con este comando autoconfiguramos el archivo de .kube/config
```bash
gcloud container clusters get-credentials <cluster obtenido anteriormente>   --zone <Zona >
gcloud container clusters get-credentials workshop-api --zone us-central1-c
```


