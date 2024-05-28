# 3. Инициализация Экземпляра: Измените класс Car,
# добавив метод __init__, который инициализирует атрибуты brand и year.
class Car:
    def __init__(self, brand, year):
        self.brand = brand
        self.year = year

# 8. Использование Суперкласса:
# Используйте функцию super() в методе __init__ класса ElectricCar.

class ElectricCar(Car):
    def __init__(self, brand, year, battery_capacity):
        super().__init__(brand, year)
        self.battery_capacity = battery_capacity

electric_car = ElectricCar("Tesla", "Model S", 100)
print(electric_car.brand)  # Output: Tesla
print(electric_car.year)  # Output: Model S
print(electric_car.battery_capacity)  # Output: 100

# 12.Исключения в Методах: Модифицируйте сеттер так,
# чтобы он выбрасывал исключение, если тип двигателя не соответствует заданным критериям.
class Car:
    def __init__(self, brand, year, engine_type):
        self.brand = brand
        self.model = year
        self.__engine_type = engine_type

    @property
    def engine_type(self):
        return self.__engine_type

    @engine_type.setter
    def engine_type(self, value):
        if value in ["electric", "gasoline", "diesel"]:
            self.__engine_type = value
        else:
            raise ValueError("Engine type must be 'electric', 'gasoline' or 'diesel'")

car = Car("Tesla", "Model S", "electric")
print(car.engine_type)

try:
    car.engine_type = "hybrid"
except ValueError as e:
    print(e)
