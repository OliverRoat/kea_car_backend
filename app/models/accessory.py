from sqlalchemy import Table, Column, String, Double, ForeignKey
from sqlalchemy.orm import Mapped, relationship
from db import Base
from app.resources.accessory_resource import AccessoryBaseResource, AccessoryReturnResource
from uuid import uuid4

cars_has_accessories = Table(
    'cars_has_accessories',
    Base.metadata,
    Column('cars_id', String(36), ForeignKey('cars.id'), nullable=False, primary_key=True),
    Column('accessories_id', String(36), ForeignKey('accessories.id'), nullable=False, primary_key=True),
)

class Accessory(Base):
    __tablename__ = 'accessories'
    id: Mapped[str] = Column(String(36), primary_key=True, default=lambda: str(uuid4()), index=True, nullable=False)
    name: Mapped[str] = Column(String(60), unique=True, index=True, nullable=False)
    price: Mapped[float] = Column(Double, nullable=False)

    cars = relationship('Car', secondary=cars_has_accessories, back_populates='accessories')
    
    def validate_data(self):
        AccessoryBaseResource(
            name=self.name,
            price=self.price,
        )

    def as_resource(self) -> AccessoryReturnResource:
        return AccessoryReturnResource(
            id=self.id,
            name=self.name,
            price=self.price
        )