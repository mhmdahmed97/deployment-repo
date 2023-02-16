FROM ruby:2.7.1
RUN apt-get update && apt-get install -y nodejs
WORKDIR /app
COPY Gemfile* / 
RUN bundle install
COPY . /
EXPOSE 3000
#ENTRYPOINT[]
CMD ["rails db:create"]
CMD ["rails db:migrate"]
CMD ["rails db:seed"]
CMD ["rails", "server", "-b", "0.0.0.0"]
