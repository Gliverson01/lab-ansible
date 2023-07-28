#!/bin/bash

# Adicione os endereços IP ou nomes de host das suas VPS a seguir
vps_list=(
    "root@167.114.98.229"
    "root@192.99.69.241"
    # Adicione mais VPS, se necessário
)

# Caminho para a chave pública que você deseja copiar
ssh_key_path="$HOME/.ssh/id_rsa.pub"

# Função para copiar a chave pública para uma VPS
copy_ssh_key() {
    vps=$1
    echo "Copiando chave pública para $vps ..."
    ssh-copy-id -i "$ssh_key_path" "$vps"
}

# Iterar sobre a lista de VPS e chamar a função para cada uma
for vps in "${vps_list[@]}"; do
    copy_ssh_key "$vps"
done

echo "Concluído!"
