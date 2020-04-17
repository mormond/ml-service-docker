FROM ubuntu:latest 

RUN apt-get update -y
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install flask
RUN pip3 install flask_swagger_ui
RUN pip3 install sklearn

ADD server.py       /
ADD predictor.py    /
ADD swagger.py      /

ADD outputs/flags.pkl       /outputs/flags.pkl 
ADD outputs/lookup.pkl      /outputs/lookup.pkl 
ADD outputs/model.pkl       /outputs/model.pkl 
ADD outputs/metadata.json   /outputs/metadata.json 

WORKDIR /

EXPOSE 5000

CMD ["python3","server.py"]