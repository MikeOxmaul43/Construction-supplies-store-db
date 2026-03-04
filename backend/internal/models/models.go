package models

import (
	"time"
)

type Supplier struct {
	Id          uint   `json:"id"`
	CompanyName string `json:"companyName"`
	Email       string `json:"email"`
	PhoneNumber string `json:"phoneNumber"`
	Address     string `json:"address"`
}

type Category struct {
	Id          uint   `json:"id"`
	Name        string `json:"name"`
	Description string `json:"description"`
}

type Storage struct {
	Id        uint      `json:"id"`
	ProductId uint      `json:"productId"`
	Quantity  int       `json:"quantity"`
	UpdatedAt time.Time `json:"updatedAt"`
}

type Customer struct {
	Id          uint   `json:"id"`
	FirstName   string `json:"firstName"`
	LastName    string `json:"lastName"`
	Email       string `json:"email"`
	PhoneNumber string `json:"phoneNumber"`
	Address     string `json:"address"`
}

type Employee struct {
	Id          uint      `json:"id"`
	Status      string    `json:"status"`
	Date        time.Time `json:"date"`
	PhoneNumber string    `json:"phoneNumber"`
	Salary      int       `json:"salary"`
}

type Order struct {
	Id         uint      `json:"id"`
	Status     string    `json:"status"`
	Date       time.Time `json:"date"`
	EmployeeId uint      `json:"employeeId"`
	CustomerId uint      `json:"customerId"`
}

type Payment struct {
	Id            uint      `json:"id"`
	Date          time.Time `json:"date"`
	Amount        float64   `json:"amount"`
	PaymentMethod string    `json:"paymentMethod"`
	OrderId       uint      `json:"orderId"`
}

type Delivery struct {
	Id                 uint      `json:"id"`
	Date               time.Time `json:"date"`
	Comment            string    `json:"comment"`
	ExpectedTime       time.Time `json:"expectedTime"`
	RealTime           time.Time `json:"realTime"`
	CourierPhoneNumber string    `json:"courierPhoneNumber"`
	OrderId            uint      `json:"orderId"`
}

type Review struct {
	Id         uint    `json:"id"`
	Rating     float64 `json:"rating"`
	Text       string  `json:"text"`
	CustomerId uint    `json:"customerId"`
	ProductId  uint    `json:"productId"`
}

type Product struct {
	Id          uint    `json:"id"`
	Name        string  `json:"name"`
	Unit        string  `json:"unit"`
	Description string  `json:"description"`
	Price       float64 `json:"price"`
	CategoryId  uint    `json:"categoryId"`
	SupplierId  uint    `json:"supplierId"`
}
