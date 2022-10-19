FROM nginx:alpine

# Define working directory
WORKDIR /app

# Install app dependencies
# COPY package.json .
# COPY yarn.lock .

# RUN yarn install --frozen-lockfile

# Bundle built app source
COPY dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

ARG VERSION=latest
ENV VERSION=${VERSION}

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

# EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]