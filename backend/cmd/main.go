package main

import (
	"Construction-supplies-store-db/config"
	"Construction-supplies-store-db/internal/database"
	"github.com/gofiber/fiber/v3"
	"log"
)

func main() {
	cfg := config.LoadConfig()

	db := database.NewDbPool(cfg)
	defer db.Pool.Close()

	app := fiber.New()

	log.Fatal(app.Listen(":" + cfg.Server.Port))
}
