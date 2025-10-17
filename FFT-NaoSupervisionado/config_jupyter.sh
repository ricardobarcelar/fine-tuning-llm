#!/bin/bash

CONFIG_FILE="$HOME/.jupyter/jupyter_notebook_config.py"

echo "=== Configurando Jupyter Notebook ==="

# Cria senha de acesso
jupyter notebook password

# Gera o arquivo de configuração, caso não exista
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Gerando arquivo de configuração padrão..."
    jupyter notebook --generate-config
fi

# Atualiza as configurações desejadas
echo "Aplicando ajustes no arquivo de configuração..."

# Substitui ou adiciona as linhas relevantes
sed -i "s/^#*c.NotebookApp.ip.*/c.NotebookApp.ip = '0.0.0.0'/" "$CONFIG_FILE"
sed -i "s/^#*c.NotebookApp.port.*/c.NotebookApp.port = 8888/" "$CONFIG_FILE"
sed -i "s/^#*c.NotebookApp.open_browser.*/c.NotebookApp.open_browser = False/" "$CONFIG_FILE"

# Garante que as linhas existam, mesmo que não estivessem no arquivo
grep -q "c.NotebookApp.ip" "$CONFIG_FILE" || echo "c.NotebookApp.ip = '0.0.0.0'" >> "$CONFIG_FILE"
grep -q "c.NotebookApp.port" "$CONFIG_FILE" || echo "c.NotebookApp.port = 8888" >> "$CONFIG_FILE"
grep -q "c.NotebookApp.open_browser" "$CONFIG_FILE" || echo "c.NotebookApp.open_browser = False" >> "$CONFIG_FILE"

echo "=== Configuração concluída. ==="
echo "Arquivo de configuração: $CONFIG_FILE"
