FROM node:alpine
WORKDIR /app
COPY . /app
# COPY bash_test.sh /usr/local/bin/bash_test.sh
#RUN chmod +x /usr/local/bin/bash_test.sh
#ENTRYPOINT ["bash_test.sh"]
CMD node index.js 
