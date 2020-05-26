# Pasos a Seguir para configurar el cliente de Kubectl o Kubernetes

### Paso 1

Es requerido crear una carpeta en el home de trabajo y crear el archivo con el contenido que esta en en esta misma ruta, y debe de llamarse al igual config
```bash
mkdir -p ~/.kube
cp -vr ./config ~/.kube/
```

### Paso 2

Probar que funciona la configuracion simplemente ejecutando lo siguiente:
```bash
cd
kubectl get pods --all-namespaces
```