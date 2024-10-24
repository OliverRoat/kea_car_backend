from sqlalchemy import Table, Column, ForeignKey, String, Double
from sqlalchemy.orm import Mapped, relationship
from db import Base
from app.resources.insurance_resource import InsuranceBaseResource, InsuranceReturnResource
from uuid import uuid4

cars_has_insurances = Table(
    'cars_has_insurances',
    Base.metadata,
    Column('cars_id', String(36), ForeignKey('cars.id'), primary_key=True, nullable=False),
    Column('insurances_id', String(36), ForeignKey('insurances.id'), primary_key=True, nullable=False),
)

class Insurance(Base):
    __tablename__ = 'insurances'
    id: Mapped[str] = Column(String(36), primary_key=True, default=lambda: str(uuid4()), index=True, nullable=False)
    name: Mapped[str] = Column(String(45), unique=True, index=True, nullable=False)
    price: Mapped[float] = Column(Double, nullable=False)

    cars = relationship('Car', secondary=cars_has_insurances, back_populates='insurances')
    
    def validate_data(self):
        InsuranceBaseResource(
            name=self.name,
            price=self.price,
        )

    def as_resource(self) -> InsuranceReturnResource:
        return InsuranceReturnResource(
            id=self.id,
            name=self.name,
            price=self.price
        )