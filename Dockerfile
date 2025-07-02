# 1. Usa uma imagem oficial do Python como imagem base.
# A variante 'slim' é usada para manter o tamanho da imagem menor.
FROM python:3.13.4-alpine3.22

# 2. Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# 3. Copia o arquivo de dependências e instala os pacotes.
# Fazer isso em um passo separado aproveita o cache de camadas do Docker.
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip -r requirements.txt

# 4. Copia o restante do código da aplicação para o contêiner.
COPY . .

# 5. Expõe a porta em que a aplicação será executada.
EXPOSE 8000

# 6. Define o comando para iniciar a aplicação quando o contêiner for executado.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]


