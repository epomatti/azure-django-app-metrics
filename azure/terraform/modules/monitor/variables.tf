variable "workload" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "logs_internet_ingestion_enabled" {
  type = bool
}

variable "logs_internet_query_enabled" {
  type = bool
}

variable "appi_internet_ingestion_enabled" {
  type = bool
}

variable "appi_internet_query_enabled" {
  type = bool
}
