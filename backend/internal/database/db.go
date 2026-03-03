package database

import (
	"Construction-supplies-store-db/config"
	"context"
	"github.com/jackc/pgx/v5/pgxpool"
	"log"
	"time"
)

type DbPool struct {
	*pgxpool.Pool
}

func NewDbPool(cfg *config.Config) *DbPool {
	pool, err := pgxpool.New(context.Background(), cfg.Db.Dsn)
	if err != nil {
		log.Fatal("Unable to create connection pool:", err)
	}

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	err = pool.Ping(ctx)
	if err != nil {
		log.Fatal("Unable to connect to database:", err)
	}

	log.Println("✅ Connected to PostgreSQL!")
	return &DbPool{pool}
}
