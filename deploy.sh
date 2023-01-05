fission spec init
fission env create --spec --name onb-br-enum-gender-env --image nexus.sigame.com.br/fission-onboarding-br-enum-gender:0.1.1 --poolsize 0 --version 3 --imagepullsecret "nexus-v3" --spec
fission fn create --spec --name onb-br-enum-gender-fn --env onb-br-enum-gender-env --code fission.py --targetcpu 80 --executortype newdeploy --maxscale 3 --requestsperpod 10000 --spec
fission route create --spec --name onb-br-enum-gender-rt --method GET --url /enum/gender --function onb-br-enum-gender-fn
