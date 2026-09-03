# Поток данных телеметрии от серверов кластера.
system_telemetry = [
    ('srv_01', 12.5, 64, 'online'),
    ('srv_02', 85.0, 92, 'online'),
    ('srv_03', 0.0, 0, 'offline'),
    ('srv_04', 45.2, 78, 'online'),
    ('srv_05', 95.1, 99, 'online')
]

# Реализация конвейера агрегации метрик.
# Создание пустых списков для сбора данных активных серверов.
active_nodes = []
cpu_values = []
ram_values = []

#  Проходит по каждому кортежу с помощью for в system_telemetry и сразу распаковываем его на переменные.
for node, cpu_node, ram_usage, status in system_telemetry:

    if (status == 'online'): # Проверка: сервер находится в онлайн-состоянии.
        active_nodes.append(node) # Добавление имени сервера в список активных узлов.
        cpu_values.append(cpu_node)  # Добавление значения CPU в список для расчета среднего.
        ram_values.append(ram_usage)  # Добавление значения RAM в список для поиска максимума. 

active_count = len(active_nodes)  # Количество активных серверов (длина списка active_nodes).
avg_cpu = round(sum(cpu_values) / len(cpu_values,), 2) # Средняя загрузка CPU (сумма / количество, округление до 2 знаков).
max_ram = max(ram_values) # Максимальное значение RAM из списка ram_values.

# Помещение рассчитанных метрик в итоговый вложенный словарь.
report = {
    "active_nodes_count": active_count, # Количество активных серверов.
    "metrics" : { # Вложенный словарь с метриками.
        "average_cpu" :avg_cpu, # Средняя загрузка CPU (округлена до 2 знаков).
        "max_sum" : max # Пиковое использование RAM.
    }
} 

print(f"Active nodes in network: , active_nodes")
print("Final telemetry report:")
print(report)



