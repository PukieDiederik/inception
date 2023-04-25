SRC = srcs/docker-compose.yml
SRC_DIR = srcs

up:
	sudo docker compose --project-directory $(SRC_DIR) -f $(SRC) up -d

down:
	sudo docker compose --project-directory $(SRC_DIR) -f $(SRC) down

clean:
	sudo docker compose --project-directory $(SRC_DIR) -f $(SRC) down -v --rmi all

fclean:
	sudo docker system prune

.PHONY: clean fclean up down
	
