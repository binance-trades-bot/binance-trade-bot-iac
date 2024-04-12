variable "BINANCE_API_KEY" {
  type      = string
  sensitive = true
}

variable "BINANCE_SECRET_KEY" {
  type      = string
  sensitive = true
}

variable "MONGO_CONNECT_STRING" {
  type      = string
  sensitive = true
}

variable "lambda_function_name" {
  type    = string
  default = "binance_trades"
}
