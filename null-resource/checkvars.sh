Deploy Spec found in template folder. Validating...
Spec file loaded:
version: 1

deploy:
  steps:
    setupVariables:
      after:
        - chmod -f +x ./*.sh
        - pip3 install --no-cache-dir -r requirements.txt # 2>&1 >/dev/null
        - ./checkvars.sh
