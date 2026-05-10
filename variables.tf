variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "UK South"
}

variable "mysql_admin_username" {
  description = "The administrator username for the MySQL server"
  type        = string
  default     = "mysqladmin"
}

variable "mysql_admin_password_length" {
  description = "The length of the MySQL administrator password"
  type        = number
  default     = 16
}

variable "mysql_backup_retention_days" {
  description = "The number of days to retain backups for the MySQL server"
  type        = number
  default     = 7
}