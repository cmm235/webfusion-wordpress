Vagrant.configure("2") do |config|

  # Imagen base de Ubuntu 22.04
  config.vm.box = "ubuntu/jammy64"

  # Redirigir el puerto 8080 del PC al 80 de la VM
  # Así podrás ver WordPress en http://localhost:8080
  config.vm.network "forwarded_port", guest: 80, host: 8181

  # Carpeta compartida entre tu PC y la VM
  # "." es tu carpeta local (webfusion-proyecto)
  # "/vagrant_compartida" es cómo se verá dentro de la VM
  config.vm.synced_folder ".", "/vagrant_compartida"

  # Aprovisionamiento: ejecuta el script que instala todo
  config.vm.provision "shell", path: "provision.sh"

end
