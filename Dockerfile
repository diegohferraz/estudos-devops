# Especifica a imagem básica usada para gerar a nossa imagem
FROM python:3.13.0

# Cria um diretório dentro da imagem, algo como mkdir + cd
WORKDIR /app

# Copia os arquivos necessários para dentro da imagem, preciso do arquivo de requirements para instalar as dependências
COPY requirements.txt .

# Executa o comando necessário para baixar todas as dependências
RUN pip install -r requirements.txt

# Copia o restante dos arquivos para dentro da imagem, poderia ser COPY . . ja que o comando WORKDIR moveu para esta pasta
COPY . /app/

# Deixo explicito que esta porta sera usada na aplicação e portanto deixo ela exposta
EXPOSE 5000

# CMD vai ser usado somente quando rodar uma imagem e criar um container e não na criação da imagem em si
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]