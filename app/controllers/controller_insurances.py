# External Library imports
from uuid import UUID
from typing import List
from pydantic import ValidationError
from sqlalchemy.exc import SQLAlchemyError
from fastapi import APIRouter, Depends, HTTPException, Path, Body, status

# Internal library imports
from app.services import service_insurances
from db import Session, get_db as get_db_session
from app.exceptions.database_errors import UnableToFindIdError, AlreadyTakenFieldValueError
from app.repositories.insurance_repository import MySQLInsuranceRepository, InsuranceReturnResource

# These imports should come from repository, but the repo is not made for these resources,
# but to let swagger give examples of what the endpoints should do, we import them here
from app.resources.insurance_resource import InsuranceCreateResource, InsuranceUpdateResource


router: APIRouter = APIRouter()

def get_db():
    with get_db_session() as session:
        yield session

@router.get(
    path="/insurances",
    response_model=List[InsuranceReturnResource],
    response_description="Successfully retrieved list of insurances, returns: List[InsuranceReturnResource]",
    summary="Retrieve all Insurances.",
    description="Fetches all Insurances from the MySQL database and returns a list of 'InsuranceReturnResource'."
)
async def get_insurances(session: Session = Depends(get_db)):
    error_message = "Failed to get insurances from the MySQL database"
    try:
        return service_insurances.get_all(
            repository=MySQLInsuranceRepository(session)
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
    path="/insurance/{insurance_id}",
    response_model=InsuranceReturnResource,
    response_description="Successfully retrieved an insurance, returns: InsuranceReturnResource",
    summary="Retrieve a Insurance by ID.",
    description="Fetches an Insurance by ID from the MySQL database by giving a UUID in the path for the insurance and returns it as an 'InsuranceReturnResource'."
)
async def get_insurance(insurance_id: UUID, session: Session = Depends(get_db)):
    error_message = "Failed to get insurance from the MySQL database"
    try:
        return service_insurances.get_by_id(
            repository=MySQLInsuranceRepository(session),
            insurance_id=str(insurance_id)
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
    path="/insurance",
    response_model=InsuranceReturnResource,
    response_description="Successfully created an insurance, returns: InsuranceReturnResource.",
    summary="Create an Insurance - NOT BEEN IMPLEMENTED YET.",
    description="Creates an Insurance within the MySQL database by giving a request body 'InsuranceCreateResource' and returns it as an 'InsuranceReturnResource'."
)
async def create_insurance(insurance_create_data: InsuranceCreateResource, session: Session = Depends(get_db)):
    error_message = "Failed to create insurance within the MySQL database"
    try:
        raise NotImplementedError("Request POST '/mysql/insurance' has not been implemented yet.")
    except AlreadyTakenFieldValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=str(f"{error_message}: {e}")
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

@router.put(
    path="/insurance/{insurance_id}",
    response_model=InsuranceReturnResource,
    response_description="Successfully updated an insurance, returns: InsuranceReturnResource.",
    summary="Update an Insurance - NOT BEEN IMPLEMENTED YET.",
    description="Updates an Insurance within the MySQL database by giving a UUID in the path for the insurance and by giving a request body 'InsuranceUpdateResource' and returns it as an 'InsuranceReturnResource'."
)
async def update_insurance(insurance_id: UUID = Path(..., description="The UUID of the insurance to update."),
                           insurance_update_data: InsuranceUpdateResource = Body(..., title="InsuranceUpdateResource"),
                           session: Session = Depends(get_db)):
    error_message = "Failed to update insurance within the MySQL database"
    try:
        raise NotImplementedError("Request PUT '/mysql/insurance/{insurance_id}' has not been implemented yet.")
    except UnableToFindIdError as e:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=str(f"Unable To Find Id Error caught. {error_message}: {e}")
        )
    except AlreadyTakenFieldValueError as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=str(f"{error_message}: {e}")
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

@router.delete(
    path="/insurance/{insurance_id}",
    response_model=InsuranceReturnResource,
    response_description="Successfully deleted an insurance, returns: InsuranceReturnResource.",
    summary="Delete an Insurance - NOT BEEN IMPLEMENTED YET.",
    description="Deletes an Insurance within the MySQL database by giving a UUID in the path for the insurance and returns it as an 'InsuranceReturnResource'."
)
async def delete_insurance(insurance_id: UUID = Path(..., description="The UUID of the insurance to delete."),
                           session: Session = Depends(get_db)):
    error_message = "Failed to delete insurance within the MySQL database"
    try:
        raise NotImplementedError("Request DELETE '/mysql/insurance/{insurance_id}' has not been implemented yet.")
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