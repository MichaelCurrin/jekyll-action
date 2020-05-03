FROM ruby:2.7-alpine

LABEL version="2.0.1"
LABEL repository="https://github.com/helaili/jekyll-action"
LABEL homepage="https://github.com/helaili/jekyll-action"
LABEL maintainer="Alain Hélaïli <helaili@github.com>"

RUN apk add --no-cache git build-base

COPY Gemfile.lock /
ENV BUNDLE_VSN="$(grep -A 1 'BUNDLED WITH' Gemfile.lock | tail -n 1)"
RUN gem install bundler -v "${BUNDLE_VSN:-2.1.4}"
# debug
RUN bundle version

COPY LICENSE README.md /

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
