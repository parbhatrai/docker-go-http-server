.PHONY = install uninstall docker_up docker_destroy docker_push

NAME = go-staticsite
INSTALL_LOCATION = /opt/${NAME}
SERVICE_SCRIPT = /etc/systemd/system/${NAME}.service
USERNAME = prabrai11
DOCKER_USERNAME = parbhat

install:
        @cp ${NAME}.service ${SERVICE_SCRIPT}
        @mkdir -p ${INSTALL_LOCATION}
        @cp app ${INSTALL_LOCATION}
        @cp -r static ${INSTALL_LOCATION}
        @systemctl daemon-reload

uninstall:
        @rm -rf ${INSTALL_LOCATION}
        @rm -rf ${SERVICE_SCRIPT}

docker_up:
	@docker build -t prabrai11/${NAME}:latest .
	@docker run -d -p 3000:3000 --name ${NAME} prabrai11/${NAME} 

docker_destroy:
	@docker stop ${NAME} 
	@docker rm ${NAME}
	@docker rmi prabrai11/${NAME

docker_push:
	@docker tag ${USERNAME}/${NAME} ${DOCKER_USERNAME}/${NAME}
	@docker push ${DOCKER_USERNAME}/${NAME}
