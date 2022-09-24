FROM haskell:8

WORKDIR /app

# RUN cabal update && cabal install pandoc citeproc
RUN cabal update && cabal install HUnit
# ENTRYPOINT ["HUnit"]

COPY . /app 