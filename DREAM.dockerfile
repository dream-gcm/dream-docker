RUN apt-get -y -q update \
 && apt-get -y -q upgrade \
 && apt-get -y -q install \
	build-essential \
	git \
	gcc \
	netcdf-bin \
	netcdf-fortran \
	ncview \
 && rm -rf /var/lib/apt/lists/*
