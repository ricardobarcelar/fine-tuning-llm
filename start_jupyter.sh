#!/bin/bash

PORT=8888
IP="0.0.0.0"

echo "=== Iniciando o Jupyter Notebook ==="
echo "IP: $IP | Porta: $PORT"

# Inicia o servidor Jupyter
jupyter notebook --no-browser --ip=$IP --port=$PORT
