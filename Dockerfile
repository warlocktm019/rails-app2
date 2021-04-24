FROM ruby:2.6 as builder

# install build dependencies
RUN apt-get update -qq && apt-get install -y build-essential 
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN BUNDLE_JOBS=4
RUN bundle install


FROM ruby:2.6

# install runtime dependencies
RUN apt-get update -qq && apt-get install -y nodejs
COPY --from=builder /usr/local/bundle /usr/local/bundle

ENV APP_HOME /src
ADD . $APP_HOME
WORKDIR $APP_HOME
