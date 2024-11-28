import pytest
from app.services import brands_service
from app.exceptions.database_errors import UnableToFindIdError
from app.resources.brand_resource import BrandReturnResource

valid_brand_test_data = [
    {
        "id": "83e36635-548d-491a-9e5f-3fafaab02ba0",
    }
]


# VALID TESTS FOR get_brand_by_id
@pytest.mark.parametrize("brand_data", valid_brand_test_data)
def test_get_brand_by_id_valid(mySQLBrandRepository, brand_data):
    valid_brand_id = brand_data.get("id")
    brand = brands_service.get_by_id(repository=mySQLBrandRepository, brand_id=valid_brand_id)
    assert isinstance(brand, BrandReturnResource), "The car is not a CarReturnResource instance"
    
    assert brand.id == valid_brand_id, (
        f"The brand id {brand.id} is not the same as the expected id {valid_brand_id}"
    )

# INVALID TESTS FOR get_brand_by_id
@pytest.mark.parametrize("invalid_id, expected_error, expecting_error_message", [
    (None, TypeError, "brand_id must be of type str, not NoneType."),
    (123, TypeError, "brand_id must be of type str, not int."),
    (True, TypeError, "brand_id must be of type str, not bool."),
    ("unknown-id", UnableToFindIdError, "Accessory with ID: unknown-id does not exist."),
])
def test_get_brand_by_id_invalid_id(mySQLBrandRepository, invalid_id, expected_error, expecting_error_message):
    with pytest.raises(expected_error, match=expecting_error_message):
        brands_service.get_by_id(repository=mySQLBrandRepository, brand_id=invalid_id)

# VALID TESTS FOR get_all_brands
def test_get_all_brands_valid(mySQLBrandRepository):
    brands = brands_service.get_all(repository=mySQLBrandRepository)
    assert isinstance(brands, list), "Expected a list of BrandReturnResource instances"
    
    for brand, expected in zip(brands, valid_brand_test_data):
        assert isinstance(brand, BrandReturnResource), "Expected a BrandReturnResource instance"
        assert brand.id == expected["id"], f"Expected brand ID {expected['id']}, got {brand.id}"

# INVALID TESTS FOR get_all_brands
@pytest.mark.parametrize("invalid_repo", [None, 123, "invalid_repo", object()])
def test_get_all_brands_invalid_repository(invalid_repo):
    with pytest.raises(TypeError, match="repository must be of type BrandRepository"):
        brands_service.get_all(repository=invalid_repo)
