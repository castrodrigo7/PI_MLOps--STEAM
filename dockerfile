# Usa una imagen base de Python
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el archivo requirements.txt y main.py al contenedor
COPY requirements.txt /app
COPY main.py /app
COPY datasets/* /app
# Instala las dependencias del proyecto
RUN pip install -r requirements.txt

# Expone el puerto en el que la aplicación FastAPI se ejecutará
EXPOSE 8000

# Comando para ejecutar la aplicación FastAPI cuando se inicie el contenedor
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
