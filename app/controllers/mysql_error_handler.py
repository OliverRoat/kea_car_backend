
from typing import Callable
from fastapi import status
from sqlalchemy.exc import SQLAlchemyError
from pydantic import ValidationError
from app.controllers.error_handler import error_handler

# An error handler designed for the MySQL controllers.
def mysql_error_handler(callback: Callable, custom_exceptions: dict = {}, default_exceptions: dict = {
    SQLAlchemyError: { "status_code": status.HTTP_422_UNPROCESSABLE_ENTITY },
    ValidationError: { "status_code": status.HTTP_422_UNPROCESSABLE_ENTITY },
}):
    return error_handler(callback, custom_exceptions, default_exceptions)
