FROM ruby:2.6.5

RUN apt-get update && apt-get -y install nodejs && apt-get -y install nano

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN rake db:create && rake db:migrate
 
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
