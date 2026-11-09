# --- Étape 1 : build du site avec l'image officielle Hugo (extended) ---
FROM ghcr.io/gohugoio/hugo:v0.169.0 AS build

ARG THEME_REPO=https://github.com/victorprouff/hugo-blog-awesome
ARG THEME_REF=main

WORKDIR /project
COPY --chown=hugo:hugo . .

# Le thème n'est pas versionné dans le repo : on clone le fork, comme le faisait l'ancien GitHub Action
RUN rm -rf themes/hugo-blog-awesome \
    && git clone --depth 1 --branch "${THEME_REF}" "${THEME_REPO}" themes/hugo-blog-awesome

RUN hugo --minify --gc

# --- Étape 2 : service statique ---
FROM nginx:1.29.3-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /project/public /usr/share/nginx/html

EXPOSE 80
