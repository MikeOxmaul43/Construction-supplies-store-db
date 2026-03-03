package config

import (
	"github.com/joho/godotenv"
	"log"
	"os"
)

type Config struct {
	Db     DbConfig
	Server ServerConfig
}

type DbConfig struct {
	Dsn string
}

type ServerConfig struct {
	Port string
}

func LoadConfig() *Config {
	err := godotenv.Load("../.env")
	if err != nil {
		log.Println("Error loading .env")
	}
	return &Config{
		Db:     DbConfig{Dsn: os.Getenv("DSN")},
		Server: ServerConfig{Port: os.Getenv("PORT")},
	}
}
