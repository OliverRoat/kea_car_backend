# External Library imports
from uuid import UUID
from typing import List, Optional
from pydantic import ValidationError
from sqlalchemy.exc import SQLAlchemyError
from fastapi import APIRouter, Depends, HTTPException, Path, Query, status

# Internal library imports
from app.services import cars_service as service
from db import Session, get_db as get_db_session
from app.repositories.model_repositories import MySQLModelRepository
from app.repositories.color_repositories import MySQLColorRepository
from app.repositories.insurance_repository import MySQLInsuranceRepository
from app.repositories.customer_repositories import MySQLCustomerRepository
from app.repositories.accessory_repositories import MySQLAccessoryRepository
from app.repositories.sales_person_repositories import MySQLSalesPersonRepository
from app.repositories.car_repositories import MySQLCarRepository, CarReturnResource, CarCreateResource
from app.exceptions.database_errors import UnableToFindIdError, TheColorIsNotAvailableInModelToGiveToCarError


router: APIRouter = APIRouter()

def get_db():
    with get_db_session() as session:
        yield session


@router.get(
    path="/cars",
    response_model=List[CarReturnResource],
    response_description="Successfully retrieved list of cars, returns: List[CarReturnResource]",
    summary="Retrieve all Cars.",
    description="Fetches all Cars or all Cars belonging to a customer and/or sales person from the MySQL database and returns a list of 'CarReturnResource'."
)
async def get_cars(customer_id: Optional[UUID] = Query(default=None, description="The UUID of the customer, to retrieve cars belonging to that customer."),
                   sales_person_id: Optional[UUID] = Query(default=None, description="The UUID of the sales person, to retrieve cars belonging to that sales person."),
                   is_purchased: Optional[bool] = Query(default=None, description="Set to 'true' to retrieve only purchased cars, 'false' to retrieve only cars that has not been purchased and default retrieves both purchased and non-purchased cars."),
                   is_past_purchase_deadline: Optional[bool] = Query(default=None, description="Set to 'true' to retrieve only cars past purchase deadline, 'false' to retrieve only cars that has not past the purchased deadline and default retrieves cars that is past and not past purchase deadline."),
                   session: Session = Depends(get_db)):
    error_message = "Failed to get cars from the MySQL database"
    try:
        if customer_id is not None:
            customer_id = str(customer_id)
        if sales_person_id is not None:
            sales_person_id = str(sales_person_id)
        return service.get_all(
            car_repository=MySQLCarRepository(session),
            customer_repository=MySQLCustomerRepository(session),
            sales_person_repository=MySQLSalesPersonRepository(session),
            customer_id=customer_id,
            sales_person_id=sales_person_id,
            is_purchased=is_purchased,
            is_past_purchase_deadline=is_past_purchase_deadline
        )

    except UnableToFindIdError as e:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=str(f"Unable To Find Id Error caught. {error_message}: {e}")
        )
    except SQLAlchemyError as e:
        raise HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail=str(f"SQL Error caught. {error_message}: {e}")
        )
    except ValidationError as e:
        raise HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail=str(f"Validation Error caught. {error_message}: {e}")
        )
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=str(f"Internal Server Error Caught. {error_message}: {e}")
        )

@router.get(
    path="/car/{car_id}",
    response_model=CarReturnResource,
    response_description="Successfully retrieved a car, returns: CarReturnResource",
    summary="Retrieve a Car by ID.",
    description="Fetches a Car by ID from the MySQL database by giving a UUID in the path for the car and returns it as a 'CarReturnResource'."
)
async def get_car(car_id: UUID = Path(..., description="The UUID of the car to retrieve."),
                  session: Session = Depends(get_db)):
    error_message = "Failed to get car from the MySQL database"
    try:
        return service.get_by_id(
            repository=MySQLCarRepository(session),
            car_id=str(car_id)
        )
    except UnableToFindIdError as e:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=str(f"Unable To Find Id Error caught. {error_message}: {e}")
        )
    except SQLAlchemyError as e:
        raise HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail=str(f"SQL Error caught. {error_message}: {e}")
        )
    except ValidationError as e:
        raise HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail=str(f"Validation Error caught. {error_message}: {e}")
        )
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=str(f"Internal Server Error Caught. {error_message}: {e}")
        )


@router.post(
    path="/car",
    response_model=CarReturnResource,
    response_description="Successfully created a car, returns: CarReturnResource.",
    summary="Create a Car.",
    description="Creates a Car within the MySQL database by giving a request body 'CarCreateResource' and returns it as a 'CarReturnResource'."
)
async def create_car(car_create_data: CarCreateResource, session: Session = Depends(get_db)):
    error_message = "Failed to create car within the MySQL database"
    try:
        return service.create(
            car_repository=MySQLCarRepository(session),
            customer_repository=MySQLCustomerRepository(session),
            sales_person_repository=MySQLSalesPersonRepository(session),
            model_repository=MySQLModelRepository(session),
            color_repository=MySQLColorRepository(session),
            accessory_repository=MySQLAccessoryRepository(session),
            insurance_repository=MySQLInsuranceRepository(session),
            car_create_data=car_create_data)
    except UnableToFindIdError as e:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=str(f"Unable To Find Id Error caught. {error_message}: {e}")
        )
    except TheColorIsNotAvailableInModelToGiveToCarError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=str(f"Unable To Give Entity With Value From Other Entity Error caught. {error_message}: {e}")
        )
    except SQLAlchemyError as e:
        raise HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail=str(f"SQL Error caught. {error_message}: {e}")
        )
    except ValidationError as e:
        raise HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail=str(f"Validation Error caught. {error_message}: {e}")
        )
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=str(f"Internal Server Error Caught. {error_message}: {e}")
        )

# TODO: Implement delete car so it deletes the car and all the accessories and insurances it has.
#  And give it a boolean parameter for making certain that you are certain you want to delete the car with its purchase if it has one
@router.delete(
    path="/car/{car_id}",
    response_model=CarReturnResource,
    response_description="Successfully deleted a car, returns: CarReturnResource.",
    summary="Delete a Car - NOT BEEN IMPLEMENTED YET.",
    description="Deletes a Car within the MySQL database by giving a UUID in the path for the car and returns it as a 'BrandReturnResource'."
)
async def delete_car(car_id: UUID = Path(..., description="The UUID of the car to delete."),
                     delete_purchase_too: bool = Query(default=False, description="A boolean that is default False, for if you are certain you want to delete the car with its purchase if it has one."),
                     session: Session = Depends(get_db)):
    error_message = "Failed to delete car within the MySQL database"
    try:
        raise NotImplementedError("Request DELETE '/mysql/car/{car_id}' has not been implemented yet.")
    except UnableToFindIdError as e:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=str(f"Unable To Find Id Error caught. {error_message}: {e}")
        )
    except SQLAlchemyError as e:
        raise HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail=str(f"SQL Error caught. {error_message}: {e}")
        )
    except ValidationError as e:
        raise HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail=str(f"Validation Error caught. {error_message}: {e}")
        )
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=str(f"Internal Server Error Caught. {error_message}: {e}")
        )