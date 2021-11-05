# meltano-heroku-docker

## Usage
**Important** steps:
1. Create a new Heroku app (but don't connect to GitHub)
2. Run `heroku stack:set container -a "your-heroku-app-name"
3. Connect to GitHub and deploy

## Recreate this repo
```
Setup the diretory:
pip install meltano
meltano init meltano-heroku && cd meltano-heroku
echo "meltano" > requirements.txt
meltano add extractor tap-gitlab
meltano add files docker
```

Then:
1. Remove the `ENTRYPOINT` from the `Dockerfile`
2. Add `heroku.yml`
3. Add the `Procfile`
