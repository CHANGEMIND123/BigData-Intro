# Список ролей, переданный в запросе на авторизацию (содержит повторы).
request_roles = ['guest', 'developer', 'guest', 'admin', 'developer', 'guest']

# Набор обязательных ролей для выполнения административных функций.
required_admin_roles = {'admin', 'security_officer', 'audit_manager'}

# set() создает множество из списка, автоматически удаляя все повторяющиеся элементы.
unique_roles = set(request_roles) # Преобразование списка во множество для удаления дубликатов.

# intersection() находит элементы, которые присутствуют в обоих множествах одновременно.
common_roles  = unique_roles.intersection(required_admin_roles) # Определение общих административных ролей (пересечение множеств).

# difference() находит элементы, которые есть в первом множестве, но отсутствуют во втором.
missing_roles = required_admin_roles.difference(unique_roles)

# Проверка наличия роли security_officer через оператор in (O(1))
has_officer = 'security_officer' in unique_roles

print(f"Уникальные запрошенные роли: {unique_roles}")
print(f"Общие административные роли: {common_roles}")
print(f"Недостающие административные роли: {missing_roles}")
print(f"Наличие роли security_officer в запросе: {has_officer}")

