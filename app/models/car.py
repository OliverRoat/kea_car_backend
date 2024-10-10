from datetime import date
from sqlalchemy import Column, Integer, Double, Date
from sqlalchemy.orm import Mapped, relationship
from db import Base
from app.resources.car_resource import CarBaseResource, CarReturnResource


class Car(Base):
    __tablename__ = 'cars'
    id: Mapped[int] = Column(Integer, primary_key=True, autoincrement=True, index=True, nullable=False)
    total_price: Mapped[float] = Column(Double, nullable=False)
    purchase_deadline: Mapped[date] = Column(Date, nullable=False)

    def validate_data(self):
        CarBaseResource(
            total_price=self.total_price,
            purchase_deadline=self.purchase_deadline,
        )

    def as_resource(self) -> CarReturnResource:
        return CarReturnResource(
            id=self.id,
            total_price=self.total_price,
            purchase_deadline=self.purchase_deadline,
        )