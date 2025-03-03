# Utiliser l'image officielle Ruby
FROM ruby:3.4

# Installer des dépendances système
RUN apt-get update -qq && apt-get install -y build-essential nodejs npm

# Définir le répertoire de travail
WORKDIR /app  

# Copier les fichiers Gemfile et Gemfile.lock
COPY app/Gemfile app/Gemfile.lock ./

# Installer les dépendances Ruby (gemmes)
RUN bundle install

# Copier tout le code Rails
COPY app ./

# Ajouter les droits d'exécution pour le script entrypoint
RUN chmod +x /app/entrypoint.sh

# Ajout yarn au system
RUN npm install --global yarn

# Exposer le port du serveur Rails
EXPOSE 3000

# Entrée par défaut
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]