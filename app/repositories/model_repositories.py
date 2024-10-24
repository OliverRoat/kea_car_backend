from abc import ABC, abstractmethod
from typing import Optional, List, cast
from app.resources.model_resource import ModelReturnResource
from app.models.model import Model
from sqlalchemy.orm import Session


class ModelRepository(ABC):
    @abstractmethod
    def get_all(self) -> List[ModelReturnResource]:
        pass

    @abstractmethod
    def get_by_id(self, insurance_id: str) -> Optional[ModelReturnResource]:
        pass

class MySQLModelRepository(ModelRepository):
    def __init__(self, session: Session):
        self.session = session

    def get_all(self) -> List[ModelReturnResource]:
        models: List[Model] = cast(List[Model], self.session.query(Model).all())
        return [model.as_resource() for model in models]

    def get_by_id(self, model_id: str) -> Optional[ModelReturnResource]:
        model: Optional[Model] = self.session.query(Model).get(model_id)
        if model is not None:
            return model.as_resource()
        return None

# Placeholder for future repositories
# class OtherDBModelRepository(ModelRepository):
#     ...