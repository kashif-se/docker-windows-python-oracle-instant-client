FROM kshfse/windows-python-oracle-instant-client
WORKDIR C:\\app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
CMD [ "python", "./app.py" ]