FROM phusion/passenger-ruby25

# set the app directory var
ENV APP_HOME /home/app
ENV BUNDLE_PATH /bundle
WORKDIR $APP_HOME
RUN apt-get update -qq

# Install apt dependencies
RUN apt-get install -y --no-install-recommends \
  build-essential \
  curl libssl-dev \
  git \
  unzip \
  zlib1g-dev \
  libxslt-dev \
  sqlite3 \
  libsqlite3-dev \
  ruby-dev

ADD . .
EXPOSE 9393

RUN bundle install

# Configure an entry point, so we don't need to specify
# "bundle exec" for each of our commands.
ENTRYPOINT ["bundle", "exec"]

# The default command that gets ran will be to start the Unicorn server.
CMD ["shotgun", "-o", "0.0.0.0"]
