# setting up the base image
# using the base image given below as cuda10.2 is very compatible 
# with the used version of pytorch and cuDNN deep learning nn optimized 

FROM pytorch/pytorch:2.1.1-cuda10.2-cudnn7-runtime

# sets the working directory inside the container to /app
WORKDIR /app
COPY ..
# creates a seperate stage for installing dependencies efficiently
FROM base AS deps

#Cloning repo
RUN git clone https://github.com/Blink/<kunal1704>.git

# To copy all requirements and install them from the requirements.txt file
RUN pip install -r requirements.txt

FROM base

# Exposes the port
EXPOSE 8080

# Set entrypoint
ENTRYPOINT ["python", "app.py"] 
