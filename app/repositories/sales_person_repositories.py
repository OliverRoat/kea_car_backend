# External Library imports
from sqlalchemy.orm import Session
from abc import ABC, abstractmethod
from typing import Optional, Tuple, List, cast

# Internal library imports
from app.models.sales_person import SalesPerson
from app.resources.sales_person_resource import SalesPersonReturnResource, SalesPersonCreateResource, SalesPersonLoginResource


class SalesPersonRepository(ABC):
    @abstractmethod
    def fetch_by_email(self, sales_person_login_info: SalesPersonLoginResource) -> Optional[Tuple[SalesPersonReturnResource, str]]:
        pass

    @abstractmethod
    def get_all(self) -> List[SalesPersonReturnResource]:
        pass

    @abstractmethod
    def get_by_id(self, sales_person_id: str) -> Optional[SalesPersonReturnResource]:
        pass

    @abstractmethod
    def create(self, sales_person_create_data: SalesPersonCreateResource, hashed_password: str) -> SalesPersonReturnResource:
        pass


    @abstractmethod
    def is_email_taken(self, email: str) -> bool:
        pass

class MySQLSalesPersonRepository(SalesPersonRepository):
    def __init__(self, session: Session):
        self.session = session

    def fetch_by_email(self, sales_person_login_info: SalesPersonLoginResource) -> Optional[Tuple[SalesPersonReturnResource, str]]:
        sales_person: Optional[SalesPerson] = self.session.query(SalesPerson).filter_by(email=sales_person_login_info.email).first()

        if sales_person is None:
            return None

        sales_person_resource: SalesPersonReturnResource = sales_person.as_resource()
        hashed_password: str = sales_person.hashed_password
        return sales_person_resource, hashed_password


    def get_all(self) -> List[SalesPersonReturnResource]:
        sales_people: List[SalesPerson] = cast(List[SalesPerson], self.session.query(SalesPerson).all())
        return [sales_person.as_resource() for sales_person in sales_people]


    def get_by_id(self, sales_person_id: str) -> Optional[SalesPersonReturnResource]:
        sales_person: Optional[SalesPerson] = self.session.query(SalesPerson).get(sales_person_id)
        if sales_person is None:
            return None

        return sales_person.as_resource()


    def create(self, sales_person_create_data: SalesPersonCreateResource, hashed_password: str) -> SalesPersonReturnResource:
        new_sales_person = SalesPerson(
            email=sales_person_create_data.email,
            hashed_password=hashed_password,
            first_name=sales_person_create_data.first_name,
            last_name=sales_person_create_data.last_name,
        )
        self.session.add(new_sales_person)
        self.session.commit()
        self.session.refresh(new_sales_person)

        return new_sales_person.as_resource()


    def is_email_taken(self, email: str) -> bool:
        return self.session.query(SalesPerson).filter_by(email=email).first() is not None

# Placeholder for future repositories
# class OtherDBSalesPersonRepository(SalesPersonRepository):
#     ...