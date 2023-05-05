python -m venv .venv-$(basename `pwd`) && \
	touch ./.envrc && \
	direnv allow && \
	echo "source ./.venv-$(basename `pwd`)/bin/activate" >./.envrc && \
	echo "export VIRTUAL_ENV_BASENAME=.venv-$(basename `pwd`)" >> ./.envrc &&\
	direnv allow
