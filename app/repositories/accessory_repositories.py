from abc import ABC, abstractmethod
from typing import Optional, List, cast
from app.resources.accessory_resource import AccessoryReturnResource
from app.models.accessory import Accessory
from sqlalchemy.orm import Session


class AccessoryRepository(ABC):
    @abstractmethod
    def get_all(self) -> List[AccessoryReturnResource]:
        pass

    @abstractmethod
    def get_by_id(self, accessory_id: str) -> Optional[AccessoryReturnResource]:
        pass

class MySQLAccessoryRepository(AccessoryRepository):
    def __init__(self, session: Session):
        self.session = session

    def get_all(self) -> List[AccessoryReturnResource]:
        accessories: List[Accessory] = cast(List[Accessory], self.session.query(Accessory).all())
        return [accessory.as_resource() for accessory in accessories]

    def get_by_id(self, accessory_id: str) -> Optional[AccessoryReturnResource]:
        accessory: Optional[Accessory] = self.session.query(Accessory).get(accessory_id)
        if accessory is not None:
            return accessory.as_resource()
        return None

# Placeholder for future repositories
# class OtherDBAccessoryRepository(AccessoryRepository):
#     ...