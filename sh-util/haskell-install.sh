apt install -y libgmp-dev libgmpxx4ldbl libyaml-0-2 &&\
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh &&\
cabal install vector
