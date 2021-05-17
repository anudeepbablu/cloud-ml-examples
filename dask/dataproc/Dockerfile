FROM docker.io/rapidsai/rapidsai-core:0.18-cuda11.0-runtime-ubuntu18.04-py3.8

RUN source activate rapids \
    && pip install gcsfs xgboost && pip install dask-kubernetes --upgrade

# Downloading gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh --quiet
  
# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

# Google Cloud Authentication
# Make sure to get project authentication key file from google cloud service account 
#RUN gcloud auth activate-service-account --key-file k80-exploration-key.json
RUN gcloud components install kubectl 

# startup command
WORKDIR /home/anallamothu/
CMD jupyter notebook --allow-root --ip=0.0.0.0 --no-browser --NotebookApp.token=''
