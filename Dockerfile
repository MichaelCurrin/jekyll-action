FROM ruby:2.7.1-slim

LABEL version="2.0.0"
LABEL repository="https://github.com/helaili/jekyll-action"
LABEL homepage="https://github.com/helaili/jekyll-action"
LABEL maintainer="Alain Hélaïli <helaili@github.com>"

COPY LICENSE README.md /

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    git

ENV BUNDLER_VERSION="${BUNDLER_V:-2.1.2}"
RUN gem install bundler -v "${BUNDLER_V:-2.1.2}"

RUN bundle config --global silence_root_warning 1

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
