FROM dataiku/dss

ENV LC_ALL=en_US.utf8
ENV LANG=en_US.utf8

RUN sed -i 's/-p "$DSS_PORT"/-p "$DSS_PORT" -P python3.6/g' run.sh
RUN sed -i 's/^exec/# exec/g' run.sh


RUN echo "dss/bin/pip install great_expectations" >> run.sh

#RUN echo "source dss/pyenv/bin/activate" >> run.sh && \
#RUN echo "great_expectations init" >> run.sh && \
#RUN echo "deactivate" >> run.sh

RUN echo "exec "$DSS_DATADIR"/bin/dss run" >> run.sh

RUN cat run.sh

RUN sudo apt-get update

RUN sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

