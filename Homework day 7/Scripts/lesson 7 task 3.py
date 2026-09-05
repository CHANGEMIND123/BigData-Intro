# Конфигурационный словарь, полученный от сервиса инициализации.
db_config = {
    'connection': {
    'host' :'production-db.internal' ,
    'port' : 5432,
    'user' : 'postgres'
    }
}

connection = db_config.get('connection', {}) # Получаем настройки подключения. Если их нет - используем пустой словарь.

host = connection.get('host', 'localhost') # Для host - ищем ключ 'host', если нет - берем 'localhost'.

port = connection.get('port', 5432) # Для port - ищем ключ 'port', если нет - берем 5432.

ssl_mode = db_config.get('connection', {}).get('ssl_settings', {}).get('ssl_mode', 'verify-full') # Получаем ssl_mode с защитой от отсутствия ключей. По умолчанию - 'verify-full'.

connection['user'] = 'admin' # Меняем пользователя с 'postgres' на 'admin' для повышения привилегий доступа.

connection['max_connections'] = 100 # Добавляем новый параметр для ограничения максимального числа подключений к БД.

print(None)
print(f"SSL Mode: {ssl_mode}")
print("Параметры соединения:")

# Проходим по всем парам ключ-значение словаря connection и выводим их в формате "* ключ: значение".
for key, value in connection.items():
    
    print(f"* {key}: {value}")




