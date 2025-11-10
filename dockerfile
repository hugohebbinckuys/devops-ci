FROM node:22
# RUN adduser -D non_root_user
#je crois pas besoin de créer user car user Node de base
RUN npm install -g pnpm
WORKDIR /app
COPY *.json /app/
RUN pnpm install
COPY . /app/
EXPOSE 3000
# RUN chown -R node:node /app
# # ici on attribut les droits de propriété à l'user node et au groupe node d'avoir les droits sur /app (le groupe node existe deja dans l'image officielle node comme l'user qui existe deja aussi )
# USER node

#user node fonctionne pas encore y a un truc de droits a régler c pas encore bon
CMD [ "pnpm", "dev", "--host", "0.0.0.0"]