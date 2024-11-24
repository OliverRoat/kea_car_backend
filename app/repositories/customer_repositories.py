# External Library imports
from abc import ABC, abstractmethod
from typing import Optional, Union, List, cast
from sqlalchemy.orm import Session

# Internal library imports
from app.models.customer import CustomerReturnResource, CustomerMySQLEntity
from app.resources.customer_resource import CustomerCreateResource, CustomerUpdateResource


class CustomerRepository(ABC):

    @abstractmethod
    def get_all(
            self,
            email_filter: Optional[str] = None,
            limit: Optional[int] = None
    ) -> List[CustomerReturnResource]:
        pass

    @abstractmethod
    def get_by_id(self, customer_id: str) -> Optional[CustomerReturnResource]:
        pass

    @abstractmethod
    def create(self, customer_create_data: CustomerCreateResource) -> CustomerReturnResource:
        pass

    @abstractmethod
    def update(
            self,
            customer_id: str,
            customer_update_data: CustomerUpdateResource
    ) -> Optional[CustomerReturnResource]:
        pass

    @abstractmethod
    def delete(self, customer_resource: CustomerReturnResource):
        pass

    @abstractmethod
    def is_email_taken(
            self,
            customer_resource: Union[CustomerUpdateResource,
            CustomerCreateResource],
            customer_id: Optional[str] = None
    ) -> bool:
        pass


class MySQLCustomerRepository(CustomerRepository):
    def __init__(self, session: Session):
        self.session = session

    def get_all(
            self,
            email_filter: Optional[str] = None,
            limit: Optional[int] = None
    ) -> List[CustomerReturnResource]:

        customers_query = self.session.query(CustomerMySQLEntity)
        if email_filter is not None and isinstance(email_filter, str):
            customers_query = customers_query.filter(CustomerMySQLEntity.email.contains(email_filter))
        if limit is not None and isinstance(limit, int) and limit > 0:
            customers_query = customers_query.limit(limit)
        customers: List[CustomerMySQLEntity] = cast(List[CustomerMySQLEntity], customers_query.all())
        return [customer.as_resource() for customer in customers]

    def get_by_id(
            self,
            customer_id: str
    ) -> Optional[CustomerReturnResource]:

        customer: Optional[CustomerMySQLEntity] = self.session.get(CustomerMySQLEntity, customer_id)
        if customer is not None:
            return customer.as_resource()
        return None

    def create(
            self,
            customer_create_data: CustomerCreateResource
    ) -> CustomerReturnResource:

        new_customer = CustomerMySQLEntity(
            email=customer_create_data.email,
            phone_number=customer_create_data.phone_number,
            first_name=customer_create_data.first_name,
            last_name=customer_create_data.last_name,
            address=customer_create_data.address,
        )
        self.session.add(new_customer)
        self.session.flush()
        self.session.refresh(new_customer)

        return new_customer.as_resource()

    def update(
            self,
            customer_id: str,
            customer_update_data: CustomerUpdateResource
    ) -> Optional[CustomerReturnResource]:

        customer: Optional[CustomerMySQLEntity] = self.session.get(CustomerMySQLEntity, customer_id)
        if customer is None:
            return None

        for key, value in customer_update_data.get_updated_fields().items():
            setattr(customer, key, value)

        self.session.flush()
        self.session.refresh(customer)

        return customer.as_resource()

    def delete(
            self,
            customer_resource: CustomerReturnResource
    ) -> None:
        self.session.query(CustomerMySQLEntity).filter_by(id=customer_resource.id).delete(
            synchronize_session=False
        )
        self.session.flush()

    def is_email_taken(
            self,
            customer_resource: Union[CustomerUpdateResource, CustomerCreateResource],
            customer_id: Optional[str] = None
    ) -> bool:
        email_query = self.session.query(CustomerMySQLEntity.id).filter_by(email=customer_resource.email)
        if customer_id is not None:
            email_query = email_query.filter(customer_id != CustomerMySQLEntity.id)
        return self.session.query(email_query.exists()).scalar()

# Placeholder for future repositories
# class OtherDBCustomerRepository(CustomerRepository):
#     ...
