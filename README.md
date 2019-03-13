# rails-docker-compose


## Dockerfile

The dockerfile for the rails image. It's a standard ruby 2.5 docker image.

## docker-compose.yml 

### web
The rails application image

### db
The postgreSQL database image

### worker
The rails (sidekiq) workers

### redis
Redis is used in Actioncable, in sidekiq workers or for the rails cache.


## Makefile

The Makefile is used mainly as a knowledge keeper for the project, and secondly to install the stack.

## Note

You should create a new rails application if you start from this repo. 
The current Makefile COPY the creatred Gemfile. So it's not currently suited to create the rails app in the docker image.

```
make rails_new
make up
```

### .dockerignore

The .dockerignore file lets you ignore certain folders or files from being included inside the docker container.