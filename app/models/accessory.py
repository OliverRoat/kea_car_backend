# External Library imports
from uuid import uuid4
from sqlalchemy.orm import Mapped, relationship
from sqlalchemy import Table, Column, String, Double, ForeignKey
from pydantic import BaseModel, ConfigDict, Field

# Internal library imports
from db import Base
from app.resources.accessory_resource import AccessoryReturnResource


cars_has_accessories = Table(
    'cars_has_accessories',
    Base.metadata,
    Column('cars_id', String(36), ForeignKey('cars.id'), nullable=False, primary_key=True),
    Column('accessories_id', String(36), ForeignKey('accessories.id'), nullable=False, primary_key=True),
)

class AccessoryMySQLEntity(Base):
    __tablename__ = 'accessories'
    id: Mapped[str] = Column(String(36), primary_key=True, default=lambda: str(uuid4()), index=True, nullable=False)
    name: Mapped[str] = Column(String(60), unique=True, index=True, nullable=False)
    price: Mapped[float] = Column(Double, nullable=False)

    cars = relationship('CarMySQLEntity', secondary=cars_has_accessories, back_populates='accessories')


    def as_resource(self) -> AccessoryReturnResource:
        return AccessoryReturnResource(
            id=self.id,
            name=self.name,
            price=self.price
        )

class AccessoryMongoEntity(BaseModel):  # pragma: no cover
    id: str = Field(default_factory=lambda: str(uuid4()), alias="_id")
    name: str
    price: float

    model_config = ConfigDict(from_attributes=True)

    def as_resource(self) -> AccessoryReturnResource:
        return AccessoryReturnResource(
            id=self.id,
            name=self.name,
            price=self.price
        )

class AccessoryNeo4jEntity(BaseModel):  # pragma: no cover
    id: str = Field(default_factory=lambda: str(uuid4()))
    name: str
    price: float

    model_config = ConfigDict(from_attributes=True)

    def as_resource(self) -> AccessoryReturnResource:
        return AccessoryReturnResource(
            id=self.id,
            name=self.name,
            price=self.price
        )
