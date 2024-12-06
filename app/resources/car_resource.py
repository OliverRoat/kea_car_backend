# External Library imports
from typing import List, Optional
from datetime import date, timedelta
from pydantic import BaseModel, ConfigDict, UUID4, Field, field_validator

# Internal library imports
from app.resources.customer_resource import CustomerReturnResource
from app.resources.accessory_resource import AccessoryReturnResource
from app.resources.insurance_resource import InsuranceReturnResource
from app.resources.sales_person_resource import SalesPersonReturnResource
from app.resources.model_resource import (
    ModelBaseReturnResource,
    ModelReturnResource,
    ColorReturnResource
)

DAYS_TO_DEADLINE = 30

def calculate_purchase_deadline() -> date:
    return date.today() + timedelta(days=DAYS_TO_DEADLINE)

class CarBaseResource(BaseModel):
    purchase_deadline: date = Field(
        default=...,
        description="The deadline for when the car must be purchased.",
        examples=[calculate_purchase_deadline()]
    )

    model_config = ConfigDict(from_attributes=True)

class CarCreateResource(CarBaseResource):
    purchase_deadline: Optional[date] = Field(
        default_factory=calculate_purchase_deadline,
        description="The deadline for when the car must be purchased.",
        examples=[calculate_purchase_deadline()]
    )
    models_id: UUID4 = Field(
        default=...,
        description="UUID for the car's Model.",
        examples=["ed996516-a141-4f4e-8991-3edeaba81c14"]
    )
    colors_id: UUID4 = Field(
        default=...,
        description="UUID for the car's Color.",
        examples=["5e755eb3-0099-4cdd-b064-d8bd95968109"]
    )
    customers_id: UUID4 = Field(
        default=...,
        description="UUID for the car's Customer.",
        examples=["0ac1d668-55aa-46a1-898a-8fa61457facb"]
    )
    sales_people_id: UUID4 = Field(
        default=...,
        description="UUID for the car's Sales Person.",
        examples=["f9097a97-eca4-49b6-85a0-08423789c320"]
    )
    accessory_ids: List[UUID4] = Field(
        default_factory=list[UUID4],
        exclude=True, description="UUIDs for the car's Accessories.",
        examples=
        [
            ["e620ec3c-625d-4bde-9b77-f7449b6352d5","fc8f689e-9615-4cf6-9664-31400db7ebea"]
        ]
    )
    insurance_ids: List[UUID4] = Field(
        default_factory=list[UUID4],
        exclude=True,
        description="UUIDs for the car's Insurances.",
        examples=
        [
            ["8456043d-5fb0-49bf-ac2c-51567a32cc87","76b21d38-2103-4464-84f2-c87178e4a30c"]
        ]
    )

    @field_validator('accessory_ids')
    def validate_accessory_ids(cls, accessory_ids: List[UUID4]) -> List[UUID4]:
        maximum_amount_of_accessories = 10
        if len(accessory_ids) != len(set(accessory_ids)):
            raise ValueError('accessories must be unique.')
        actual_amount_of_accessories = len(accessory_ids)
        if actual_amount_of_accessories > maximum_amount_of_accessories:
            raise ValueError(f"Too many accessories by {actual_amount_of_accessories - maximum_amount_of_accessories}, "
                             f"the maximum amount of accessories is {maximum_amount_of_accessories}.")
        return accessory_ids

    @field_validator('insurance_ids')
    def validate_insurance_ids(cls, insurance_ids: List[UUID4]) -> List[UUID4]:
        if len(insurance_ids) != len(set(insurance_ids)):
            raise ValueError('insurances must be unique.')
        return insurance_ids

    @field_validator('purchase_deadline')
    def validate_purchase_deadline(cls, purchase_deadline: Optional[date]) -> date:
        if purchase_deadline is not None:
            current_date = date.today()
            if purchase_deadline == current_date:
                raise ValueError(f"The given purchase deadline '{purchase_deadline.strftime('%d-%m-%Y')}' "
                                 f"must be after the current date '{current_date.strftime('%d-%m-%Y')}'.")
            if purchase_deadline < current_date:
                raise ValueError(f"The given purchase deadline '{purchase_deadline.strftime('%d-%m-%Y')}' "
                                 f"must not be in the past of the current date '{current_date.strftime('%d-%m-%Y')}'.")
            date_of_exceeded_deadline = current_date + timedelta(days=DAYS_TO_DEADLINE+1)
            if purchase_deadline >= date_of_exceeded_deadline:
                raise ValueError(f"The given purchase deadline '{purchase_deadline.strftime('%d-%m-%Y')}' "
                                 f"must be within {DAYS_TO_DEADLINE} days from the current date '{current_date.strftime('%d-%m-%Y')}'.")
        else:
            purchase_deadline = calculate_purchase_deadline()
        return purchase_deadline

class CarBaseReturnResource(CarBaseResource):
    id: str = Field(
        default=...,
        description="The UUID for the car.",
        examples=["e7bd48c2-f1c4-4e1a-b0fc-dc09f2d8f28a"]
    )
    total_price: float = Field(
        default=...,
        description="The total price of the car, calculated when it was created.",
        examples=[10530.95]
    )
    model: ModelBaseReturnResource = Field(
        default=...,
        description="The car's Model as a ModelBaseReturnResource."
    )
    color: ColorReturnResource = Field(
        default=...,
        description="The car's Color as a ColorReturnResource."
    )
    accessories: List[AccessoryReturnResource] = Field(
        default=...,
        description="The car's Accessories as a list of AccessoryReturnResource."
    )
    insurances: List[InsuranceReturnResource] = Field(
        default=...,
        description="The car's Insurances as a list of InsuranceReturnResource."
    )

class CarReturnResource(CarBaseReturnResource):
    model: ModelReturnResource = Field(
        default=...,
        description="The car's Model as a ModelReturnResource."
    )
    customer: CustomerReturnResource = Field(
        default=...,
        description="The car's Customer as a CustomerReturnResource."
    )
    sales_person: SalesPersonReturnResource = Field(
        default=...,
        description="The car's Sales Person as a SalesPersonReturnResource."
    )
    is_purchased: bool = Field(
        default=...,
        description="Whether the car is purchased or not."
    )
