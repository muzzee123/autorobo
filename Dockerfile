##FROM nginx
##COPY nginx.conf /nginx/nginx.conf
##COPY dist /usr/share/nginx/html
##RUN chmod -R 755 /usr/share/nginx/html
##WORKDIR /var/www/html
##ADD content.tgz /var/www/html
##EXPOSE 4200
##CMD [ "npm", "start" ]

##FROM nginx
##RUN rm -rf /usr/share/nginx/html/*
##COPY /dist /usr/share/nginx/html
##RUN chown -R www-data:www-data /usr/share/nginx/html
##CMD ["nginx", "-g", "daemon off;"]


FROM node:8
USER root
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package*.json /usr/src/app
RUN npm install
COPY . .
EXPOSE 8080
CMD npm start
